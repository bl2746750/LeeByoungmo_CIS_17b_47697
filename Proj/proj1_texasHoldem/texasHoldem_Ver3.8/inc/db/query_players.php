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
    $query="UPDATE entity_users SET status=2, last_activity=now() WHERE user_id=$user_id";
    $result=$link->query($query);
    if(!$result) die("Failed to make user as a player");
}

function get_players($game_id){
    require './loginMysql_1.php';
    $p=array();
    $query ="SELECT * FROM entity_users"
            . " WHERE status=2 "
            . "ORDER BY last_activity ASC";
    $result=$link->query($query);
    if(!$result) die("Failed to retrieve user info");
    $rows=$result->num_rows;
    for($i=0;$i<$rows;$i++){
        $row=$result->fetch_array(MYSQLI_ASSOC);
        $p[$i]=new Player();
        $p[$i]->setPlayer($row['user_id'],$row['user_name'], $row['balance'],$i);
        $p_id=$p[$i]->getPId();
        $u_id=$p[$i]->getUId();
        $pName=$p[$i]->getPName();
        $balance=$p[$i]->getBal();
        ready_player_to_play($game_id, $u_id, $p_id,$balance);
        
    }
    
    return $p;
}

function ready_player_to_play($game_id,$u_id,$p_id, $balance){
    require './loginMysql_1.php';
    $query="INSERT INTO xref_play_game VALUES (NULL,$game_id,$u_id,$p_id,0,1,$balance)";
    $result=$link->query($query);
    if(!$result) die("Can't update player_id");
}