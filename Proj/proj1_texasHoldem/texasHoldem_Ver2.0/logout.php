<?php
include "inc/header.php";
require_once 'inc/loginMysql.php';
// Initialize the session
$email=$_SESSION["email"];
$query="UPDATE entity_users SET status=0 WHERE email='$email'";
$result=$link->query($query);
if(!$result) die("Database access failed"); 

session_start();
 
// Unset all of the session variables
$_SESSION = array();
 
// Destroy the session.
session_destroy();
// Redirect to login page
header("location: index.php");
exit;
?>