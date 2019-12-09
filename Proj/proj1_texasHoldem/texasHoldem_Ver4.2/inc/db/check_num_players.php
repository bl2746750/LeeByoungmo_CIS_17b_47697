<?php

require_once "query_players.php";
require_once "query_game.php";



if(get_playing_game_id()>0){
    echo get_num_players_playing();
}
else{
    echo get_num_players_ready();
}
