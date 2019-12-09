<?php

$dsn = 'mysql:dbname=texas_holdem;host=localhost:3307';
$user = 'root';
$password = '';

try {
    $link = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}
date_default_timezone_set('America/Los_Angeles');
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

function fetch_user_status($user_id,$link){
    $query="SELECT * FROM entity_users WHERE user_id=$user_id";
    $statement=$link->prepare($query);
    $statement->execute();
    $result=$statement->fetchAll();
    foreach($result as $row){
        return $row;
    }
}
?>
