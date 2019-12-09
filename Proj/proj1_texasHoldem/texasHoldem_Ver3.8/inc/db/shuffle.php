<?php
require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "serialize_game.php";

$num_players= get_num_players_playing();
//echo $num_players;
$game_id= get_playing_game_id();
//echo $game_id;
$game=new Deal($num_players);
//echo $game->getNumP();
$str= get_game_object($game_id);
//echo $str;
$game->
$game= unserialize($str);
$game->deckOfCards();
$game->shuffle();
//print_r($game->getNumP());
//
//for($i=0;$i<MAXCRDS;$i++){
//    $game->getDCards()[$i]->displayCard();
//}
update_game_object($game_id, $game);