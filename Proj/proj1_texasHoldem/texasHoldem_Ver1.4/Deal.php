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
    private $activeNP;
    private $players;
    private $dCards;
    private $bigBlind;
    private $smallBlind;
    private static $nRound=1;
    
    
    public function setBlind(){
        $this->bigBlind=Deal::$nRound% $this->nPlayers;
        $this->smallBlind=$this->bigBlind+1;
    }
    
    public function setActiveNumPlayers(){
        $this->activeNP=0;
        for($i=0;$i<$this->nPlayers;$i++){
            if($this->players[$i]->active) {$this->activeNP++;}
        }
    }
    
    public function Deal($nPlayers){
        $this->setPlayers($nPlayers);
        $this->setBlind();
        $this->deckOfCards();
        
        
        
        shuffle($this->dCards);
 
//        for($i=0;$i<MAXCRDS;$i++){
//            $this->dCards[$i]->displayCard();
//        }
        echo ("<br><br>");
        
        $this->preflop();
                
        $this->allPCards();
        
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
        $nCard=2*$this->nPlayers;
        for($i=0;$i<2;$i++){
            for($j=0;$j<$this->nPlayers;$j++){
                $order=($j+$this->bigBlind)%$this->nPlayers;
               
                if($this->bigBlind===$order) {echo(": Big Blind<br>");}
                echo("<br>");
                $this->players[$order]->myCards[$i]=($this->dCards[$j+$i*$this->nPlayers]);
                $this->players[$order]->myCards[$i]->displayCard();
            }
        }
       
    }
    
    public function bet($pN){
         
    }
    public function allPCards(){
        for($i=0;$i<$this->nPlayers;$i++){
            $order=($i+$this->bigBlind)%$this->nPlayers;
            echo("<br>Player".$order);
            if($this->bigBlind===$order) {echo(": Big Blind<br>");}
            else if($this->smallBlind===$order) {echo(": Small Blind<br>");}
            echo("<br>");
            $this->thePCards($order);
        }
    }
    public function thePCards(int $pN){
        for($i=0;$i<count($this->players[$pN]->myCards);$i++){
            $this->players[$pN]->myCards[$i]->displayCard();
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
    
    public function setRound(){
        $nRound=0;
    }
 
}
