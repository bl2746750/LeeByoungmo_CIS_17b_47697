<?php

require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "retrieve_game_class.php";

session_start();
$bet=$_POST['raise'];
$game_id= get_playing_game_id();
$num= get_num_players_playing_by_game_id($game_id);
$game= retrieve_game_class($game_id);
$betting_order= retrieve_betting_order($game_id);
$game->setBettingOrder($betting_order);
$game->setNewOffer();
$newOffer=$game->getNewOffer();
//echo $newOffer;
//echo $game->getBettingOrder();
$bet+=$newOffer;
$user_id= get_user_id($game_id, $betting_order);
$game->players[$betting_order]->bet($bet);
update_balance_calculate($game_id, $user_id, $bet);

$betting_order++;
if($betting_order>=$num) $betting_order%=$num;
//echo $betting_order."<br />";
update_betting_order($game_id, $betting_order);

$bet_nth= retrieve_bet_nth($game_id);
update_bet_nth($game_id, ++$bet_nth);

