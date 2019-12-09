<?php
require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "serialize_game.php";

$num_players= get_num_players_playing();
$game_id= get_playing_game_id();
$game=new Deal($num_players);
$str= get_game_object($game_id);
$game= unserialize($str);
$game->deckOfCards();
$game->shuffle();
//print_r($game->getDCards());
//
//for($i=0;$i<MAXCRDS;$i++){
//    $game->getDCards()[$i]->displayCard();
//}
update_game_object($game_id, $game);