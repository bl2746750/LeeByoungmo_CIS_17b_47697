<?php


function get_num_players_playing(){
    require './loginMysql_1.php';

    $query="SELECT * FROM entity_users WHERE status=2";
    $result=$link->query($query);
    if($result){
        $rows=$result->num_rows;
        $num_players=$rows;
    }
    $_SESSION['num_players']=$num_players;

    return $num_players;
}

function get_num_players_ready(){
    require './loginMysql_1.php';
    $query="SELECT * FROM entity_users WHERE status=1";
    $result=$link->query($query);
    if($result){
        $rows=$result->num_rows;
        $num_players=$rows;
    }
    $_SESSION['num_players']=$num_players;

    return $num_players;
}

function update_session_player_ready($user_id){
    //When join_game.php
    require './loginMysql_1.php';
    $query="UPDATE entity_users SET status=1,last_activity=now() WHERE user_id=$user_id";
    $result=$link->query($query);
    if(!$result) die("Failed to make user as a player");
}

function get_players(){
    require './loginMysql_1.php';
    $p=array();
    $query ="SELECT * FROM entity_users"
            . " WHERE status=1 "
            . "ORDER BY last_activity ASC";
    $result=$link->query($query);
    if(!$result) die("Failed to retrieve user info");
    $rows=$result->num_rows;
    for($i=0;$i<$rows;$i++){
        $row=$result->fetch_array(MYSQLI_ASSOC);
        $p[$i]=new Player();
        $p[$i]->setPlayer($row['user_id'],$row['email'], $row['balance'],$i);
        $p_id=$p[$i]->getPId();
        $u_id=$p[$i]->getUId();
        $pName=$p[$i]->getPName();
        ready_player_to_play($u_id, $p_id);
        
    }
    
    return $p;
}

function ready_player_to_play($u_id,$p_id){
    require './loginMysql_1.php';
    $query="UPDATE entity_users SET p_id=$p_id,status=2 WHERE user_id=$u_id";
    $result=$link->query($query);
    if(!$result) die("Can't update player_id");
}