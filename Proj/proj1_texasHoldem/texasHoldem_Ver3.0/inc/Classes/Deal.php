<?php

/*
 * File:   Dealer.php
 * Author: Byoung Mo Lee
 * Created on September 23, 2019 23:58 PM
 * Purpose: Texas Holdem
 * 
 */
include ("./Player.php");

session_start();



class Deal {
    //put your code here
    private $nPlayers;
    private $activeNP;
    public $players;
    private $dCards;
    private $bigBlind;
    private $smallBlind;
    private static $nRound=1;
    private $comm_loc;
    private $link;
    
    public function __construct() {
        require 'inc/db/loginMysql.php';
        $this->link=$link;
    }
   
    
      
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
    
    public function Deal(){
//        $this->setPlayers();
//        $this->setBlind();
//        $this->deckOfCards();
////        $order=($i+$this->bigBlind)%$this->nPlayers;
//        
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
        
    public function setLoc(){
        $this->players[0]->user_loc=array("001","002");
        $this->players[1]->user_loc=array("005","006");
        $this->players[2]->user_loc=array("009","010");
        $this->players[3]->user_loc=array("013","014");
        $this->players[4]->user_loc=array("213","214");
        $this->players[5]->user_loc=array("209","210");
        $this->players[6]->user_loc=array("205","206");
        $this->players[7]->user_loc=array("201","202");
        
        $this->comm_loc=array("106","107","108","109","110");
        
        $this->players[0]->user_message_loc=array("000");
        $this->players[1]->user_message_loc=array("004");
        $this->players[2]->user_message_loc=array("008");
        $this->players[3]->user_message_loc=array("012");
        $this->players[4]->user_message_loc=array("212");
        $this->players[5]->user_message_loc=array("208");
        $this->players[6]->user_message_loc=array("204");
        $this->players[7]->user_message_loc=array("200");
        
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
                
//                echo("<br>Player".$order);
//                if($this->bigBlind===$order) {echo(": Big Blind<br>");}
//                echo("<br>");
                $this->players[$order]->myCards[$i]=($this->dCards[$j+$i*$this->nPlayers]);
//                $this->players[$order]->myCards[$i]->displayCard();
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
    
    
    
    public function check_player_num(){
        //require_once 'loginMysql.php';
        $nPlayers=0;
        $query="SELECT * FROM entity_users WHERE status=1;";
        $result=$this->link->query($query);
        $result=$this->link->query($query);
        if(!$result) die("Database access failed1");
        $nPlayers=$result->num_rows;
        $result->close();
        $this->link->close();
        return $nPlayers;
    }
    
    
    
    
    
    
    public function setPlayers(){
        //require_once 'loginMysql.php';
        $query="SELECT * FROM entity_users WHERE status=1";
        $result=$this->link->query($query);
        if(!$result) die ("setPlayers query failed");
        $rows=$result->num_rows;
        //echo $rows;
        $this->nPlayers=$rows;
        for($j=0;$j<$rows;++$j){
            $row=$result->fetch_array(MYSQLI_ASSOC);
            //echo $row['email'];
            $this->players[$j]->pName=$row['email'];
            $this->players[$j]->nBalance=$row['balance'];
            if($row['user_id']=$_SESSION['user_id']){$_SESSION['p_id']=$j;}
            $msg_loc=$this->players[$j]->getUMLoc();
        }
        $user_id=$_SESSION['user_id'];
        $p_id=$_SESSION['p_id'];
        $query="UPDATE entity_users SET p_id=$p_id WHERE user_id=$user_id";
        $result=$this->link->query($query);
        if(!$result) die("p_id update failed!!!");
        $query = "SELECT * FROM entity_game WHERE status=1";
        $result = $link->query($query);
        if (!$result) {$this->createGame();}
        else{
            $rows = $result->num_rows;
            $query = "SELECT * FROM entity_game WHERE status=1";
            $result = $link->query($query);
            if (!$result) die("Database access failed2");
            $rows = $result->num_rows;

            $row = $result->fetch_array(MYSQLI_ASSOC);
            $game_id = $row['game_id'];
            $_SESSION['game_id'] = $game_id;
        }
    }
    
    public function createGame(){
        require 'inc/db/loginMysql.php';
        $query="INSERT INTO entity_game VALUES (NULL,0,0,NULL,1)";
        $result=$link->query($query);
        if(!$result) echo "CREATE GAME failed!";
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
