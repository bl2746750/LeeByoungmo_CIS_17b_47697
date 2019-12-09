<?php

require_once "query_players.php";
require_once "query_game.php";

session_start();

if(get_playing_game_id()>0) {echo 0;}
else{echo get_num_players_ready();}
