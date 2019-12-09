<?php

function joinGame($user_id) {
    require 'inc/db/loginMysql.php';
    $query = "SELECT * FROM entity_game WHERE status=1";
    $result = $link->query($query);
    if (!$result)
        die("Database access failed2");
    $rows = $result->num_rows;

    if (!$rows) {
        $this->createGame();
    } else {
        $row = $result->fetch_array(MYSQLI_ASSOC);
        $player_num = $row['num_player'];
        $game_id = $row['game_id'];
        $_SESSION['game_id'] = $game_id;
        if ($player_num < 8) {
            $query = "UPDATE entity_game SET num_player=$player_num+1 WHERE game_id='$game_id'";
            $result = $link->query($query);
            if (!$result)
                echo "entity_game num of player is not updated";
            $player_num = $row['num_player'];
            $query = "INSERT INTO xref_pot_transaction VALUES (NULL,'$game_id','$user_id', NULL,'$player_num')";
            $result = $link->query($query);
            if (!$result)
                echo "xref_pot_transaction insert failed";
        } else
            echo "Table is full!";
    }
    return $game_id;
}

function createGame(){
        require 'inc/db/loginMysql.php';
        $query="INSERT INTO entity_game VALUES (NULL,0,0,NULL,1)";
        $result=$link->query($query);
        if(!$result) echo "CREATE GAME failed!";
}
?>