<?php

$hn='localhost';
$db='texas_holdem';
$un='root';
$pw='';


/* Attempt to connect to MySQL database */
$link = mysqli_connect($hn, $un, $pw, $db);
 
// Check connection
if(mysqli_connect_errno()) die("dB Connection Error!!!");

?>
