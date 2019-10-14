<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Survey{
    private $name;
    private $desc;
    private $qstn;
    
    public function Survey($name,$description,$quesNum){
        echo("test");
        $nArgs=func_num_args();
        if($nArgs==0||$nArgs>3){
            $this->name="";
            $this->desc="";
        }
        else if($nArgs==3){
            $this->name=$name;
            $this->desc=$description;
            $this->qstn=$quesNum;
        }
        else if($nArgs==2){
            $this->name=$name;
            $this->desc=$description;
        }
        else{
            $this->name=$name->name;
            $this->desc=$name->desc;
            $this->qstn=$name->qstn;
        }
        
    }
    
    public function setName($name){
        $this->name=$name;
    }
    
    public function setDesc($description){
        $this->desc=$description;
    }
    
    public function addQstn(){
        array_push($this->qstn,$question);
    }
    
    public function getName(){
        return $this->name;
    }
    
    public function getDesc(){
        return $this->desc;
    }
    
    public function getQstn($number){
        if($number&&$number<count($this->qstn)){
            return $this->qstn[$number];
        }
        else{
            return "This is not a Survey";
        }
    }
    
    public function display(){
        echo("<p>"."Name: ".$this->name."</p>");
        echo("<br>"."Description: ".$this->desc."<br><br>");
        for($i=0;$i<count($this->qstn);$i++){
            if(count($this->qstn[$i])){echo("Qeustion".($i+1).": ".$this->qstn[$i]."<br>");}
        }
        echo("<br>");
    }
}