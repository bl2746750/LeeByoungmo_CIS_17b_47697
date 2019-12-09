<?php
require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "retrieve_game_class.php";

session_start();


$game_id= check_game_currently_playing();

if(isset($_SESSION['p_id'])&&$game_id!=0){
    $game_id= get_playing_game_id();
    $game= retrieve_game_class($game_id);
    $num=$game->getNumP();
    $user_session_id=$_SESSION['user_id'];
    $p_id_session=$_SESSION['p_id'];
    $p_active_status= retrieve_player_active_status($game_id,$p_id_session);
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
    $game->setNewOffer();
    $newOffer=$game->getNewOffer();
    //echo $newOffer;
    $stage=$game->getStage();
    $bal=$game->players[$p_id_session]->getBal();
    $initBettingOrder=$game->getIBO();    
    if($p_active_status==1){
        if($stage==1){
            
        }
        if($betting_order-$initBettingOrder>=$num && $newOffer==0){
            echo '1';  //go to the next step
        }
        else if($betting_order-$initBettingOrder<$num){
            if($p_id_session==$betting_order%$num){
                betting_buttons($stage,$bal, $num, $betting_order, $newOffer);
            }
            else{
                
            }
            
        }
        
    }
    else{
        $betting_order=$game->incrementBettingOrder();
        update_betting_order($game_id, $betting_order);
    }
    

}





function betting_buttons($stage,$bal,$num,$betting_order,$newOffer){
    
    
            $output=' 
            <form id="betting" method="POST" action="">
            <input type="hidden" name="check_call" value=$ '.$newOffer.'>
            <button type="button" class="btn btn-primary check_call" id="check_call" value=$'.$newOffer.'>';
            
            if($newOffer==0){
                $output.= 'Check</button></form>';
            }
            else{
                $output.= 'Call<span class="badge badge-light"> $ '.$newOffer.'</span>'
                        . '</form>';
            }
        
            echo $output;
    
}