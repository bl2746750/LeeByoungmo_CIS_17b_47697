<?php

include "start_play_game.php";
//include "../Classes/Deal.php";
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$game->deckOfCards();
$game->shuffle();
//print_r($game->getDCards());
//shuffle($dCards);
//for($i=0;$i<MAXCRDS;$i++){
//    $dCards[$i]->displayCard();
//}