<?php

require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "retrieve_game_class.php";


$game_id= get_playing_game_id();
$num= get_num_players_playing_by_game_id($game_id);
$game= retrieve_game_class($game_id);
$betting_order= retrieve_betting_order($game_id);

$game->setBettingOrder($betting_order);
echo $game->getBettingOrder();
//echo $betting_order;
//print_r($game);
$game->setNewOffer();
$newOffer=$game->getNewOffer();
//echo $newOffer;
if($newOffer>0){
    $user_id= get_user_id($game_id, $betting_order%$num);
    $game->players[$betting_order%$num]->bet($newOffer);
    update_balance_calculate($game_id, $user_id, $newOffer);

}
$game->incrementBettingOrder();
echo $game->getBettingOrder();
update_betting_order($game_id, ++$betting_order);

