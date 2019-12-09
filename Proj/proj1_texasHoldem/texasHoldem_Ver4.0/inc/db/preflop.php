<?php
require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require 'loginMysql_1.php';
//require_once "serialize_game.php";
require_once "retrieve_game_class.php";

session_start();


$game_id= get_playing_game_id();
$game= retrieve_game_class($game_id);
$num=$game->getNumP();
//echo $num;
//print_r($game);
$dCards=array();
for($i=0;$i<52;++$i){
    $dCards[$i]=$i;
}

shuffle($dCards);

$dCards=json_encode($dCards);

update_dcards($game_id, $dCards);


$game->preflop();
//$p_cards=array();
$game->setPCards();
$p_cards=$game->getPCards();
//print_r($p_cards);
for($i=0;$i<$num;$i++){
    $players_cards= json_encode($p_cards[$i]);
    update_players_cards($game_id,$i, $players_cards);
}


$stage=$game->getStage();
update_game_stage($game_id, $stage);

$display_cards=$game->getCardDisplay();
$display_cards= json_encode($display_cards);

update_display_cards($game_id,$display_cards);
//print_r($game->getCardDisplay());
//print_r($game->players);
//update_game_object($game_id, $game);

