<?php

require_once 'loginMysql.php';

session_start();

if(isset($_SESSION['game_id'])){
$game_id=$_SESSION['game_id'];
$query="SELECT * FROM xref_message_board WHERE game_id=$game_id";
$stmt= $link->prepare($query);
$stmt->execute();
$result=$stmt->fetchAll();
foreach($result as $row);

echo json_encode($row);
//echo count($row);
//print_r($row);
//return $row;
}