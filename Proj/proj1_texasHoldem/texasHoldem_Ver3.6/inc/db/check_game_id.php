<?php

function check_game_id(){
    require './loginMysql_1.php';
    $query="SELECT game_id FROM entity_game WHERE status=1";
    $result=mysqli_query($link,$query);
    $rows=mysqli_num_rows($result);
    $row=mysqli_fetch_array($result,MYSQLI_ASSOC);
    
    return $row['game_id'];
}

function check_game_status($num){
    require './loginMysql_1.php';
    $query="SELECT status FROM entity_game WHERE status=1";
    $result=mysqli_query($link,$query);
    $rows=mysqli_num_rows($result);
    if(!$rows) {
        $row=mysqli_fetch_array($result,MYSQLI_ASSOC);
        return $row['game_id'];    
    }
    else return -1;
}