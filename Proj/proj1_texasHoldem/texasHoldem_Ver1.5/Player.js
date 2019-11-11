/*
 * File:   Player.js
 * Author: Byoung Mo Lee
 * Created on October 11, 2019 02:24 AM
 * Purpose: Texas Holdem
 * 
 */

function Player(){
    this.setPName(name);
    this.nBalance=1000;
    this.myCards=new Card;
    this.active=1;
    this.bet();
    this.check();
    this.fold();
    
}


Player.prototype.setPName=function(name){
    if (name === undefined) {
        this.pName = "";
    }else{this.pName=name;}
};

Player.prototype.bet=function(b1){
    if(b1===undefined) {b1=0;}
    else{this.nBalance-=b1;}
};

Player.prototype.check=function(a1){
    if(a1===undefined) {a1=0;}
    else{this.nBalance-=a1;}this.nBalance-=a1;
};

Player.prototype.fold=function(){
    this.active=0;
};

