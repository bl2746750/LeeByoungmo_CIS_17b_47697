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

    $game = retrieve_game_class($game_id);
    //$betting_order= retrieve_betting_order($game_id);
    //$betting_order2=$game->getBettingOrder();
    //echo $betting_order."<br />";
    //echo $betting_order2."<br />";
    $num = $game->getNumP();
    $p_active_status = retrieve_player_active_status($game_id, $p_id_session);
    if (!$p_active_status) {
        $betting_order = retrieve_betting_order($game_id);
        $betting_order++;
        if (betting_order > $num)
            $betting_order %= $num;
        update_betting_order($game_id, $betting_order);
        $bet_nth = retrieve_bet_nth($game_id);
        update_bet_nth($game_id, ++$bet_nth);
    } else {
        $betting_order = retrieve_betting_order($game_id);
        $game->setBettingOrder($betting_order);

        $bet_nth = retrieve_bet_nth($game_id);
        //echo $bet_nth;
        $stage = $game->getStage();
        if ($p_id_session == $betting_order) {

            for ($i = 0; $i < $num; $i++) {
                $iPB = $game->players[$i]->getIPBal();
                $balance = $game->players[$i]->getBal();
                $user_id = get_user_id($game_id, $i);
                //echo $user_id."<br />";
                update_players_iPB($game_id, $i, $iPB);
                update_players_bal($user_id, $balance);
            }

            $pot_balance = $game->getPotBal();
            update_pot_balance($game_id, $pot_balance);

            $game->setNewOffer();
            $newOffer = $game->getNewOffer();
            $bal = $game->players[$p_id_session]->getBal();
            if ($bet_nth < $num || $newOffer > 0) {
                betting_buttons($newOffer,$bal);
            } else {
                echo "1";
            }
        }
    }
}

function betting_buttons($newOffer,$balance) {


    $output = ' 
            <form id="betting" method="POST" action="">
            <button type="button" class="btn btn-primary check_call" id="check_call" value=$' . $newOffer . '>';

    if ($newOffer == 0) {
        $output .= 'Check</button>';
    } else {
        $output .= 'Call<span class="badge badge-light"> $ ' . $newOffer . '</span></button>';
    }
    $output .=' 
            <button type="button" class="btn btn-primary raise" id="raise_button" value='.$balance.'>
            Raise</button>
            
            <button type="button" class="btn btn-primary fold" id="fold" value="">
            Fold</button></form>';
               
    echo $output;
}
