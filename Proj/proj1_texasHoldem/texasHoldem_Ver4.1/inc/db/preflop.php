<?php
require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "retrieve_game_class.php";


session_start();


$game_id= get_playing_game_id();
$game= retrieve_game_class($game_id);
$num=$game->getNumP();
//echo $num;
//print_r($game);
$dCards=array();
for($i=0;$i<52;++$i){
    $dCards[$i]=$i;
}

shuffle($dCards);

$dCards=json_encode($dCards);

update_dcards($game_id, $dCards);

$game= retrieve_game_class($game_id);

$game->preflop();
$p_cards=array();
$game->setPCards();
$p_cards=$game->getPCards();
//print_r($p_cards);
for($i=0;$i<$num;$i++){
    $players_cards= json_encode($p_cards[$i]);
    update_players_cards($game_id,$i, $players_cards);
}


$stage=$game->getStage();
update_game_stage($game_id, $stage);


$game->bettingProcess();
$betting_order=$game->getBettingOrder();
update_betting_order($game_id,$betting_order);
$newOffer=$game->getNewOffer();
//echo $newOffer;

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
$user_session_id=$_SESSION['user_id'];
$_SESSION['p_id']= get_p_id($game_id, $user_session_id);

$output=betting_buttons($num, $betting_order, $newOffer);

function betting_buttons($num,$betting_order,$newOffer){
    
    if(isset($_SESSION['p_id'])&&$_SESSION['p_id']==$betting_order%$num){
        $output=' 
        <form method="POST" action="">
            <input type="hidden" name="check_call" value=$ '.$newOffer.'>
            <button type="button" class="btn btn-primary check_call">';
        if($newOffer==0){
            $output.= 'Check</button>'
                    . '</form>';
        }
        else{
            $output.= 'Call<span class="badge badge-light">'.$newOffer.'</span></button>'
                    . '</form>';
        }
        echo $output;
    }
    
}