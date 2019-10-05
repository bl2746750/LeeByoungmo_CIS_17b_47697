<?php

/*
 * File:   Player.php
 * Author: Byoung Mo Lee
 * Created on September 24, 2019 01:15 AM
 * Purpose: Texas Holdem
 * 
 */
include ("Card.php"); 

class Player{
    private $pName;
    private $nBalance;
    private $myCards;
    private $hands;
    private $myPoints;
    
    public function Player(){
//        $this->setMyCards();
    }
    
//    public function setMyCards(){
//        $this->myCards=array();
//    }
    public function hands(){
        
    }
    
    public function isFlush(){
        $flush=0;
        $suitStat=array(0,0,0,0);
        for($i=0;$i<count($this->myCards);$i++){
            if($this->myCards[$i]->getSuit()===0) {
                ++$suitStat[0];
            }
            else if($this->myCards[$i]->getSuit()==1) {++$suitStat[1];}
            else if($this->myCards[$i]->getSuit()==2) {++$suitStat[2];}
            else if($this->myCards[$i]->getSuit()==3) {++$suitStat[3];}
        }
        
        if(max($suitStat)>3) {$flush=1;}
        return $flush;
    }
}
