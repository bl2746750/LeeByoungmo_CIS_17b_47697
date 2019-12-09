<?php

require_once '../Classes/Deal.php';

session_start();

$num_players=$_SESSION['num_players'];

$game=new Deal($num_players);


?>