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

$betting_order= retrieve_betting_order($game_id);

$newOffer=$game->getNewOffer();
//echo $newOffer;
$stage=$game->getStage();
$bal=$game->players[$p_id_session]->getBal();

betting_buttons($stage,$bal, $num, $betting_order, $newOffer);


function betting_buttons($stage,$bal,$num,$betting_order,$newOffer){
    
    if(isset($_SESSION['p_id'])&&$_SESSION['p_id']==$betting_order%$num){
        if($betting_order>$num && $newOffer==0){
            echo "0"; //go to next step
        }
        else{
            $output=' 
            <form id="betting" method="POST" action="">
            <input type="hidden" name="check_call" value=$ '.$newOffer.'>
            <button type="submit" class="btn btn-primary check_call" id="check_call" value=$'.$newOffer.'>';
            
            if($newOffer==0){
                $output.= 'Check</button></form>';
            }
            else{
                $output.= 'Call<span class="badge badge-light"> $ '.$newOffer.'</span>'
                        . '</form>';
            }
        
            echo $output;
        }
        
    }
    
}