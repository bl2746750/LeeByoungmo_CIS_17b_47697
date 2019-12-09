<?php
include '../db/loginMysql.php';
// Initialize the session
session_start();
$query="UPDATE entity_users SET logged_in=0, status=0, p_id=-1 WHERE user_id='".$_SESSION['user_id']."'";
$result=$link->query($query);
if(!$result) die("Database access failed"); 

 
// Unset all of the session variables
$_SESSION = array();
 
// Destroy the session.
session_destroy();
// Redirect to login page
header("location: ../../index.php");
exit;
?>