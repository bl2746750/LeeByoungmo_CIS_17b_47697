<?php
require_once '../db/query_players.php';
require_once '../db/query_game.php';
require_once '../db/retrieve_game_class.php';
require_once '../Classes/Deal.php';


session_start();

$user_id=$_SESSION['user_id'];
$game_id= get_playing_game_id();
$game= retrieve_game_class($game_id);
$stage= get_game_stage($game_id);

if($stage>0){
    $display_cards=$game->getCardDisplay();
    $num_players= get_num_players_playing_by_game_id($game_id);
    $card_back="Cards/back.jpg";
    for($i=0;$i<$num_players*2;++$i){
        if($display_cards[$i][0]!=$user_id){
            $display_cards[$i][2]=$card_back;
        }
    }
$output_json= json_encode($display_cards);
echo $output_json;
}
else{return false;}