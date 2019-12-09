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
    private $newOffer;
    private $commCards;
    private $winner;
    
    
//    public function __construct($num) {
//        $this->setNumP($num);
//        $this->setLoc();
//        $this->setCommCard();
////        $this->setBettingOrder();
////        $this->setPotBal();
//        $this->setInitCont();
//        $this->setBlind();
//        $this->bettingOrder=$this->smallBlind;        
//    }
    
    public function setPCards(){
        $pcards=array();
        $num= $this->nPlayers;
        $stage=$this->stage;
        for($i=0;$i<$num;$i++){
            if($stage==0) {$k=0;}
            else if($stage==1) {$k=2;}
            else if($stage==2) {$k=5;}
            else {$k=7;}
            for($j=0;$j<$k;$j++){
                $pcards[$i][$j]= $this->players[$i]->getMyCards()[$j]->getNum();
            }
            
        }
        $this->PCards=$pcards;
    }
    
    public function getBettingOrder(){
        return $this->bettingOrder;
    }
        
    public function setBettingOrder($num){
        if($num<$this->nPlayers)            $this->bettingOrder=$num;
        else    $this->bettingOrder=$num% $this->nPlayers;
    }
    
    public function incrementBettingOrder(){
        $num=$this->bettingOrder;
        $this->setBettingOrder(++$num);
    }
    
    public function getPCards(){
        return $this->PCards;
    }
    
    public function setStage($stage){
        $this->stage=$stage;
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
    
    public function setPotBal(){
        $this->potBal=0;
    }
    
    public function getPotBal(){
        return $this->potBal;
    }
    public function addPotBal($bet){
        $this->potBal+=$bet;
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
    
    public function setNewOffer(){
        $num= $this->nPlayers;
        $curr=$this->bettingOrder;
        $prev=($curr-1<0?$num-1:$curr-1);
        $this->newOffer= $this->players[$prev]->getIPBal() - $this->players[$curr]->getIPBal();
    }
    
    public function getNewOffer(){
        return $this->newOffer;
    }
    public function initBetting(){
        $newOffer= $this->newOffer;
        if($this->stage==1){
            $bet= $this->initCont;
            $sb=$this->getSB();
            $game_id=$this->game_id;
            $num=$this->nPlayers;
            for($i=$sb,$j=0;$j<2;++$i,++$j){
                if($i==$num) {$i%=$num;}
                $this->players[$i]->bet($bet);
                $this->addPotBal($bet);
                $newOffer=$bet-$newOffer;
                $bet*=2;
            }
            $this->setBettingOrder($sb+2);
            
        }
        $this->newOffer=$newOffer;
    }
    

    
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
//        $nCards=2;
//        $num=$this->nPlayers;
//        for($i=0;$i<$nCards;++$i){
//            for($j=0;$j<$num;++$j){
//                //print_r($this->players[$j]->getMyCards());
//                if(!empty($this->players[$j]->getMyCards())){
//                    $user_id=$this->players[$j]->getUId();
//                    //echo $user_id;
//                    $user_loc=$this->players[$j]->getULoc()[$i];
//                    //echo $user_loc."<br />";
//                    $pict= $this->players[$j]->getMyCards()[$i]->getPict();
//                    //echo $pict."<br />";
//                    //print_r($this->dCards);
//                    $this->cardDisplay[$i*$nCards+$j]=array($user_id, $user_loc, $pict);
//                    //print_r($this->cardDisplay);
//                }
//                
//            }
//        }
    }
    
    public function setCommCard(){
        $this->commCards=array();
    }
    
    public function addCommCard($cards){
        array_push($this->commCards,$cards);
    }
    
    public function getCommCards(){
        return $this->commCards;
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
        if($this->nPlayers!=0){
            $game_id= $this->game_id;
            $nPlayers=$this->nPlayers;

            $this->smallBlind=$game_id % $this->nPlayers;
            $this->bigBlind=($game_id+1)% $this->nPlayers;
        }
        
    }
    
    public function getSB(){
        return $this->smallBlind;
    }
    public function getActiveNumPlayers(){
        $this->activeNP=0;
        for($i=0;$i<$this->nPlayers;$i++){
            if($this->players[$i]->getAct()) {$this->activeNP++;}
        }
        return $this->activeNP;
    }
    
    public function Deal($num){
        $this->setNumP($num);
//        $this->setLoc();
        $this->setCommCard();
//        $this->setBettingOrder();
//        $this->setPotBal();
        $this->setInitCont();
        $this->setBlind();
        $this->setPotBal();
//        $this->bettingOrder=$this->smallBlind;
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
    
    public function decideWinner(){
        $this->winner=-1;
        if($this->getActiveNumPlayers()==1){
            $cnt=0;
            //echo $this->getActiveNumPlayers();
            while($this->players[$cnt]->getAct()!=0){
                if($this->players[$cnt]->getAct()==1){
                    $this->winner=$cnt;
                    echo $this->winner;
                    
                }
                else ++$cnt;
            }
            //echo $this->winner;
        }
        else if($this->stage==4&&$this->getActiveNumPlayers()>1){
            //Hands check
            
        }
        
    }
    
    public function terminateGame(){
        $this->decideWinner();
        //echo $this->winner;
        if($this->winner>=0){
            $this->players[$this->winner]->bet($this->potBal*(-1));
            $this->setPotBal();
            for($i=0;$i<$this->nPlayers;$i++){
                $this->players->setIPBal(0);
            }
        }
        else{
            echo 'Error to terminate game';
        }
    }    
    

    public function river(){
        $this->stage=4;
        for($i= $this->nPlayers*2+1+3+1+1+1,$j=4;$i<$this->nPlayers*2+1+3+1+1+1+1;++$i,++$j){
            $dCard= $this->dCards[$i];
            $this->commCards[$j]=$dCard;
            $user_id="comm";
            $com_loc=$this->comm_loc[$j];
            $url=$this->dCards[$i]->getPict();
            $this->cardDisplay[$this->nPlayers*2+$j]=array($user_id, $com_loc, $url);
        }
        for($j=0;$j<$this->nPlayers;$j++){
            for($k=2+3+1;$k<2+3+1+1;$k++){
                $this->players[$j]->receiveCard($this->dCards[$i]);
            }

        }
        $this->setBettingOrder($this->smallBlind);
    }
    
    public function turn(){
        $this->stage=3;
        for($i= $this->nPlayers*2+1+3+1,$j=3;$i<$this->nPlayers*2+1+3+1+1;++$i,++$j){
            $dCard= $this->dCards[$i];
            $this->commCards[$j]=$dCard;
            $user_id="comm";
            $com_loc=$this->comm_loc[$j];
            $url=$this->dCards[$i]->getPict();
            $this->cardDisplay[$this->nPlayers*2+$j]=array($user_id, $com_loc, $url);
        }
        for($j=0;$j<$this->nPlayers;$j++){
            for($k=2+3;$k<2+3+1;$k++){
                $this->players[$j]->receiveCard($this->dCards[$i]);
            }

        }
        $this->setBettingOrder($this->smallBlind);
    }
    
    public function flop(){
        $this->stage=2;
        for($i= $this->nPlayers*2+1,$j=0;$i<$this->nPlayers*2+1+3;$i++,++$j){
            $dCard= $this->dCards[$i];
            $this->commCards[$j]=$dCard;
            $user_id="comm";
            $com_loc=$this->comm_loc[$j];
            $url=$this->dCards[$i]->getPict();
            $this->cardDisplay[$this->nPlayers*2+$j]=array($user_id, $com_loc, $url);
        }    
        
        for($j=0;$j<$this->nPlayers;$j++){
            for($k=2,$i=$this->nPlayers*2+1;$k<2+3;$k++,$i++){
//one card is throwed away, that's why it starts from $this->nPlayers*2+1
               
                $this->players[$j]->receiveCard($this->dCards[$i]);
               
            }
        }
        $this->setBettingOrder($this->smallBlind);
    }
    
    public function clearMyCards(){
        $num= $this->nPlayers;
        for($i=0;$i<$num;++$i){
            $this->players[$i]->setMyCards();
        }
    }
    
    
    public function preflop(){
        $this->stage=1;
//        $this->clearMyCards();
//        $this->clearCardDisplay();
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
        $this->initBetting();
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
