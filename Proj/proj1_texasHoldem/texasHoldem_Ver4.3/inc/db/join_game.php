<?php

require_once 'query_players.php';

session_start();

$user_id=$_SESSION['user_id'];

$user_status= get_user_status($user_id);

if($user_status==1){
    if(update_session_player_ready($user_id)) {
    echo 'Your Status changed to Ready';
    }
    else {
        echo 'error to change user status to ready';
    }
}

else if($user_status==0) {echo 'your status is not-logged-in';}
else if($user_status==2) {echo 'You are waing for game';}
else if($user_status==3) {echo 'you are playing now';}
?>

