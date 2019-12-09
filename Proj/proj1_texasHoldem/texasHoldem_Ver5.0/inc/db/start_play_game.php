<?php

require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
//require_once "serialize_game.php";

session_start();
header("Refresh:0; url=../../index.php");
$game_currently_playing= get_playing_game_id();
//echo $game_currently_playing;

if(isset($_SESSION['game_id']) && $_SESSION['game_id']==$game_currently_playing){
    echo 'You are already in this game_id';
}

else{
    if($game_currently_playing<0){
        $num_players= get_num_players_ready();
        if($num_players>1){
            $game_id=create_game($num_players);
            $_SESSION['game_id']=$game_id;
            $p= create_players($game_id);  //xref_play_game entry
            $game=new Deal($num_players);
            $game->setGameId($game_id);
            $game->setPlayers($p);
            $user_id=$_SESSION['user_id'];
            $_SESSION['p_id']= get_p_id($game_id, $user_id);
            $game->setLoc();
            echo "game_id=".$game_id;
        }
        else{
            echo "Wait until another players Join!!!";
        }

    }
    else {
        echo 'Wait Until Current Game End!!!';
    }
}

?>
