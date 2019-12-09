
<?php
require_once '../Classes/Deal.php';
require_once "query_players.php";
require_once "query_game.php";
require_once "retrieve_game_class.php";


session_start();


$game_id= get_playing_game_id();
//$game= retrieve_game_class($game_id);
//$num=$game->getNumP();
//echo $num;
//print_r($game);
$dCards=array();
for($i=0;$i<52;++$i){
    $dCards[$i]=$i;
}

shuffle($dCards);

$dCards=json_encode($dCards);

update_dcards($game_id, $dCards);
