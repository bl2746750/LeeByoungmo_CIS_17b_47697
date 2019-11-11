<?php

$hn='localhost';
$db='shopping_mall';
$un='root';
$pw='';

/* Attempt to connect to MySQL database */
$link = mysqli_connect($hn, $un, $pw, $db);
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
?>
