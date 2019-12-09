<?php

require_once './loginMysql_1.php';

session_start();

$query="SELECT * FROM entity_users WHERE status=1";
$result=$link->query($query);
if($result){
    $rows=$result->num_rows;
    $num_players=$rows;
}
$_SESSION['num_players']=$num_players;

echo $num_players;