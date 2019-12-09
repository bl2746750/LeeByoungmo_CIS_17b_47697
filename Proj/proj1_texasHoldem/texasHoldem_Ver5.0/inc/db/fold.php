<?php

require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "retrieve_game_class.php";

session_start();

$game_id= get_playing_game_id();
$num= get_num_players_playing_by_game_id($game_id);
$game= retrieve_game_class($game_id);

//$betting_order=$game->getBettingOrder();
//echo $betting_order."<br />";
$betting_order= retrieve_betting_order($game_id);
$bet_nth= retrieve_bet_nth($game_id);
//echo $betting_order;
//$betting_order=$game->getBettingOrder();
//echo $betting_order;
$game->players[$betting_order]->setInactive();
$game->players[$betting_order]->setULoc("111","111");
update_players_inactive($game_id,$betting_order);
$num_active_players=$game->getActiveNumPlayers();
update_bet_nth($game_id, $bet_nth++);
$game->incrementBettingOrder();
$betting_order=$game->getBettingOrder();
update_betting_order($game_id, $betting_order);
if($num_active_players==1) {
   echo -1;
}