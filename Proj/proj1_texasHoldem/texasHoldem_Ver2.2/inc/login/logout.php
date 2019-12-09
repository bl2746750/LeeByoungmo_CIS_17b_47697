<?php
include "../structure/header.php";
require_once "../db/loginMysql.php";
// Initialize the session
$email=$_SESSION["email"];
$game_id=$_SESSION['game_id'];
//echo $game_id;
$query="UPDATE entity_users SET logged_in=0, status=0 WHERE email='$email'";
$result=$link->query($query);
if(!$result) die("Database access failed"); 
$query="UPDATE entity_game SET num_player=num_player-1 WHERE game_id=$game_id";
$result=$link->query($query);
if(!$result) die("Database access failed1");
session_start();
 
// Unset all of the session variables
$_SESSION = array();
 
// Destroy the session.
session_destroy();
// Redirect to login page
header("location: ../../index.php");
exit;
?>