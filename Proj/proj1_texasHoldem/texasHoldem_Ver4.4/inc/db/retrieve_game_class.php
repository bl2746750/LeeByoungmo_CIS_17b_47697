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
    $p= retrieve_players($game_id);  
    $game->setPlayers($p);
    $game->setLoc();
    $game->setActiveNumPlayers();
    $game->setInitCont();
    $game->setBlind();
    
    $dCards=array();
    $dCards= retrieve_dcards($game_id);
    $dCards=json_decode($dCards);
    $game->setDCards($dCards);
    
    for($i=0;$i<$num_players;$i++){
        $myCards=array();
        $myCards= retrieve_mycards($game_id,$i);
        echo $myCards;
        //echo $game_id;
        //print_r($myCards);
        //echo retrieve_mycards($game_id,$i);
        $myCards=json_decode($myCards);
        //print_r($myCards);
        if($myCards){
            $game->retrievePCards($i, $myCards);
        }
    }
    
    $game->setCardDisplay();
    print_r($game->getPCards());
    $pot_balance= get_pot_balance($game_id);
    $game->setPotBal();
    $game->addPotBal($pot_balance);
    
    for($i=0;$i<$num_players;$i++){
        $user_id= get_user_id($game_id, $i);
        //echo $user_id;
        $balance= get_balance($user_id);
        //echo $balance;
        $in_pot_balance= get_in_pot_balance($game_id, $i);
        $game->players[$i]->setBal($balance);
        $game->players[$i]->setIPBal($in_pot_balance);
    }
    
    $betting_order= retrieve_betting_order($game_id);
    $game->setBettingOrder($betting_order);
    $stage= retrieve_stage($game_id);
    if($stage>1) $game->flop();
    if($stage>2) $game->turn();
    if($stage>3) $game->river();
    //echo $game->getStage();
    //echo $game->getPotBal();
    return $game;
}