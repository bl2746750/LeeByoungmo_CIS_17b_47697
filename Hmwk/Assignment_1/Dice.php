<?php
/* 
 * File:   Dice.php
 * Author: Student Byoung Mo Lee
 * Created on September 20, 2019, 21:07 PM
 * Purpose: Create Dice Class with C++ and 
 *          Convert to JavaScript and PHP
 */

define('MAXDICES',6);
define('MINDICES',0);

class Dice{
    
        private $num;
        private $name;
        private $picture;
        
        private function setName(){
            switch($this->num%6){
                case 0:  $this->name="One";  break;
                case 1:  $this->name="Two";  break;
                case 2:  $this->name="Three";break;
                case 3:  $this->name="Four"; break;
                case 4:  $this->name="Five"; break;
                case 5:  $this->name="Six";  break;
                
                default: $this->name="Bad Value";
            }
        }
        
        private function setPict(){
            $this->picture="dices/dice".$this->name.".jpg";
        }
        
        public function Dice($num){
            if($num>=MINDICES&&$num<MAXDICES){
                $this->num=$num;
                $this->setName();
                $this->setPict();
            }else{
                $this->num=-1;
                $this->name="none";
                $this->picture="none";
            }
        }
        
        public function getNum(){return $this->num;}
        public function getName(){return $this->name;}
        public function getPict(){return $this->picture;}
        
        public function toString(){
            echo "<img src=".$this->picture." />";
            echo "<br/>Number = ".$this->num;
            echo "<br/>Name = ".$this->name;
            echo "<br/><br/>";
        }
}
?>

