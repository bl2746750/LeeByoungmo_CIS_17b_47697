<?php
include '../Classes/Deal.php';
require_once './loginMysql_1.php';

//session_start();

$user_id=$_SESSION['user_id'];
$email=$_SESSION['email'];
$balance=$_SESSION['balance'];

$query="UPDATE entity_users SET status=1,last_activity=now() WHERE user_id=$user_id";
$result=$link->query($query);
if(!$result) die("Failed to make user as a player");

$query ="SELECT * FROM entity_users WHERE status=1 ORDER BY last_activity ASC";
$result=$link->query($query);
if(!$result) die("Failed to retrieve user info");

$rows=$result->num_rows;

for($i=0;$i<$rows;$i++){
    $row=$result->fetch_array(MYSQLI_ASSOC);
    $p[$i]=new Player();
    $p[$i]->setPlayer($row['user_id'],$row['email'], $row['balance'],$i);
}

for($i=0;$i<$rows;$i++){
    $p_id=$p[$i]->getPId();
    $u_id=$p[$i]->getUId();
    $pName=$p[$i]->getPName();
    $query="UPDATE entity_users SET p_id=$p_id WHERE user_id=$u_id";
    $result=$link->query($query);
    if(!$result) die("Can't update player_id");
}

//print_r($p);

?>

