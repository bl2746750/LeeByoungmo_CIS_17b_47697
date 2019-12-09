<?php

require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "serialize_game.php";

session_start();

$num_players= get_num_players_ready();
$game_id= get_available_game_id();
$_SESSION['game_id']=$game_id;
//echo "game_id=".$game_id."<br />";
//echo "num_players=".$num_players."<br />";

$p= get_players();
//print_r($p)."<br />";
update_avail_game_to_playing($game_id);
$game=new Deal($num_players);
$game->setGameId($game_id);
//echo "game_id=".$game->getGameId()."<br />";
$game->setPlayers($p);
//print_r($game->getPlayers());
$game->setLoc($num_players);
//print_r($game->getPlayers());
//

update_game_object($game_id, $game);
?>
