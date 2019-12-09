<?php

function update_game_object($game_id,$game){
    require './loginMysql_1.php';
    $str=serialize($game);
    $query="UPDATE entity_game SET game_object='$str' WHERE game_id=$game_id";
    $result=$link->query($query);
    if(!$result) echo "SAVE GAME OBJECT failed!";
}

function get_game_object($game_id){
    require './loginMysql_1.php';
    $query="SELECT game_object FROM entity_game WHERE game_id=$game_id";
    $result=$link->query($query);
    if(!$result) echo "GET GAME OBJECT failed!";
    $rows=$result->num_rows;
    for($j=0;$j<$rows;$j++){
        $row=$result->fetch_array(MYSQLI_ASSOC);
    }
    $str=$row['game_object'];
    
    return $str;
}
