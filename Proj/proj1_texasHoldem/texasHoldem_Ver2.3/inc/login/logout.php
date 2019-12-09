<?php
include "../structure/header.php";
require_once "../db/loginMysql.php";
// Initialize the session
$email=$_SESSION["email"];
if(isset($_SESSION['game_id'])==true){
    $game_id=$_SESSION['game_id'];
    //echo $game_id;
    $query="UPDATE entity_users SET logged_in=0, status=0, p_id=-1 WHERE email='$email'";
    $result=$link->query($query);
    if(!$result) die("Database access failed"); 
}
session_start();
 
// Unset all of the session variables
$_SESSION = array();
 
// Destroy the session.
session_destroy();
// Redirect to login page
header("location: ../../index.php");
exit;
?>