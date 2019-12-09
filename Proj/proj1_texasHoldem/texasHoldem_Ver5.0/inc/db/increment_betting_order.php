<?php

require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "retrieve_game_class.php";

session_start();

//print_r($_SESSION);
$game_id = get_playing_game_id();
//echo $game_id;
//echo $_SESSION['user_id'];
$user_session_id = $_SESSION['user_id'];
if ($game_id >= 0) {
    $status = get_user_status($user_session_id);
    //echo $status;
    if ($status == 3) {
        $p_id_session = get_p_id($game_id, $user_session_id);
        $_SESSION['p_id'] = $p_id_session;
        //echo $_SESSION['p_id'];
    }
}



if (isset($_SESSION['p_id'])) {
    $p_id_session=$_SESSION['p_id'];
    $game = retrieve_game_class($game_id);
    $betting_order= retrieve_betting_order($game_id);
    $betting_order++;
    update_betting_order($game_id, $betting_order);
    $bet_nth = retrieve_bet_nth($game_id);
    $bet_nth;
    update_bet_nth($game_id, ++$bet_nth);
} 