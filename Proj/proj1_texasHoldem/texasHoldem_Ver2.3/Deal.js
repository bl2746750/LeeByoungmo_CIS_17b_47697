/*
 * File:   Dealer.js
 * Author: Byoung Mo Lee
 * Created on October 11, 2019 02:36 AM
 * Purpose: Texas Holdem
 * 
 */

var NROUND = 0;

function Deal(number) {

    this.nPlayers = number;
//    document.getElementById("011").innerHTML = number;
    this.bigBlind = NROUND % this.nPlayers;
    this.smallBlind = this.bigBlind + 1;
    this.activeNP = 0;
    this.setPlayers();
    this.setLoc();
    this.setComLoc();
    this.setActiveNumPlayers();
    this.deckOfCards();
    this.shuffle();
    this.preflop();
    this.flop();
    this.turn();
    this.river();

}

Deal.prototype.shuffle = function () {
    var deck = this.dCards;

    let m = deck.length, j;         //https://wsvincent.com/javascript-object-oriented-deck-cards/

    while (m) {
        j = Math.floor(Math.random() * m--);

        [deck[m], deck[j]] = [deck[j], deck[m]];
    }
//    for(var i=0;i<deck.length;i++){         
//        deck[i].displayCard();
//    }
    //document.write("<br/><br/>");
    this.dCards = deck;

};

Deal.prototype.setPlayers = function () {
    num=this.nPlayers;
//    document.getElementById("001").innerHTML=num;
    var players = new Array(num);
    for (var i = 0; i < num; i++) {
        players[i] = new Player();
    }
    this.players = players;
};

Deal.prototype.setActiveNumPlayers = function () {

    var num = this.nPlayers;
//    document.getElementById("001").innerHTML=num;
    var actNum = 0;

    for (i = 0; i < num; i++) {
        if (this.players[i].active) {
            actNum++;
        }
    }

    this.activeNP = actNum;
};

Deal.prototype.river = function () {
    var num = this.nPlayers;
    var deck = this.dCards;

    for (var i = 0; i < num; i++) {
        for (var j = 6, k = 2 * num + 3 + 1 + 1 + 1; k < 2 * num + 3 + 1 + 1 + 1 + 1; k++) {
            this.players[i].myCards[j] = deck[k];
            //this.players[i].myCards[j].displayCard();
        }
    }
    view.displayCard(this.comLoc[4],deck[2 * num + 3 + 1 + 1 + 1].picture);
    //document.write("<br/><br/>");
};

Deal.prototype.turn = function () {
    var num = this.nPlayers;
    var deck = this.dCards;


    for (var i = 0; i < num; i++) {
        for (var j = 5, k = 2 * num + 3 + 1 + 1; k < 2 * num + 3 + 1 + 1 + 1; k++) {
            this.players[i].myCards[j] = deck[k];
            //this.players[i].myCards[j].displayCard();
        }
    }
    view.displayCard(this.comLoc[3],deck[2*num+3+1+1].picture);
    //document.write("<br/><br/>");
};

Deal.prototype.flop = function () {
    var nCard=3;
    var num = this.nPlayers;
    var deck = this.dCards;

    for (var i = 0; i < num; i++) {
        for (var j = 2, k = num * 2 + 1; k < 2 * num + 1 + nCard; k++, j++) {
            this.players[i].myCards[j] = deck[k];
            //this.players[i].myCards[j].displayCard();
            
        }
        //document.write("<br/><br/>");
    }
    
    for(var i=0;i<nCard;i++){
        view.displayCard(this.comLoc[i],deck[i+num*2+1].picture);
    }
    //document.write("<br/><br/>");
};

Deal.prototype.preflop = function () {
    var num = this.nPlayers;
//    document.getElementById("011").innerHTML = this.nPlayers;
    var nCard = 2;
    var bB = this.bigBlind;
    var deck = this.dCards;
    for (var i = 0; i < nCard; i++) {
        for (var j = 0; j < num; j++) {
            var order = (j + bB) % num;
            this.players[order].myCards[i] = deck[j + i * num];
            var location = this.players[order].loc[i];
            var url = this.players[order].myCards[i].picture;
            view.displayCard(location, url)
            // this.players[order].myCards[i].displayCard();
        }

    }
    //document.write("<br/><br/>");
};

Deal.prototype.deckOfCards = function () {
    var nCards = 52;
    var dCards = new Array(nCards);
    for (var i = 0; i < dCards.length; i++) {
        dCards[i] = new Card(i);
        //dCards[i].toString();
    }
//    for(var i=0;i<dCards.length;i++){         
//        dCards[i].displayCard();
//    }
    //document.write("<br/><br/>");
    this.dCards = dCards;
};

Deal.prototype.setLoc = function () {
    num=this.nPlayers;
//    document.getElementById("011").innerHTML = num;
    if (num == 2) {
        this.players[0].loc=["001", "002"];
        this.players[1].loc=["005", "006"];
    } else if (num == 3) {
        this.players[0].loc=["001", "002"];
        this.players[1].loc=["005", "006"];
        this.players[2].loc=["009", "010"];
    }
    else if(num==4){
        this.players[0].loc = ["001","002"];
        this.players[1].loc = ["005","006"];
        this.players[2].loc = ["009","010"];
        this.players[3].loc = ["013","014"];
    }
    else if(num==5){
        this.players[0].loc = ["001","002"];
        this.players[1].loc = ["005","006"];
        this.players[2].loc = ["009","010"];
        this.players[3].loc = ["013","014"];
        this.players[4].loc = ["213","214"];
    }
    else if(num==6){
        this.players[0].loc = ["001","002"];
        this.players[1].loc = ["005","006"];
        this.players[2].loc = ["009","010"];
        this.players[3].loc = ["013","014"];
        this.players[4].loc = ["213","214"];
        this.players[5].loc = ["209","210"];
    }
    else if(num==7){
        this.players[0].loc = ["001","002"];
        this.players[1].loc = ["005","006"];
        this.players[2].loc = ["009","010"];
        this.players[3].loc = ["013","014"];
        this.players[4].loc = ["213","214"];
        this.players[5].loc = ["209","210"];
        this.players[6].loc = ["205","206"];
    }
     else if(num==8){
        this.players[0].loc = ["001","002"];
        this.players[1].loc = ["005","006"];
        this.players[2].loc = ["009","010"];
        this.players[3].loc = ["013","014"];
        this.players[4].loc = ["213","214"];
        this.players[5].loc = ["209","210"];
        this.players[6].loc = ["205","206"];
        this.players[7].loc = ["201","202"];
    }
    
    else {
        view.displayMessage("wrong number!!!");
    }
} ;

Deal.prototype.setComLoc=function(){
    
    var comLoc= ["106","107","108","109","110"];
    this.comLoc=comLoc;
}