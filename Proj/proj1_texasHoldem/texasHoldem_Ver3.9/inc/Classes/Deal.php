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
    private $game_id;
    private $nPlayers;
    private $activeNP;
    public $players;
    private $dCards;
    private $bigBlind;
    private $smallBlind;
    private $comm_loc;
    private $link;
    private $cardDisplay;
    private $bettingOrder;
    private $initCont;
    private $potBal;
    private $stage;
    
    public function setStage($stage){
        $this->stage=$stage;
    }
    
    public function getStage(){
        return $this->stage;
    }
    
    public function setPotBal(){
        $this->potBal=0;
    }
    
    public function getPotBal(){
        return $this->potBal;
    }
    public function setInitCont(){
        $this->initCont=5;
    }
    
    public function getInitCont(){
        return $this->initCont;
    }
    
    public function calcPotBal($amt){
        $this->potBal+=$amt;
    }
    
    public function initialBetting(){
        require '../db/query_balance.php';
        $game_id=$this->game_id;
        $betting= $this->initCont;
        $double=2;
        $num= $this->nPlayers;
                
        for($i=0;$i<2;++$i){
            $user_id= $this->players[$i]->getUId();
            if($i==$num) {$i%=$num;}
            $this->players[$i]->bet($betting);
            $this->calcPotBal($betting);
            update_balance_for_user($user_id, $betting);
            update_balance_for_pot($game_id, $betting);
            $betting*=$double;
        }
        
    }
    
    public function getBettingOrder(){
        return $this->bettingOrder;
    }
    
    public function setBettingOrder(){
        $sb= $this->smallBlind;
        $num= $this->nPlayers;
        $order=$sb;
        $this->bettingOrder=$order;
    }
    public function setCardDisplay($user_id,$file_loc,$url){
        array_push($this->cardDisplay,array($user_id,$file_loc,$url));
    }
    
    public function showBackDisplay($user_id){
        $card_back="Cards/back.jpg";
        $nCards=2;
        $num= $this->nPlayers;
        for($i=0;$i<$num*$nCards;++$i){
            if($this->cardDisplay[$i][0]!=$user_id){
                $this->cardDisplay[$i][2]=$card_back;
            }   
        }
    }
    
    public function clearCardDisplay(){
        $this->cardDisplay=array();
    }
    public function getCardDisplay(){
        return $this->cardDisplay;
    }
    public function setGameId($game_id){
        $this->game_id=$game_id;
    }
    
    public function getGameId(){
        return $this->game_id;
    }
    public function setBlind(){
        $game_id= $this->game_id;
        $nPlayers=$this->nPlayers;
        $this->smallBlind=$game_id % $nPlayers;
        $this->bigBlind=($game_id+1)% $nPlayers;
    }
    
    public function getSB(){
        return $this->smallBlind;
    }
    public function setActiveNumPlayers(){
        $this->activeNP=0;
        for($i=0;$i<$this->nPlayers;$i++){
            if($this->players[$i]->getAct()) {$this->activeNP++;}
        }
    }
    
    public function Deal($num){
        $this->setNumP($num);
        $this->setBettingOrder();
        $this->setPotBal();
        $this->setInitCont();
//        $this->setPlayers($this->nPlayers);
//        echo $this->nPlayers;
//          $this->setBlind();
//        $this->deckOfCards();
////        $order=($i+$this->bigBlind)%$this->nPlayers;
//        
//        shuffle($this->dCards);
// 
//        for($i=0;$i<MAXCRDS;$i++){
//            $this->dCards[$i]->displayCard();
//        }
//        echo ("<br><br>");
//        
//        $this->preflop();
//                
//        $this->allPCards();
//        
//        $this->flop();
//                
//        $this->turn();
//                
//        $this->river();
//        
                
    }
        
    public function setLoc($num){
        
        switch ($num) {
            case 2:
                $this->players[0]->setULoc("001", "002");
                $this->players[1]->setULoc("005", "006");
                break;
            case 3:
                $this->players[0]->setULoc("001", "002");
                $this->players[1]->setULoc("005", "006");
                $this->players[2]->setULoc("009", "010");
                break;
            case 4:
                $this->players[0]->setULoc("001", "002");
                $this->players[1]->setULoc("005", "006");
                $this->players[2]->setULoc("009", "010");
                $this->players[3]->setULoc("013", "014");
                break;
            case 5:
                $this->players[0]->setULoc("001", "002");
                $this->players[1]->setULoc("005", "006");
                $this->players[2]->setULoc("009", "010");
                $this->players[3]->setULoc("013", "014");
                $this->players[4]->setULoc("213", "214");
                break;
            case 6:
                $this->players[0]->setULoc("001", "002");
                $this->players[1]->setULoc("005", "006");
                $this->players[2]->setULoc("009", "010");
                $this->players[3]->setULoc("013", "014");
                $this->players[4]->setULoc("213", "214");
                $this->players[5]->setULoc("209", "210");
                break;
            case 7:
                $this->players[0]->setULoc("001", "002");
                $this->players[1]->setULoc("005", "006");
                $this->players[2]->setULoc("009", "010");
                $this->players[3]->setULoc("013", "014");
                $this->players[4]->setULoc("213", "214");
                $this->players[5]->setULoc("209", "210");
                $this->players[6]->setULoc("205", "206");
                break;
            case 8:
                $this->players[0]->setULoc("001", "002");
                $this->players[1]->setULoc("005", "006");
                $this->players[2]->setULoc("009", "010");
                $this->players[3]->setULoc("013", "014");
                $this->players[4]->setULoc("213", "214");
                $this->players[5]->setULoc("209", "210");
                $this->players[6]->setULoc("205", "206");
                $this->players[7]->setULoc("201", "202");
                break;
        }

        $this->comm_loc=array("106","107","108","109","110");
        
        switch ($num) {
            case 2:
                $this->players[0]->setUMLoc("000");
                $this->players[1]->setUMLoc("004");
                break;
            case 3:
                $this->players[0]->setUMLoc("000");
                $this->players[1]->setUMLoc("004");
                $this->players[2]->setUMLoc("008");
                break;
            case 4:
                $this->players[0]->setUMLoc("000");
                $this->players[1]->setUMLoc("004");
                $this->players[2]->setUMLoc("008");
                $this->players[3]->setUMLoc("012");
                break;
            case 5:
                $this->players[0]->setUMLoc("000");
                $this->players[1]->setUMLoc("004");
                $this->players[2]->setUMLoc("008");
                $this->players[3]->setUMLoc("012");
                $this->players[4]->setUMLoc("212");
                break;
            case 6:
                $this->players[0]->setUMLoc("000");
                $this->players[1]->setUMLoc("004");
                $this->players[2]->setUMLoc("008");
                $this->players[3]->setUMLoc("012");
                $this->players[4]->setUMLoc("212");
                $this->players[5]->setUMLoc("208");
                break;
            case 7:
                $this->players[0]->setUMLoc("000");
                $this->players[1]->setUMLoc("004");
                $this->players[2]->setUMLoc("008");
                $this->players[3]->setUMLoc("012");
                $this->players[4]->setUMLoc("212");
                $this->players[5]->setUMLoc("208");
                $this->players[6]->setUMLoc("204");
                break;
            case 8:
                $this->players[0]->setUMLoc("000");
                $this->players[1]->setUMLoc("004");
                $this->players[2]->setUMLoc("008");
                $this->players[3]->setUMLoc("012");
                $this->players[4]->setUMLoc("212");
                $this->players[5]->setUMLoc("208");
                $this->players[6]->setUMLoc("204");
                $this->players[7]->setUMLoc("200");
                break;
        }
    }

    public function river(){
        $this->setStage(3);
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
        $this->setStage(2);
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
        $this->setStage(1);
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
    
    public function clearMyCards(){
        $num= $this->nPlayers;
        for($i=0;$i<$num;++$i){
            $this->players[$i]->setMyCards();
        }
    }
    
    
    public function preflop(){
        $this->setStage(0);
        $this->clearMyCards();
        $this->clearCardDisplay();
        $nCards=2;
        $num= $this->nPlayers;
        $SB= $this->smallBlind;
        //echo $SB."<br />";
        //echo $this->nPlayers."<br />";
        //echo $nCards."<br />";
        for($i=0;$i<$nCards;++$i){
            for($j=$SB,$k=0;$k<$num;++$j,++$k){
                if($j==$num) {$j%=$num;}
                //echo $j."<br />";
                $dcOrder=$i*$nCards+$k;
                //echo $dcOrder."<br />";
                $this->players[$j]->receiveCard($this->dCards[$dcOrder]);
                $this->setCardDisplay($this->players[$j]->getUID(), $this->players[$j]->getULoc()[$i], $this->dCards[$dcOrder]->getPict());
            }
        }
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
    
    public function shuffle(){
        shuffle($this->dCards);
        return $this->dCards;
    }
    
    public function getDCards(){
        return $this->dCards;
    }
    
    public function setPlayers($players){
        $this->players=array();
        for($j=0;$j<count($players);++$j){
            $this->players[$j]=new Player();
            $this->players[$j]=$players[$j];
        }
        
    }
    
    
    public function getPlayers(){
        return $this->players;
    }
    
    public function setNumP($num){
        $this->nPlayers=$num;
    }
    public function getNumP(){
        return $this->nPlayers;
    }
    
    
    
    
 
}
