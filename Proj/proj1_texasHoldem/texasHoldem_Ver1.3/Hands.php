<?php

/*
 * File:   Hands.php
 * Author: Byoung Mo Lee
 * Created on October 3, 2019 21:47 PM
 * Purpose: Texas Holdem
 * 
 */
include ("Deal.php");

class Hands {

    //put your code here
    private $game;
    private $hands;
    private $points;
    private $table;

    private function setGame(Deal $game) {
        $this->game = $game;
    }

    public function Hands(Deal $game) {
        $this->setTable($game);
        $this->checkHands();
    }

    public function setHands() {
        //At first, I assumed all the players survived
        //But, if we want to make a betting procedure, some of them may die.
        //In this case, we have to implement the number of rows.
        //Or, sometimes we can consider to update the player's hands 
        //whenever some event happens.(10/4/2019 Byoung)
        $this->hands[count($this->table)] = array();
    }

    public function setTable(Deal $game) {
        $this->setGame($game);
        $this->table = array();
        //print_r($this->game);

        for ($i = 0; $i < $this->game->getNumP(); $i++) {
            for ($j = 0; $j < count($this->game->getPlayers()[$i]->myCards); $j++) {
                //echo("<br><br>".count($this->game->getPlayers()[$i]->myCards)."<br><br>");
                $this->table[$i][$j] = $this->game->getPlayers()[$i]->myCards[$j]->getNum();
            }
            //print_r($this->game->getPlayers()[$i]->myCards);
        }
        //echo("<br><br>" . count($this->table) . "<br><br>");
        //print_r($this->table);
    }

    public function checkHands() {
        for ($i = 0; $i < count($this->table); $i++) {
            $num = $this->table[$i];
                            
            echo("<br><br>Player[".$i."]<br>");
            for($j=0;$j<count($num);$j++){
                $a=new Card($num[$j]);
                $a->displayCard();
            }
           
            echo("<br>isAFlush=" . $this->isAFlush($num) . "<br>");
            echo("isAStright=" . $this->isAStright($num) . "<br>");
            echo("pairCheck=" . $this->pairCheck($num) . "<br>");
            echo("hands=" . $this->decideHands($num) . "<br>");
            echo("handsStr=" . $this->handsStr($this->decideHands($num)) . "<br>");
            echo("<br><br>");
            
        }
    }
    // hands=0: Highcard
    // hands=1: One Pair
    // hands=2: Two Pair
    // hands=3: Three of a card
    // hands=4: Straight
    // hands=5: Flush
    // hands=6: Full house
    // hands=7: Four of a card
    // hands=8: Straight Flush
    public function handsStr($hands){
        
        switch ($hands) {
            case 0: $handsStr = "Highcard";break;
            case 1: $handsStr = "One Pair";break;
            case 2: $handsStr = "Two Pair";break;
            case 3: $handsStr = "Three of a card";break;
            case 4: $handsStr = "Straight";break;
            case 5: $handsStr = "Flush";break;
            case 6: $handsStr = "Full house";break;
            case 7: $handsStr = "Four of a card";break;
            case 8: $handsStr = "Straight Flush";break;
        }
        return $handsStr;
    }
    
    public function decideHands(array $num){
        if($this->isAFlush($num)&&$this->isAStright($num)){
            $case=0;
            if($case) {$hands=8;}
            else{$hands=5;}
        }else if($this->pairCheck($num)===7) {$hands=7;}
        else if($this->pairCheck($num)===6) {$hands=6;}
        else if($this->isAFlush($num)){$hands=5;}
        else if($this->isAStright($num)){$hands=4;}
        else {$hands=$this->pairCheck($num);}
        
        return $hands;
    }
    
    public function pairCheck(array $num){
        $hands=0;
    
         $faceStat = $this->makeFtab($num);
         rsort($faceStat);
         if($faceStat[0]===4){$hands=7;}
         else if($faceStat[0]===3){
             if($faceStat[1]===1){$hands=3;}
             else if($faceStat[1]>1){$hands=6;}
         }
         else if($faceStat[0]===2){
             if($faceStat[1]===2) {$hands=2;}
             else {$hands=1;}
         }
         else {$hands=0;}
         
         return $hands;
         
    }

    public function isAFlush(array $num) {

        for ($i = 0; $i < count($num); $i++) {
            $numTable[$i] = intdiv($num[$i], 13);
            //echo("<br><br> numTable=".$numTable[$i]."<br><br>");
        }

        $suitStat = array(0, 0, 0, 0, 0, 0);
        for ($i = 0; $i < count($numTable); $i++) {
            if ($numTable[$i] === 0) {
                $suitStat[0] ++;
            } else if ($numTable[$i] === 1) {
                $suitStat[1] ++;
            } else if ($numTable[$i] === 2) {
                $suitStat[2] ++;
            } else if ($numTable[$i] === 3) {
                $suitStat[3] ++;
            }
        }
        if (max($suitStat) > 4) {
            $suitStat[4] = max($suitStat);
            $suitStat[5] = array_keys($suitStat, max($suitStat));
        }
        return $suitStat[4];
    }

    public function isAStright(array $num) {
        $faceStat = $this->makeFtab($num);
//        for($i=0;$i<count($faceStat);$i++){
//            echo("<br><br>faceStat[".$i."]".$faceStat[$i]."<br><br>");
//        }
        $cnt = array(0, 0);
        for ($i = 0; $i < 8; $i++) {
            $cnt[0] = 0;
            do {
                $a = $faceStat[$i + $cnt[0]];
                $cnt[1] = $i+$cnt[0];
                $cnt[0] ++;
            } while ($a);
            if ($cnt[0] > 5) {
                $faceStat[0] = 1;
                $faceStat[1] = $cnt[1];
                break;
            }
        }

        if ($faceStat[14]) {
            $cnt[0] = 0;
            do {
                $a = $faceStat[2 + $cnt[0]];
                $cnt[0] ++;
            } while ($a);

            if ($cnt[0] > 4) {
                $faceStat[0] = 1;
                $faceStat[1] = 14;
            }
        }
        return $faceStat[0];
    }

    private function makeFTab($num) {

        for ($i = 0; $i < count($num); $i++) {
            $numTable[$i] = $num[$i] % 13 + 2;
        }

        $faceStat = array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        for ($i = 0; $i < count($numTable); $i++) {
            if ($numTable[$i] === 2) {
                $faceStat[2] ++;
            } else if ($numTable[$i] === 3) {
                $faceStat[3] ++;
            } else if ($numTable[$i] === 4) {
                $faceStat[4] ++;
            } else if ($numTable[$i] === 5) {
                $faceStat[5] ++;
            } else if ($numTable[$i] === 6) {
                $faceStat[6] ++;
            } else if ($numTable[$i] === 7) {
                $faceStat[7] ++;
            } else if ($numTable[$i] === 8) {
                $faceStat[8] ++;
            } else if ($numTable[$i] === 9) {
                $faceStat[9] ++;
            } else if ($numTable[$i] === 10) {
                $faceStat[10] ++;
            } else if ($numTable[$i] === 11) {
                $faceStat[11] ++;
            } else if ($numTable[$i] === 12) {
                $faceStat[12] ++;
            } else if ($numTable[$i] === 13) {
                $faceStat[13] ++;
            } else if ($numTable[$i] === 14) {
                $faceStat[14] ++;
            }
        }
        return $faceStat;
    }

}
