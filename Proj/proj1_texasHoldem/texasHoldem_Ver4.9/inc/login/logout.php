<?php
include '../db/loginMysql_1.php';
// Initialize the session
session_start();
$user_id=$_SESSION['user_id'];
//echo $user_id;
$query="UPDATE entity_users SET status=0 WHERE user_id=$user_id";
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