<?php

/*
 * File:   Dealer.php
 * Author: Byoung Mo Lee
 * Created on September 23, 2019 23:58 PM
 * Purpose: Texas Holdem
 * 
 */
include ("Player.php");

session_start();



class Deal {
    //put your code here
    private $nPlayers;
    private $activeNP;
    public $players;
    private $dCards;
    private $bigBlind;
    private $smallBlind;
    private $comm_loc;
    private $link;
    
    public function __construct() {
        require '../db/loginMysql_1.php';
        $this->link=$link;
    }
   
    
      
    public function setBlind(){
        require'../db/check_game_id.php';
        $nRound= check_game_id();
        $this->bigBlind=Deal::$nRound% $this->nPlayers;
        $this->smallBlind=$this->bigBlind+1;
    }
    
    public function setActiveNumPlayers(){
        $this->activeNP=0;
        for($i=0;$i<$this->nPlayers;$i++){
            if($this->players[$i]->active) {$this->activeNP++;}
        }
    }
    
    public function Deal($num){
        $this->nPlayers=$num;
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
                $result=mysqli_query($this->link,"SELECT user_id FROM entity_users WHERE p_id=$order");
                $row=mysqli_fetch_row($result);
                $user_id=$row;
                echo $user_id."<br />";
//                echo("<br>Player".$order);
//                if($this->bigBlind===$order) {echo(": Big Blind<br>");}
//                echo("<br>");
                $this->players[$order]->myCards[$i]=($this->dCards[$j+$i*$this->nPlayers]);
//                $this->players[$order]->myCards[$i]->displayCard();
                $card_num=$this->players[$order]->myCards[$i]->getNum();
                echo $card_num."<br />";
                $img_loc= $this->players[$order]->getULoc()[$i];
                echo $img_loc."<br />";
                $url= $this->players[$order]->myCards[$i]->getPict();
                echo $url."<br />";
                $stmt=mysqli_prepare($this->link,"INSERT INTO xref_card_dist VALUES(NULL,$card_num,$user_id,'$img_loc','$url'");
                mysqli_stmt_execute($stmt);
                
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
    
    public function shuffle(){
        shuffle($this->dCards);
        return $this->dCards;
    }
    
    public function getDCards(){
        return $this->dCards;
    }
    
    public function setPlayers($players){
        for($j=0;$j<count($players);++$j){
            $this->players[$j]=$players[$j];
        }
        
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
