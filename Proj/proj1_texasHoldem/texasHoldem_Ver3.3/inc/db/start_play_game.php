<?php

include "join_game.php";
include "check_game_id.php";
include "user_board.php";
require './loginMysql_1.php';


//session_start();
//echo $rows;

$game=new Deal($rows);
$game->setPlayers($p);
$game->setLoc($rows);
$game_id= check_game_id();
//echo $game_id;
//print_r($game->players);

for($i=0;$i<$rows;$i++){
//    echo "<br>".$game_id."<br>";
    $email=$game->getPlayers()[$i]->getPName();
//    echo $email."<br>";
    $user_id=$game->getPlayers()[$i]->getUId();
//    echo $user_id."<br>";
    $msg_loc=$game->getPlayers()[$i]->getUMloc();
//    echo $msg_loc."<br>";
    $balance=$game->getPlayers()[$i]->getBal();
    $num=$i+1;
//    echo $num;
    $msg= user_board_tag($i);
//    $msg="abc";
//    $msg=mysql_fix_string($link, $msg);
//    echo $msg."<br />";
    $query="INSERT INTO xref_message_board (game_id,user_id,msg_loc,message)"
            . " VALUES($game_id,$user_id,'$msg_loc','$msg')";
    $stmt= mysqli_prepare($link, $query);
    mysqli_stmt_execute($stmt);
    echo mysqli_error($link);
    
   $query="UPDATE entity_users SET status=2 WHERE user_id=$user_id";
   $stmt= mysqli_prepare($link, $query);
   mysqli_stmt_execute($stmt);
   echo mysqli_error($link);
}

function mysql_fix_string($link,$string){
    if(get_magic_quotes_gpc()) $string= stripslashes ($string);
    return $link->real_escape_string($string);
}

function createGame(){
    require 'inc/db/loginMysql.php';
    $query="INSERT INTO entity_game VALUES (NULL,0,0,NULL,1)";
    $result=$link->query($query);
    if(!$result) echo "CREATE GAME failed!";
}    
?>