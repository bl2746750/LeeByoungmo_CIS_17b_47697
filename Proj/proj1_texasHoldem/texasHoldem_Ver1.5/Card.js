/*
 * File:   Card.js
 * Author: Byoung Mo Lee
 * Created on October 11, 2019 02:06 PM
 * Purpose: Texas Holdem
 * 
 */

var MAXCRDS=52;
var MINCRDS=0;

function Card(number){
    //Public properties of the class
    if(number>=MINCRDS&&number<MAXCRDS){
        this.number=number;
        this.setFace();
        this.setSuit();
        //this.setName();
        this.setPict();
        
    }else{
        this.number=-1;
        this.nFace=-1;
        this.nSuit=-1;
        this.sSuitName="none";
        this.sFaceName="none";
        this.picture="none";
    }
}

//Setting the Face Value
Card.prototype.setFace=function(){
    var num=this.number%13+1;
    if(num===1){num=14;}
    this.nFace=num;
    
    switch(this.nFace){
        case 2: this.sFaceName = "two";break;
        case 3: this.sFaceName = "three";break;
        case 4: this.sFaceName = "four";break;
        case 5: this.sFaceName = "five";break;
        case 6: this.sFaceName = "six";break;
        case 7: this.sFaceName = "seven";break;
        case 8: this.sFaceName = "eight";break;
        case 9: this.sFaceName = "nine";break;
        case 10: this.sFaceName = "ten";break;
        case 11: this.sFaceName = "jack";break;
        case 12: this.sFaceName = "queen";break;
        case 13: this.sFaceName = "king";break;
        case 14: this.sFaceName = "ace";break;
        default: this.sFaceName = "Bad Value";
    }
};
//Setting the Suit Value
Card.prototype.setSuit=function(){
    if (this.number < 13) {
            this.nSuit = 0;
            this.sSuitName = "spades";
        } else if (this.number < 26) {
            this.nSuit = 1;
            this.sSuitName = "hearts";
        } else if (this.number < 39) {
            this.nSuit = 2;
            this.sSuitName = "diamonds";
        } else if (this.number < 52) {
            this.nSuit = 3;
            this.sSuitName = "clubs";
        } else {
            this.suit = -1;
            this.sSuitName = "Bad Value";
        }
};


//Simply setting the picture
Card.prototype.setPict=function(){
    this.picture="Cards/"+this.sFaceName+this.sSuitName+".jpg";
};

//To String function of the Card Class
Card.prototype.toString=function(){
    document.write("<img src="+this.picture+" />");
//    document.write("<br/>Face Number = "+this.nFace);
//    document.write("<br/>Suit Number = "+this.nSuit);
//    document.write("<br/>Face Name = "+this.sFaceName);
//    document.write("<br/>Suit Name = "+this.sSuitName);
//    document.write("<br/>Picture = "+this.picture);
//    document.write("<br/><br/>");
};

Card.prototype.displayCard=function(){
    document.write("<img src="+this.picture+" />");
};