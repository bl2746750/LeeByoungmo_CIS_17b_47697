<?php
require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "retrieve_game_class.php";


$game_id= get_playing_game_id();
$stage= retrieve_stage($game_id);

echo $stage;