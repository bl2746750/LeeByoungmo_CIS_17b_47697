<?php

require_once './loginMysql_1.php';

session_start();

$user_id=$_SESSION['user_id'];
$email=$_SESSION['email'];
$balance=$_SESSION['balance'];

$query="UPDATE entity_users SET status=1,last_activity=now() WHERE user_id=$user_id";
$result=$link->query($query);
if(!$result) die("Failed to make user as a player");

?>

