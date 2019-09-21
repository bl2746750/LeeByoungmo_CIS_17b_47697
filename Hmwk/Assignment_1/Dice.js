/* 
 * File:   Dice.js
 * Author: Student Byoung Mo Lee
 * Created on September 20, 2019, 22:39 PM
 * Purpose: Create Dice Class with C++ and 
 *          Convert to JavaScript and PHP
 */


var MAXDICES=6;
var MINDICES=0;

function Dice(num){
    if(num>=MINDICES&&num<MAXDICES){
        this.num=num;
        this.setName();
        this.setPict();
    }else{
        this.num=-1;
        this.name="none";
        this.picture="none";
    }
}
        
Dice.prototype.setName=function(){
    switch(this.num%6){
        case 0:  this.name="One";  break;
        case 1:  this.name="Two";  break;
        case 2:  this.name="Three";break;
        case 3:  this.name="Four"; break;
        case 4:  this.name="Five"; break;
        case 5:  this.name="Six";  break;

        default: this.name="Bad Value";
    }
};

Dice.prototype.setPict=function(){
    this.picture="dices/dice"+this.name+".jpg";
};

Dice.prototype.toString=function(){
    document.write( "<img src="+this.picture+" />");
    document.write( "<br/>Number = "+this.num);
    document.write( "<br/>Name = "+this.name);
    document.write( "<br/><br/>");
};



