<?php

/*
 * File:   Card.php
 * Author: Byoung Mo Lee
 * Created on September 23, 2019 21:47 PM
 * Purpose: Texas Holdem
 * 
 */
define('MAXCRDS', 52);
define('MINCRDS', 0);

class Card {

    //put your code here
    private $number;
    private $nFace;  //2~J(11),Q(12),K(13),A(14)
    private $nSuit;  //0-Spades, 1-Hearts, 2-Diamonds, 3-Clubs
    private $sFaceName;
    private $sSuitName;
    private $sPict;

    public function Card($number) {
        if ($number >= MINCRDS && $number < MAXCRDS) {
            $this->number = $number;
            $this->setFace();
            $this->setSuit();
            $this->setPict();
        } else {
            $this->number = -1;
            $this->nFace = -1;
            $this->nSuit = -1;
            $this->sFaceName = "none";
            $this->sSuitName = "none";
            $this->sPict = "noen";
        }
    }

    public function setFace() {
        $num = $this->number % 13 + 1;

        if ($num == 1) {$num = 14;}
        $this->nFace = $num;
        
        
        switch ($this->nFace) {
            case 2: $this->sFaceName = "two";break;
            case 3: $this->sFaceName = "three";break;
            case 4: $this->sFaceName = "four";break;
            case 5: $this->sFaceName = "five";break;
            case 6: $this->sFaceName = "six";break;
            case 7: $this->sFaceName = "seven";break;
            case 8: $this->sFaceName = "eight";break;
            case 9: $this->sFaceName = "nine";break;
            case 10: $this->sFaceName = "ten";break;
            case 11: $this->sFaceName = "jack";break;
            case 12: $this->sFaceName = "queen";break;
            case 13: $this->sFaceName = "king";break;
            case 14: $this->sFaceName = "ace";break;
            default: $this->sFaceName = "Bad Value";
        }
    }

    public function setSuit() {
        if ($this->number < 13) {
            $this->nSuit = 0;
            $this->sSuitName = "spades";
        } else if ($this->number < 26) {
            $this->nSuit = 1;
            $this->sSuitName = "hearts";
        } else if ($this->number < 39) {
            $this->nSuit = 2;
            $this->sSuitName = "diamonds";
        } else if ($this->number < 52) {
            $this->nSuit = 3;
            $this->sSuitName = "clubs";
        } else {
            $this->suit = -1;
            $this->sSuitName = "Bad Value";
        }
    }

    
    private function setPict() {
        $this->sPict = "Cards/" . $this->sFaceName . $this->sSuitName.".jpg";
    }

    public function setACard(&$card) {
        $this->setCard($card->nFace, $card->nSuit);
    }

    public function getFace() {
        return $this->nFace;
    }

    public function getSuit() {
        return $this->nSuit;
    }

    public function getFaceName() {
        return $this->sFaceName;
    }

    public function getSuitName() {
        return $this->sSuitName;
    }

    public function getPict() {
        return $this->sPict;
    }

    public function toString() {
        echo "<img src=".$this->sPict." />";
        echo "<br/>Face Number= " . $this->nFace;
        echo "<br/>Suit Number= " . $this->nSuit;
        echo "<br/>Face Name= " . $this->sFaceName;
        echo "<br/>Suit Name= " . $this->sSuitName;
        echo "<br/><br/>";
    }
    
    public function displayCard(){
        echo "<img src=".$this->sPict." />";    
    }

}

?>
