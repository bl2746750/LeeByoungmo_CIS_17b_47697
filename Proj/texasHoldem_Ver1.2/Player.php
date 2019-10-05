<?php

/*
 * File:   Player.php
 * Author: Byoung Mo Lee
 * Created on September 24, 2019 01:15 AM
 * Purpose: Texas Holdem
 * 
 */
include ("Card.php");

class Player {

    //private $pName;
    //private $nBalance;
    private $myCards;
    
    

    public function Player() {
        $this->setMyCards();
        //$this->pName="";
        //$this->nBalance=1000;
    }

    public function setMyCards() {
        $this->myCards = array();
    }


    public function getMyCards() {
        return $this->myCards;
    }

    
}
