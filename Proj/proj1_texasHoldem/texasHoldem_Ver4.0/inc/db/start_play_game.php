<?php

require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "serialize_game.php";

session_start();

$game_currently_playing= get_playing_game_id();

if(isset($_SESSION['game_id']) && $_SESSION['game_id']=$game_currently_playing){
    echo 'You are already in this game_id';
}

else{
    if($game_currently_playing==0){
        $num_players= get_num_players_ready();
        if($num_players>1){
            $game_id=create_game($num_players);
            $_SESSION['game_id']=$game_id;
            $p= create_players($game_id);  //xref_play_game entry
            $game->setGameId($game_id);
            $game->setPlayers($p);
            $game->setLoc();
        }
        else{
            echo "Wait until another players Join!!!";
        }

    }
    else {
        echo 'Wait Until Current Game End!!!';
    }
}
//$num_players= get_num_players_ready();
//$game_id= get_available_game_id($num_players);
//$_SESSION['game_id']=$game_id;
////echo "game_id=".$game_id."<br />";
////echo "num_players=".$num_players."<br />";
//
//$p= get_players($game_id);
////print_r($p)."<br />";
//update_avail_game_to_playing($game_id);
//$game=new Deal($num_players);
//$game->setGameId($game_id);
////echo "game_id=".$game->getGameId()."<br />";
//$game->setPlayers($p);
////print_r($game->getNumP());
//$game->setLoc($num_players);
//print_r($game->getPlayers());
//
//
////update_game_object($game_id, $game);
?>
