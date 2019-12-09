<?php

function joinGame($user_id) {
    require 'inc/db/loginMysql.php';
    $query = "UPDATE entity_user SET status=1 WHERE user_id=$user_id";
    $result=$link->query($query);
    if(!$result) die("Can't Join a Game!!!");
    $query ="SELECT * FROM entity_user WHERE status=1";
    $result=$link->query($query);
    $rows=$result->num_rows;
    $p_id=$rows;
    $_SESSION['p_id']=$p_id;
    $query="UPDATE entity_user SET p_id=`$p_id` WHERE user_id=$user_id";
    $result=$link->query($query);
    if(!$result) die("Can't update player_id");
    $query = "SELECT * FROM entity_game WHERE status=1";
    $result = $link->query($query);
    if (!$result)
        die("Database access failed2");
    $rows = $result->num_rows;

    if (!$rows) {
        $create_game=createGame();
    }
    $query = "SELECT * FROM entity_game WHERE status=1";
    $result = $link->query($query);
    if (!$result) die("Database access failed2");
    $rows = $result->num_rows;
    
    $row = $result->fetch_array(MYSQLI_ASSOC);
    $game_id = $row['game_id'];
    $_SESSION['game_id'] = $game_id;
}

function createGame(){
        require 'inc/db/loginMysql.php';
        $query="INSERT INTO entity_game VALUES (NULL,0,0,NULL,1)";
        $result=$link->query($query);
        if(!$result) echo "CREATE GAME failed!";
}
?>

