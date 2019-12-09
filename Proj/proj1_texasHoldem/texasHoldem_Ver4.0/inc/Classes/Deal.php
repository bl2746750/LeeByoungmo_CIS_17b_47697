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
    private $cardDisplay;
    private $playerDisplay;
    private $bettingOrder;
    private $initCont;
    private $potBal;
    private $stage;
    private $PCards;
    
    
    public function setPCards(){
        $pcards=array();
        $num= $this->nPlayers;
        $stage=$this->stage;
        for($i=0;$i<$num;$i++){
            if($stage==0) {$k=0;}
            else if($stage==1) {$k=2;}
            else if($stage==2) {$k=5;}
            else if($stage==3) {$k=7;}
            for($j=0;$j<$k;$j++){
                $pcards[$i][$j]= $this->players[$i]->getMyCards()[$j]->getNum();
            }
            
        }
        $this->PCards=$pcards;
    }
    public function getPCards(){
        return $this->PCards;
    }
    
    public function setStage(){
        $this->stage=0;
    }
    
    public function getStage(){
        return $this->stage;
    }
    public function retrievePCards($p_id,$myCards){
        if($myCards){
            $this->players[$p_id]->retrieveCards($myCards);
        }
        
    }
    
    public function retrieveDCards($dCards){
        if(!$dCards){
            for($i=0;$i<count($dCards);$i++){
                $this->dCards[$i]=new Card($dCards($i));
            }
        }
        
    }
    
    public function setPotBal($num){
        $this->potBal=$num;
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
        require '../db/betting_process';
        $forcedBet= $this->initCont;
        $double=2;
        $num= $this->nPlayers;
        $sb=$this->getSB();        
        for($i=0;$i<$num;++$i){
            if($i==$num) {$i%=$num;}
            $this->players[$i]->bet($forcedBet);
            $this->calcPotBal($forcedBet);
            update_balance_for_user($user_id, $betting);
            update_balance_for_pot($game_id, $betting);
            $betting*=$double;
        }
        
    }
    
//    public function getBettingOrder(){
//        return $this->bettingOrder;
//    }
//    
//    public function setBettingOrder(){
//        $sb= $this->smallBlind;
//        $num= $this->nPlayers;
//        $order=$sb;
//        $this->bettingOrder=$order;
//    }
    
    
    public function getPlayerDisplay(){
        return $this->playerDisplay;
    }
    
    public function retrieveDisplayCards($display_cards){
        return $this->cardDisplay;
    }
    public function addCardDisplay($user_id,$file_loc,$url){
        array_push($this->cardDisplay,array($user_id,$file_loc,$url));
    }
    
    public function setCardDisplay(){
        $this->cardDisplay=array();
        $nCards=2;
        $num=$this->getNumP();
        $sb=$this->getSB();
        for($i=0;$i<$nCards;++$i){
            for($j=0;$j<$num;++$j){
                //print_r($this->players[$j]->getMyCards());
                if($this->players[$j]->getMyCards()){
                    $user_id=$this->players[$j]->getUID();
                    //echo $user_id;
                    $user_loc=$this->players[$j]->getULoc()[$i];
                    $pict= $this->players[$j]->getMyCards()[$i]->getPict();
                    //print_r($this->dCards);
                    $this->cardDisplay[$i*$nCards+$j]=array($user_id, $user_loc, $pict);
                }
                
            }
        }
    }
    
    
//    public function showBackDisplay($user_id){
//        $card_back="Cards/back.jpg";
//        $nCards=2;
//        $num= $this->nPlayers;
//        for($i=0;$i<$num*$nCards;++$i){
//            if($this->cardDisplay[$i][0]!=$user_id){
//                $this->cardDisplay[$i][2]=$card_back;
//            }   
//        }
//    }
    
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
        
        $this->smallBlind=$game_id % $this->nPlayers;
        $this->bigBlind=($game_id+1)% $this->nPlayers;
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
//        $this->setBettingOrder();
//        $this->setPotBal();
        $this->setInitCont();
        $this->setBlind();
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
        
    

    public function river(){
        $this->stage=4;
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
        $this->stage=3;
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
        $this->stage=2;
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
        $this->stage=1;
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
                $user_id=$this->players[$j]->getUID();
                $user_loc=$this->players[$j]->getULoc()[$i];
                $pict=$this->dCards[$dcOrder]->getPict();
                //echo $user_id."<br />".$user_loc."<br />".$pict."<br />";
                $this->players[$j]->receiveCard($this->dCards[$dcOrder]);
                $this->addCardDisplay($user_id, $user_loc, $pict);
            }
        }
    }
    
    
    public function deckOfCards(){
        for($i=0;$i<MAXCRDS;$i++){
            $this->dCards[$i]=new Card($i);
        }
        
        return $this->dCards;
    }
    
    public function setDCards($dCards){
        
        for($i=0;$i<MAXCRDS;$i++){
            $cards=new Card($dCards[$i]);
            $this->dCards[$i]=$cards;
        }
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
    public function getPlayerBalance($p_id){
        return $this->players[$p_id]->getBal();
    }
    public function getPlayerName($p_id){
        return $this->players[$p_id]->getPName();
    }
    public function getUMLocByP_id($p_id){
        return $this->players[$p_id]->getUMLoc();
    }
    public function setLoc(){
        
        switch ($this->nPlayers) {
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
        
        switch ($this->nPlayers) {
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
    
    
    
 
}
