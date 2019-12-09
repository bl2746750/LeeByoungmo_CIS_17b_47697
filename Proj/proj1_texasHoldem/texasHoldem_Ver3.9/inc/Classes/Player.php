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
    
    private $p_id;
    private $u_id;
    private $pName;
    private $nBalance;
    private $myCards;
    private $active=1;
    private $user_loc;
    private $user_message_loc;
    
    public function getBal(){
        return $this->nBalance;
    }
    public function setULoc($loc1,$loc2){
        $this->user_loc[0]=$loc1;
        $this->user_loc[1]=$loc2;
        
    }
    public function fold(){
        $this->setAct(0);
    }
    public function setAct($num){
        $this->active=$num;
    }
    
    public function getAct(){
        return $this->active;
    }
    public function setUMLoc($loc){
        $this->user_message_loc=$loc;
    }
    public function getUId(){
        return $this->u_id;
    }
    
    public function receiveCard($card){
        array_push($this->myCards,$card);
    }
    
    public function getMyCard($nth){
        return $this->myCards[$nth];
    }
    public function getPId(){
        return $this->p_id;
    }
    public function getULoc(){
        return $this->user_loc;
    }
    
    public function getUMLoc(){
        return $this->user_message_loc;
    }
    
    public function getPName(){
        return $this->pName;
    }
    public function Player() {
        //require_once 'inc/loginMysql.php';
        $this->setMyCards();
        $this->pName='';
        $this->nBalance=0;
        $this->user_loc=array("","");
        $this->user_message_loc="";
        $this->active=1;
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

    public function setPlayer($u_id,$pName,$nBalance,$p_id){
        $this->u_id=$u_id;
        $this->pName=$pName;
        $this->nBalance=$nBalance;
        $this->p_id=$p_id;
        $this->setMyCards();
        $this->user_loc=array("","");
        $this->user_message_loc="";
        $this->active=1;
    }
}
