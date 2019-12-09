<?php
require_once '../db/query_players.php';
require_once '../db/query_game.php';
require_once '../db/retrieve_game_class.php';
require_once '../Classes/Deal.php';


session_start();

$user_id=$_SESSION['user_id'];
//echo $user_id;
$game_id= get_playing_game_id();

$game= retrieve_game_class($game_id);

$stage= get_game_stage($game_id);
//echo $stage;
//$game->setCardDisplay();

if($stage>0){
    $display_cards=$game->getCardDisplay();
    //print_r($game->getCommCards());
    //print_r($game->getCardDisplay());
    $num_players= get_num_players_playing_by_game_id($game_id);
    //$display_cards= get_display_cards($game_id);
    //$display_cards= json_decode($display_cards);
    //$game->retrieveDisplayCards($display_cards);
    
    //print_r($display_cards);
    //print_r($game->getCardDisplay());
    //echo '<br /><br />';
    $card_back="Cards/back.jpg";
    for($i=0;$i<$num_players*2;++$i){
        if($display_cards[$i][0]!=$user_id){
            $display_cards[$i][2]=$card_back;
        }
    }

    //$game->showBackDisplay($user_id);

    //print_r($display_cards);


$output_json= json_encode($display_cards);
echo $output_json;
}
else{return false;}