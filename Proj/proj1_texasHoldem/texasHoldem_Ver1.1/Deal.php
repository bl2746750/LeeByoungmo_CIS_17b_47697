<?php

/*
 * File:   Dealer.php
 * Author: Byoung Mo Lee
 * Created on September 23, 2019 23:58 PM
 * Purpose: Texas Holdem
 * 
 */

include ("Player.php");

class Deal {
    //put your code here
    private $nPlayers;
    private $cards;
    
    public function Deal($nPlayers){
        $this->nPlayers=$nPlayers;
        $this->setPlayers($nPlayers);
        for($i=0;$i<MAXCRDS;$i++){
            $this->cards[$i]=new Card($i);
        }
        shuffle($this->cards);
 
        for($i=0;$i<MAXCRDS;$i++){
            $this->cards[$i]->displayCard();
        }
        echo ("<br><br>");
        
        $this->preflop();
        echo("<br><br>Community in Flop<br><br>");
        $this->flop();
        echo("<br><br>Community in Turn<br><br>");
        $this->turn();
        echo("<br><br>Community in River<br><br>");
        $this->river();
        
        echo("<br><br>myCards print per players<br><br>");
        for($i=0;$i<$this->nPlayers;$i++){
            echo("<br><br>Player".$i."'s myCards<br><br>");
            for($j=0;$j<7;$j++){
                $this->players[$i]->myCards[$j]->displayCard();
            }
        }
    }
    
    public function river(){
        for($i= $this->nPlayers*2+1+3+1+1+1;$i<$this->nPlayers*2+1+3+1+1+1+1;$i++){
            $this->cards[$i]->displayCard();
            for($j=0;$j<$this->nPlayers;$j++){
                for($k=2+3+1;$k<2+3+1+1;$k++){
                    $this->players[$j]->myCards[$k]=$this->cards[$i];
                }
                
            }
        
        }        
    }
    public function turn(){
        for($i= $this->nPlayers*2+1+3+1;$i<$this->nPlayers*2+1+3+1+1;$i++){
            $this->cards[$i]->displayCard();
            for($j=0;$j<$this->nPlayers;$j++){
                for($k=2+3;$k<2+3+1;$k++){
                    $this->players[$j]->myCards[$k]=$this->cards[$i];
                }
                
            }
        
        }
    }
    
    public function flop(){
        for($i= $this->nPlayers*2+1;$i<$this->nPlayers*2+1+3;$i++){
            $this->cards[$i]->displayCard();
        }    
        
        for($j=0;$j<$this->nPlayers;$j++){
            for($k=2,$i=$this->nPlayers*2+1;$k<2+3;$k++,$i++){
//one card throwed away, that's why it starts from $this->nPlayers*2+1
               
                $this->players[$j]->myCards[$k]=$this->cards[$i];
               
            }
        }
    }
    
    
    
    public function preflop(){
        
        for($i=0;$i<2;$i++){
            for($j=0;$j<$this->nPlayers;$j++){
                echo("<br>Player".$j."<br>");
                $this->players[$j]->myCards[$i]=$this->cards[$j+$i*2];
                $this->players[$j]->myCards[$i]->displayCard();
            }
        }
    }
    
    public function deckOfCards(){
        for($i=0;$i<MAXCRDS;$i++){
            $cards[]=new Cards($i);
        }
        return $cards;
    }
    
    public function setPlayers($nPlayers){
        $this->players[$this->nPlayers]= new Player;
    }
    
}
?>