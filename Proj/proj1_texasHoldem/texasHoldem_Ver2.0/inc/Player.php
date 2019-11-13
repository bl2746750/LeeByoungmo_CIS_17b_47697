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

    private $pName;
    private $nBalance;
    private $myCards;
    private $active=1;
    
    public function Player() {
        
        $this->setMyCards();
        //$this->pName=$email;
        //$query="SELECT `balance` FROM `entity_user` WHERE `email`='$email'";
        //$balance=$link->query($query);
        //$this->nBalance=$balance;
    }
    
    public function setPName($email){
        $this->pName=$email;
    }
    public function setMyCards() {
        $this->myCards = array();
    }


    public function getMyCards() {
        return $this->myCards;
    }
    
    public function bet($b){
        $this->nBalance-=$b;
    }
    
    public function check($a){
        $this->nBalance-=$a;
    }
    
    public function fold(){
        $this->active=0;
    }

    
}
