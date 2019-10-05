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
    private $players;
    private $dCards;
    
    
    public function Deal($nPlayers){
        $this->setPlayers($nPlayers);
        
        $this->deckOfCards();
        
        shuffle($this->dCards);
 
        for($i=0;$i<MAXCRDS;$i++){
            $this->dCards[$i]->displayCard();
        }
        echo ("<br><br>");
        
        $this->preflop();
                
        $this->flop();
                
        $this->turn();
                
        $this->river();
        
                
    }
        
        
        
  
    
    public function river(){
        echo("<br><br>Community in River<br><br>");
        for($i= $this->nPlayers*2+1+3+1+1+1;$i<$this->nPlayers*2+1+3+1+1+1+1;$i++){
            $this->dCards[$i]->displayCard();
            for($j=0;$j<$this->nPlayers;$j++){
                for($k=2+3+1;$k<2+3+1+1;$k++){
                    $this->players[$j]->myCards[$k]=$this->dCards[$i];
                }
                
            }
        
        }        
    }
    public function turn(){
        echo("<br><br>Community in Turn<br><br>");
        for($i= $this->nPlayers*2+1+3+1;$i<$this->nPlayers*2+1+3+1+1;$i++){
            $this->dCards[$i]->displayCard();
            for($j=0;$j<$this->nPlayers;$j++){
                for($k=2+3;$k<2+3+1;$k++){
                    $this->players[$j]->myCards[$k]=$this->dCards[$i];
                }
                
            }
        
        }
    }
    
    public function flop(){
        echo("<br><br>Community in Flop<br><br>");
        for($i= $this->nPlayers*2+1;$i<$this->nPlayers*2+1+3;$i++){
            $this->dCards[$i]->displayCard();
        }    
        
        for($j=0;$j<$this->nPlayers;$j++){
            for($k=2,$i=$this->nPlayers*2+1;$k<2+3;$k++,$i++){
//one card is throwed away, that's why it starts from $this->nPlayers*2+1
               
                $this->players[$j]->myCards[$k]=$this->dCards[$i];
               
            }
        }
    }
    
    
    
    public function preflop(){
        
        for($i=0;$i<2;$i++){
            for($j=0;$j<$this->nPlayers;$j++){
                echo("<br>Player".$j."<br>");
                $this->players[$j]->myCards[$i]=($this->dCards[$j+$i*$this->nPlayers]);
                $this->players[$j]->myCards[$i]->displayCard();
            }
        }
       
    }
    
    public function deckOfCards(){
        for($i=0;$i<MAXCRDS;$i++){
            $this->dCards[$i]=new Card($i);
        }
        
        return $this->dCards;
    }
    
    public function setPlayers($nPlayers){
        $this->nPlayers=$nPlayers;
        $this->players[$this->nPlayers]= new Player;
    }
    
    public function getPlayers(){
        return $this->players;
    }
    
    public function getNumP(){
        return $this->nPlayers;
    }
    
 
}
