<?php

require_once 'query_players.php';

session_start();

$user_id=$_SESSION['user_id'];

update_session_player_ready($user_id);

?>

