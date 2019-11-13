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
    private $user_loc;
    private $user_message_loc;
    
    public function Player($email) {
        //require_once 'inc/loginMysql.php';
        $this->setMyCards();
//        $this->pName=$email;
//        $query="SELECT `balance` FROM `entity_user` WHERE `email`='$email'";
//        $result=$link->query($query);
//        if(!$result) die("Database access failed");
//        
//        $row=$result->fetch_array(MYSQLI_NUM);
//        $this->nBalance=$row[0];
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
