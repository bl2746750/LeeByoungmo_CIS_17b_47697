<?php

function get_user_info($user_id){ //user_name, balance
    require 'loginMysql_1.php';
    $query="SELECT user_name, balance FROM entity_users WHERE user_id=$user_id";
    $result=$link->query($query);
    if($result){
        $row=$result->fetch_array(MYSQLI_ASSOC);
    }
    return $row;
}

function get_player_info($game_id,$user_id){
    require 'loginMysql_1.php';
    $query="SELECT user_name, balance FROM entity_user WHERE user_id=$user_id";
    $result=$link->query($query);
    if($result){
        $row=$result->fetch_array(MYSQLI_ASSOC);
    }
    return $row;
}
function get_num_players_playing(){
    require './loginMysql_1.php';

    $query="SELECT num_players FROM entity_game WHERE status=1";
    $result=$link->query($query);
    if($result){
        $rows=$result->num_rows;
        $row=$result->fetch_array(MYSQLI_ASSOC);
        return $row['num_players'];
    }
    else {echo "fail to get num_players";}
}

function get_num_players_playing_by_game_id($game_id){
    require './loginMysql_1.php';

    $query="SELECT num_players FROM entity_game WHERE game_id=$game_id";
    $result=$link->query($query);
    if($result){
        $rows=$result->num_rows;
        $row=$result->fetch_array(MYSQLI_ASSOC);
    }
    
    return $row['num_players'];
}

function get_num_players_ready(){
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

function get_players_info_by_game_id_and_p_id($game_id, $p_id){
    require './loginMysql_1.php';
    $query="SELECT * FROM xref_play_game WHERE game_id=$game_id and p_id=$p_id";
    $result= mysqli_query($link, $query);
    $row=mysqli_fetch_array($result,MYSQLI_ASSOC);
    
    return $row;
}
function get_user_status($user_id){
    require './loginMysql_1.php';
    $query="SELECT status FROM entity_users WHERE user_id=$user_id";
    $result=$link->query($query);
    if(!$result) die("Failed to check user status");
    $row=$result->fetch_array(MYSQLI_ASSOC);
    return $row['status'];
}

function update_session_player_ready($user_id){
    //When join_game.php
    require './loginMysql_1.php';
    
    $query="UPDATE entity_users SET status=2, last_activity=now() WHERE user_id=$user_id";
    $result=$link->query($query);
    if(!$result) die("Failed to make user as a player");
    
    return true;
}

function update_players_cards($game_id,$p_id, $p_cards){
    require './loginMysql_1.php';
    $query="UPDATE xref_play_game SET p_cards='$p_cards' WHERE game_id=$game_id and p_id=$p_id";
    $result=$link->query($query);
    if(!$result) die("Failed to update players' cards");
    
}
function create_players($game_id){
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
        players_status_change_to_play($u_id);
        
    }
    
    return $p;
}

function retrieve_players($game_id){
    require './loginMysql_1.php';
    $p=array();
    $query ="SELECT * FROM xref_play_game"
            . " WHERE game_id=$game_id ";
    $result=$link->query($query);
    if(!$result) die("Failed to retrieve user info");
    $rows=$result->num_rows;
    for($i=0;$i<$rows;$i++){
        $row=$result->fetch_array(MYSQLI_ASSOC);
        $player=get_user_info($row['user_id']);
        $p[$i]=new Player();
        $p[$i]->setPlayer($row['user_id'],$player['user_name'], $player['balance'],$i);
        $p_id=$p[$i]->getPId();
        $u_id=$p[$i]->getUId();
        $pName=$p[$i]->getPName();
        $balance=$p[$i]->getBal();
    }
    
    return $p;
}

function ready_player_to_play($game_id,$u_id,$p_id, $balance){
    require './loginMysql_1.php';
    $query="INSERT INTO xref_play_game VALUES (NULL,$game_id,$u_id,$p_id,0,1,NULL)";
    $result=$link->query($query);
    if(!$result) die("Can't update player_id");
}

function players_status_change_to_play($u_id){
    require './loginMysql_1.php';
    $query="UPDATE entity_users SET status=3 WHERE user_id=$u_id";
    $result=$link->query($query);
    if(!$result) echo "User's Status Change Failed";
}