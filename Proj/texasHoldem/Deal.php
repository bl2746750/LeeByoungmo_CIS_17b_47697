<?php

/*
 * File:   Dealer.php
 * Author: Byoung Mo Lee
 * Created on September 23, 2019 23:58 PM
 * Purpose: Texas Holdem
 * 
 */
include ("Card.php"); 

class Deal {
    //put your code here
    private $nPlayers;
    private $cards;
    
    public function Deal($nPlayers){
        $this->nPlayers=$nPlayers;
        for($i=0;$i<MAXCRDS;$i++){
            $this->cards[$i]=new Card($i);
        }
        shuffle($this->cards);
 
        for($i=0;$i<MAXCRDS;$i++){
            $this->cards[$i]->displayCard();
        }
    }
    public function deckOfCards(){
        for($i=0;$i<MAXCRDS;$i++){
            $cards[]=new Cards($i);
        }
        return $cards;
    }
    
}
