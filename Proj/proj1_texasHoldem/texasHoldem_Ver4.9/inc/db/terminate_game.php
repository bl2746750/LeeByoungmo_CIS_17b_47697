<?php
require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "retrieve_game_class.php";


session_start();


$game_id= get_playing_game_id();
$game= retrieve_game_class($game_id);
$num=$game->getNumP();

$game->terminateGame();
//echo $game->decideWinner();
//echo $game->getActiveNumPlayers();

$amount=0;
update_balance_for_pot($game_id, $amount);
        
for($i=0;$i<$num;++$i){
    $user_id= $game->players[$i]->getUId();
    $balance=$game->players[$i]->getBal();
    $in_pot_bal=0;
    update_players_bal($user_id, $balance);
    update_players_iPB($game_id, $i, $in_pot_bal);
}

$game->setCardDisplay();

reset_to_before_start_game();