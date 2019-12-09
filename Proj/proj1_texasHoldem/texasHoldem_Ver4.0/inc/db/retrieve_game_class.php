<?php

//retrieve_game_class.php

function retrieve_game_class($game_id){
require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";

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
        //echo retrieve_mycards($game_id,$i);
        $myCards=json_decode($myCards);
        //print_r($myCards);
        if($myCards){
            $game->retrievePCards($i, $myCards);
        }
    }
    
    $game->setCardDisplay();
    return $game;
}