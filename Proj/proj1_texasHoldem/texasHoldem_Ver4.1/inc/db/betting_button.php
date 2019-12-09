<?php
require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "retrieve_game_class.php";

session_start();


$game_id= get_playing_game_id();
$game= retrieve_game_class($game_id);
$num=$game->getNumP();

$user_session_id=$_SESSION['user_id'];
$_SESSION['p_id']= get_p_id($game_id, $user_session_id);
$p_id_session=$_SESSION['p_id'];

for($i=0;$i<$num;$i++){
    $iPB=$game->players[$i]->getIPBal();
    $balance=$game->players[$i]->getBal();
    $user_id= get_user_id($game_id, $i);
    //echo $user_id."<br />";
    update_players_iPB($game_id,$i, $iPB);
    update_players_bal($user_id,$balance);
}

$pot_balance=$game->getPotBal();
update_pot_balance($game_id, $pot_balance);

$betting_order=$game->getBettingOrder();
update_betting_order($game_id,$betting_order);
$prev=$p_id_session-1;
if($prev<0) $prev=$num-1;
$newOffer=$game->players[$prev]->getIPBal()-$game->players[$p_id_session]->getIPBal();
//echo $newOffer;

$output=betting_buttons($num, $betting_order, $newOffer);

$game->incrementBettingOrder();

function betting_buttons($num,$betting_order,$newOffer){
    
    if(isset($_SESSION['p_id'])&&$_SESSION['p_id']==$betting_order%$num){
        $output=' 
        <form method="POST" action="">
            <input type="hidden" name="check_call" value=$ '.$newOffer.'>
            <button type="submit" class="btn btn-primary check_call" value=$'.$newOffer.'>';
        if($newOffer==0){
            $output.= 'Check</button>'
                    . '</form>';
        }
        else{
            $output.= 'Call<span class="badge badge-light"> $ '.$newOffer.'</span>'
                    . '</form>';
        }
        
        echo $output;
    }
    
}