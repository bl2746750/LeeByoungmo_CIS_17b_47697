<?php
require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "serialize_game.php";

$num_players= get_num_players_playing();
echo $num_players."<br />";
$game_id= get_playing_game_id();
$game=new Deal($num_players);
$str= get_game_object($game_id);
echo $str;
$game= unserialize($str);
//echo $game->getNumP()."<br />";
$game->setBlind();
$game->setActiveNumPlayers();
$game->setLoc($num_players);
$game->preflop();

//print_r($game->players);
update_game_object($game_id, $game);