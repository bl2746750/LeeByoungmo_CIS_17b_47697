<?php
require_once './loginMysql_1.php';


session_start();

$user_id=$_SESSION['user_id'];

$query ="SELECT * FROM entity_users WHERE status=1";
$result=$link->query($query);
if(!$result){$rows=0;}

else {$rows=$result->num_rows;}

$query="UPDATE entity_users SET status=1 WHERE user_id=$user_id";
$result=$link->query($query);
if(!$result) die("Can't update player_id");

?>

