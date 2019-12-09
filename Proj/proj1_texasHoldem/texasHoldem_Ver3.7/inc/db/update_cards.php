<?php

require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "serialize_game.php";

session_start();

$user_id=$_SESSION['user_id'];
$num_players= get_num_players_playing();
$game_id= get_playing_game_id();
$game=new Deal($num_players);
$str= get_game_object($game_id);
$game= unserialize($str);

$cards_info=array();


//print_r($game->getCardDisplay());
//echo '<br /><br />';

$game->showBackDisplay($user_id);

//print_r($game->getCardDisplay());



//$sb=$game->getSB();
//for($i=$sb,$j=0;$j<$num_players;++$i,++$j){
//    if($i==$num_players) {$i%=$num_players;}
//    print_r($game->players[$i]->getMyCards());
//    echo '<br /><br />';
//}

$output_json= json_encode($game->getCardDisplay());
echo $output_json;