<?php

//retrieve_game_class.php



function retrieve_game_class($game_id){
require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once 'query_balance.php';

    $num_players= get_num_players_playing_by_game_id($game_id);
    //echo $num_players;
    $game=new Deal($num_players);
    $game->setGameId($game_id);
    $pot_balance= get_pot_balance($game_id);
    $game->addPotBal($pot_balance);
    $dCards= retrieve_dcards($game_id);
    $dCards=json_decode($dCards);
    $game->setDCards($dCards);
    $players= retrieve_players($game_id);
    $game->setPlayers($players);
    
    $game->setLoc();
    $game->setInitCont();
    $game->setBlind();

    //$game->setCardDisplay();
    //print_r($game->getCardDisplay());
    $betting_order= retrieve_betting_order($game_id);
    //echo $betting_order;
    $game->setBettingOrder($betting_order);
    //echo $game->getBettingOrder();
    $stage= retrieve_stage($game_id);
    $game->setStage($stage);
    $game->setCardDisplay();
    if($stage>0){
        $game->preflop();
    }
    if($stage>1) $game->flop();
    if($stage>2) $game->turn();
    if($stage>3) $game->river();
    return $game;
}