<?php
// advance.php
require 'db_connect.php';

header('Content-Type: application/json');

// Only accept POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode([
        'status'  => 'error',
        'message' => 'Invalid request method.'
    ]);
    exit;
}

$game_id = $_POST['game_id'] ?? null;
$token   = $_POST['token']   ?? null;
$option  = $_POST['option']  ?? null; // 1 => (pair_1a, pair_1b), 2 => (pair_2a, pair_2b), 3 => (pair_3a, pair_3b)

// Basic validation
if (!$game_id || !$token || !$option) {
    echo json_encode([
        'status'  => 'error',
        'message' => 'Game ID, player token, and option are required.'
    ]);
    exit;
}

try {
    // 1) Fetch player & game info
    $stmt = $db->prepare("
        SELECT 
            p.id AS player_id,
            g.current_turn_player,
            g.status,
            g.player1_id,
            g.player2_id
        FROM players p
        JOIN games g ON g.id = :game_id
        WHERE p.player_token = :token
    ");
    $stmt->execute([
        ':game_id' => $game_id,
        ':token'   => $token
    ]);
    $playerData = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$playerData) {
        echo json_encode([
            'status'  => 'error',
            'message' => 'Invalid game ID or token.'
        ]);
        exit;
    }

    $player_id           = $playerData['player_id'];
    $current_turn_player = $playerData['current_turn_player'];
    $game_status         = $playerData['status'];
    $player1_id          = $playerData['player1_id'];
    $player2_id          = $playerData['player2_id'];

    // 2) Validate game status & turn
    if ($game_status !== 'in_progress') {
        echo json_encode([
            'status'  => 'error',
            'message' => 'The game is not in progress.'
        ]);
        exit;
    }
    if ($player_id != $current_turn_player) {
        echo json_encode([
            'status'  => 'error',
            'message' => 'It is not your turn.'
        ]);
        exit;
    }

    // 3) Fetch the last dice roll with has_rolled=1 for THIS player
    $stmt = $db->prepare("
        SELECT 
            pair_1a, pair_1b,
            pair_2a, pair_2b,
            pair_3a, pair_3b,
            has_rolled
        FROM dice_rolls
        WHERE game_id = :game_id
          AND player_id = :player_id
        ORDER BY roll_time DESC
        LIMIT 1
    ");
    $stmt->execute([
        ':game_id'   => $game_id,
        ':player_id' => $player_id
    ]);
    $diceRoll = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$diceRoll) {
        echo json_encode([
            'status'  => 'error',
            'message' => 'No dice roll found. You must roll before advancing.'
        ]);
        exit;
    }
    if ($diceRoll['has_rolled'] != 1) {
        echo json_encode([
            'status'  => 'error',
            'message' => 'You must roll again before advancing.'
        ]);
        exit;
    }

    // 4) Determine columns from chosen option
    $optionMap = [
        1 => [$diceRoll['pair_1a'], $diceRoll['pair_1b']],
        2 => [$diceRoll['pair_2a'], $diceRoll['pair_2b']],
        3 => [$diceRoll['pair_3a'], $diceRoll['pair_3b']]
    ];
    if (!isset($optionMap[$option])) {
        echo json_encode([
            'status'  => 'error',
            'message' => 'Invalid pair option.'
        ]);
        exit;
    }

    // If both sums are the same column, we increment by 2 (or more).
    $selectedPair = $optionMap[$option];
    $colCounts    = array_count_values($selectedPair);

    $messages        = [];
    $didAdvance      = false;
    $columnsWonThisAdvance = []; // track newly-won columns

    foreach ($colCounts as $colNum => $count) {
        // 1) Check if the column even exists
        $stmtC = $db->prepare("
            SELECT max_height 
            FROM columns 
            WHERE column_number = :col
        ");
        $stmtC->execute([':col' => $colNum]);
        $columnInfo = $stmtC->fetch(PDO::FETCH_ASSOC);

        if (!$columnInfo) {
            $messages[] = "Column $colNum does not exist.";
            continue;
        }
        $maxHeight = (int)$columnInfo['max_height'];

        // 2) Check if the column is already won by ANY player
        $stmtWon = $db->prepare("
            SELECT 1
            FROM player_columns
            WHERE game_id = :game_id
              AND column_number = :col_num
              AND is_won = 1
        ");
        $stmtWon->execute([
            ':game_id' => $game_id,
            ':col_num' => $colNum
        ]);
        if ($stmtWon->fetchColumn()) {
            $messages[] = "Column $colNum has already been won. Skipping.";
            continue;
        }

        // 3) Enforce up to 3 distinct columns for THIS player's turn
        $stmtCount = $db->prepare("
            SELECT COUNT(DISTINCT column_number)
            FROM turn_markers
            WHERE game_id = :game_id
              AND player_id = :player_id
        ");
        $stmtCount->execute([
            ':game_id'   => $game_id,
            ':player_id' => $player_id
        ]);
        $distinctCount = $stmtCount->fetchColumn();

        // Check if colNum is already in this player's turn_markers
        $stmtCheck = $db->prepare("
            SELECT temp_progress
            FROM turn_markers
            WHERE game_id = :game_id
              AND player_id = :player_id
              AND column_number = :col
        ");
        $stmtCheck->execute([
            ':game_id'   => $game_id,
            ':player_id' => $player_id,
            ':col'       => $colNum
        ]);
        $markerRow = $stmtCheck->fetch(PDO::FETCH_ASSOC);

        $alreadyUsed = (bool)$markerRow;
        if ($distinctCount >= 3 && !$alreadyUsed) {
            $messages[] = "Cannot add a 4th distinct column ($colNum). Skipped.";
            continue;
        }

        // 4) Insert/update turn_markers for THIS player, increment by $count
        $stmtIns = $db->prepare("
            INSERT INTO turn_markers (game_id, player_id, column_number, temp_progress)
            VALUES (:game_id, :player_id, :col_num, :cnt)
            ON DUPLICATE KEY UPDATE 
                temp_progress = temp_progress + :cnt
        ");
        $stmtIns->execute([
            ':game_id'   => $game_id,
            ':player_id' => $player_id,
            ':col_num'   => $colNum,
            ':cnt'       => $count
        ]);

        $didAdvance = true;

        // 5) Now check combined progress -- *only* for THIS player's progress
        $stmtProg = $db->prepare("
            SELECT 
                IFNULL(pc.progress,0) AS perm_progress,
                tm.temp_progress
            FROM columns c
            -- Only join pc for THIS player to avoid "stealing" progress from other players
            LEFT JOIN player_columns pc
                   ON pc.column_number = c.column_number
                  AND pc.game_id      = :game_id
                  AND pc.player_id    = :player_id
            LEFT JOIN turn_markers tm
                   ON tm.column_number = c.column_number
                  AND tm.game_id      = :game_id
                  AND tm.player_id    = :player_id
            WHERE c.column_number = :col_num
            LIMIT 1
        ");
        $stmtProg->execute([
            ':game_id'   => $game_id,
            ':player_id' => $player_id,
            ':col_num'   => $colNum
        ]);
        $row = $stmtProg->fetch(PDO::FETCH_ASSOC);

        if ($row) {
            $combined = (int)$row['perm_progress'] + (int)$row['temp_progress'];

            // Check if this newly combined progress finishes the column
            if ($combined >= $maxHeight) {
                // Mark it as won for THIS player
                $stmtWin = $db->prepare("
                    INSERT INTO player_columns (game_id, player_id, column_number, progress, is_won)
                    VALUES (:game_id, :player_id, :col_num, :new_progress, 1)
                    ON DUPLICATE KEY UPDATE 
                        is_won   = 1,
                        progress = GREATEST(progress, :new_progress)
                ");
                $stmtWin->execute([
                    ':game_id'     => $game_id,
                    ':player_id'   => $player_id,
                    ':col_num'     => $colNum,
                    ':new_progress'=> $maxHeight
                ]);

                $messages[] = "Column $colNum is now won and cannot be advanced further.";
                $columnsWonThisAdvance[] = $colNum;

            } else {
                // If not finished
                if ($count > 1) {
                    $messages[] = "Advanced temporary marker on column $colNum ($count times).";
                } else {
                    $messages[] = "Advanced temporary marker on column $colNum.";
                }
            }
        }
    }

    // 6) If at least one column advanced, reset has_rolled=0
    if ($didAdvance) {
        $stmt = $db->prepare("
            UPDATE dice_rolls
            SET has_rolled = 0
            WHERE game_id   = :game_id
              AND player_id = :player_id
            ORDER BY roll_time DESC
            LIMIT 1
        ");
        $stmt->execute([
            ':game_id'   => $game_id,
            ':player_id' => $player_id
        ]);
    } else {
        echo json_encode([
            'status'  => 'error',
            'message' => implode(' ', $messages) ?: 'No valid columns were advanced.'
        ]);
        exit;
    }

    // 7) Check if the user now has 3 columns total
    //    This logic matches your original approach
    if (!empty($columnsWonThisAdvance)) {
        $stmtCheck3 = $db->prepare("
            SELECT COUNT(*) 
            FROM player_columns
            WHERE game_id   = :game_id
              AND player_id = :player_id
              AND is_won    = 1
        ");
        $stmtCheck3->execute([
            ':game_id'   => $game_id,
            ':player_id' => $player_id
        ]);
        $totalWon = (int)$stmtCheck3->fetchColumn();

        if ($totalWon >= 3) {
            // Gather all columns the player has won
            $stmtCols = $db->prepare("
                SELECT column_number
                FROM player_columns
                WHERE game_id   = :game_id
                  AND player_id = :player_id
                  AND is_won    = 1
            ");
            $stmtCols->execute([
                ':game_id'   => $game_id,
                ':player_id' => $player_id
            ]);
            $allWonCols = $stmtCols->fetchAll(PDO::FETCH_COLUMN);

            // Mark the game completed
            $stmtEnd = $db->prepare("
                UPDATE games
                SET status = 'completed',
                    winner_id = :player_id
                WHERE id = :game_id
            ");
            $stmtEnd->execute([
                ':player_id' => $player_id,
                ':game_id'   => $game_id
            ]);

            echo json_encode([
                'status'  => 'success',
                'message' => "You have won the game with columns " 
                              . implode(', ', $allWonCols) 
                              . "! Congratulations!"
            ]);
            exit;
        }
    }

    // 8) Return success with normal messages
    echo json_encode([
        'status'  => 'success',
        'message' => implode(' ', $messages)
    ]);

} catch (Exception $e) {
    echo json_encode([
        'status'  => 'error',
        'message' => 'An error occurred: ' . $e->getMessage()
    ]);
}
?>
