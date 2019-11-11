/*
 * File:   Dealer.js
 * Author: Byoung Mo Lee
 * Created on October 11, 2019 02:36 AM
 * Purpose: Texas Holdem
 * 
 */

var NROUND=0;

function Deal(number){
    this.nPlayers=number;
    this.bigBlind=NROUND%this.nPlayers;
    this.smallBlind=this.bigBlind+1;
    this.activeNP=0;
    this.setPlayers();
    this.setActiveNumPlayers();
    this.deckOfCards();
    this.shuffle();
    this.preflop();
    this.flop();
    this.turn();
    this.river();
 
}

Deal.prototype.shuffle=function(){
    var deck=this.dCards;
    
    let m = deck.length, j;         //https://wsvincent.com/javascript-object-oriented-deck-cards/

    while (m) {
        j = Math.floor(Math.random() * m--);

        [deck[m], deck[j]] = [deck[j], deck[m]];
    }
    for(var i=0;i<deck.length;i++){         
        deck[i].displayCard();
    }
    document.write("<br/><br/>");
    this.dCards=deck;
   
};

Deal.prototype.setPlayers=function(){
    var num=this.nPlayers;
    document.write(num);
    var players=new Array(num);
    for(var i=0;i<num;i++){
        players[i]=new Player();
    }
    this.players=players;
};

Deal.prototype.setActiveNumPlayers=function(){
    
    var num=this.nPlayers;
    var actNum=0;
    
    for(i=0;i<num;i++){
        if(this.players[i].active) {actNum++;}
    }
    
    this.activeNP=actNum;
};

Deal.prototype.river=function(){
    var num=this.nPlayers;
    var deck=this.dCards;
    
    for(var i=0;i<num;i++){
        for(var j=6,k=2*num+3+1+1+1;k<2*num+3+1+1+1+1;k++){
            this.players[i].myCards[j]=deck[k];
            this.players[i].myCards[j].displayCard();
        }
    }
    document.write("<br/><br/>");
};

Deal.prototype.turn=function(){
    var num=this.nPlayers;
    var deck=this.dCards;
    
    
    for(var i=0;i<num;i++){
        for(var j=5,k=2*num+3+1+1;k<2*num+3+1+1+1;k++){
            this.players[i].myCards[j]=deck[k];
            this.players[i].myCards[j].displayCard();
        }
    }
    document.write("<br/><br/>");
};

Deal.prototype.flop=function(){
    var num=this.nPlayers;
    var deck=this.dCards;
        
    for(var i=0;i<num;i++){
        for(var j=2,k=num*2+1;k<2*num+1+3;k++,j++){
            this.players[i].myCards[j]=deck[k];
            this.players[i].myCards[j].displayCard();
        }
        document.write("<br/><br/>");
    }
    document.write("<br/><br/>");
};

Deal.prototype.preflop=function(){
    var num=this.nPlayers;
    var nCard=2;
    var bB=this.bigBlind;
    var deck=this.dCards;
    for(var i=0;i<nCard;i++){
        for(var j=0;j<num;j++){
            order=(j+bB)%num;
            this.players[order].myCards[i]=deck[j+i*num];
            this.players[order].myCards[i].displayCard();
        }
        
    }
    document.write("<br/><br/>");
};

Deal.prototype.deckOfCards=function(){
    var nCards=52;
    var dCards=new Array(nCards);
    for(var i=0;i<dCards.length;i++){
        dCards[i]=new Card(i);
        //dCards[i].toString();
    }
    for(var i=0;i<dCards.length;i++){         
        dCards[i].displayCard();
    }
    document.write("<br/><br/>");
    this.dCards=dCards;
};
