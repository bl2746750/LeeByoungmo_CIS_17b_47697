<?php

require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "retrieve_game_class.php";


session_start();


$game_id= get_playing_game_id();
$game= retrieve_game_class($game_id);
$num=$game->getNumP();
//echo $num;
//print_r($game);

$game= retrieve_game_class($game_id);

$game->flop();
//print_r($game->getCommCards());
//print_r($game->getCardDisplay());
$p_cards=array();
$game->setPCards();
$p_cards=$game->getPCards();
//print_r($p_cards);
for($i=0;$i<$num;$i++){
    $players_cards= json_encode($p_cards[$i]);
    update_players_cards($game_id,$i, $players_cards);
}

$stage=$game->getStage();
update_game_stage($game_id, $stage);

$sb=$game->getSB();
$betting_order=$sb;
update_betting_order($game_id,$betting_order);
//echo $newOffer;
//print_r($game->getCardDisplay());
$bet_nth=0;
update_bet_nth($game_id,$bet_nth);