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
    this.setComLoc();
    this.setLocations();
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
//    for(var i=0;i<deck.length;i++){ 
//        view.displayCard("000",deck[0].picture);
        
//        deck[i].displayCard();
//    }
//    document.write("<br/><br/>");

    
    this.dCards=deck;
   
};

Deal.prototype.setPlayers=function(){
    var num=this.nPlayers;
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
    var loc=this.comLoc;
    
    for(var i=0;i<num;i++){
        for(var j=6,k=2*num+3+1+1+1;k<2*num+3+1+1+1+1;k++){
            this.players[i].myCards[j]=deck[k];
//            this.players[i].myCards[j].displayCard();
//            view.displayCard(loc[4],deck[k].picture);
        }
    }
//    document.write("<br/><br/>");
};

Deal.prototype.turn=function(){
    var num=this.nPlayers;
    var deck=this.dCards;
    var loc=this.comLoc;
    
    for(var i=0;i<num;i++){
        for(var j=5,k=2*num+3+1+1;k<2*num+3+1+1+1;k++){
            this.players[i].myCards[j]=deck[k];
//            this.players[i].myCards[j].displayCard();
//            view.displayCard(loc[3],deck[k].picture);
        }
    }
//    document.write("<br/><br/>");
};

Deal.prototype.flop=function(){
    var num=this.nPlayers;
    var deck=this.dCards;
    var comLoc=this.comLoc;
    var c=0;
//    for(var i=0;i<num;i++){
//        view.displayMessage(comLoc[i]);
//        view.displayCard(comLoc[i],deck[i].picture);
//    }
    for(var i=0;i<num;i++){
        
//        view.displayMessage(comLoc[i]);
//        view.displayCard(comLoc[i],deck[i].picture);
        for(var j=2,k=num*2+1;k<2*num+1+3;k++,j++){
//            view.displayCard(comLoc[0],deck[0].picture);
            this.players[i].myCards[j]=deck[k];
//            this.players[i].myCards[j].displayCard();
//            if(c<3){
                
//                view.displayMessage(comLoc[c]);
//                view.displayCard(comLoc[j-2],deck[k].picture);
//                c++;
//            }
        }
//        document.write("<br/><br/>");
    }
//    view.displayMessage(this.nPlayers);
    for(var i=0,k=5;i<5;i++,k++){
        
        view.displayCard(comLoc[i],deck[k].picture);
    }
//    document.write("<br/><br/>");
};

Deal.prototype.preflop=function(){
    var num=this.nPlayers;
    var nCard=2;
    var bB=this.bigBlind;
    var deck=this.dCards;
    var loc=this.loc;
//    view.displayCard(loc[0],deck[1].picture);
    for(var i=0;i<nCard;i++){
        for(var j=0;j<num;j++){
            var order=(j+bB)%num;
            this.players[order].myCards[i]=deck[j+i*num];
            
//            view.displayCard(loc[order+j*num],deck[j+i*num].picture);
//            var msg=order+i*num;
//            view.displayMessage("+msg+");
            var location=this.players[order].loc[i];
            var url=deck[j+i*num].picture;
            view.displayCard(location,url);
//            view.displayCard("001",deck[j+i*num].picture);
//            this.players[order].myCards[i].displayCard();
        }
        
    }
//    for(var i=0;i<loc.length;i++){
////        var order=(i+bB)%num;
////        my_order=order;
////        view.displayMessage(my_order);
//        view.displayCard(loc[i],deck[i].picture);
//        
//    }
//    document.write("<br/><br/>");
};

Deal.prototype.deckOfCards=function(){
    var nCards=52;
    var dCards=new Array(nCards);
    var comLoc=this.comLoc;
    for(var i=0;i<dCards.length;i++){
        dCards[i]=new Card(i);
        //dCards[i].toString();
    }
    for(var i=0;i<dCards.length;i++){         
//        dCards[i].displayCard();
//        document.write(dCards[i].picture);
//        view.displayMessage("test");
//        var location=comLoc[i];
//        view.displayCard(comLoc[i],dCards[i].picture);
    }
//    document.write("<br/><br/>");
    this.dCards=dCards;
};

Deal.prototype.setLocations=function(){
    var num=this.nPlayers.value;
    document.getElementById("cardImg").innerHTML = 5 + 6;
    
    var loc=new Array(num);
    if(this.nPlayers==2){
        this.players[0].loc.push("001","002");
        this.players[1].loc.push("005","006");
    }
    else if(this.nPlayers==3){
        this.players[0].loc.push("001","002");
        this.players[1].setLoc("005","006");
        this.players[2].setLoc("009","010");
    }
//    else if(this.nPlayers===4){
//        this.players[0].loc = ["001","002"];
//        this.players[1].loc = ["005","006"];
//        this.players[2].loc = ["009","010"];
//        this.players[3].loc = ["013","014"];
//    }
//    else if(this.nPlayers===5){
//        this.players[0].loc = ["001","002"];
//        this.players[1].loc = ["005","006"];
//        this.players[2].loc = ["009","010"];
//        this.players[3].loc = ["013","014"];
//        this.players[4].loc = ["213","214"];
//    }
//    else if(this.nPlayers===6){
//        this.players[0].loc = ["001","002"];
//        this.players[1].loc = ["005","006"];
//        this.players[2].loc = ["009","010"];
//        this.players[3].loc = ["013","014"];
//        this.players[4].loc = ["213","214"];
//        this.players[5].loc = ["209","210"];
//    }
//    else if(this.nPlayers===7){
//        this.players[0].loc = ["001","002"];
//        this.players[1].loc = ["005","006"];
//        this.players[2].loc = ["009","010"];
//        this.players[3].loc = ["013","014"];
//        this.players[4].loc = ["213","214"];
//        this.players[5].loc = ["209","210"];
//        this.players[6].loc = ["205","206"];
//    }
//     else if(this.nPlayers===8){
//        this.players[0].loc = ["001","002"];
//        this.players[1].loc = ["005","006"];
//        this.players[2].loc = ["009","010"];
//        this.players[3].loc = ["013","014"];
//        this.players[4].loc = ["213","214"];
//        this.players[5].loc = ["209","210"];
//        this.players[6].loc = ["205","206"];
//        this.players[7].loc = ["201","202"];
//    }
//    
    else {view.displayMessage("wrong number!!!");}
};

Deal.prototype.setComLoc=function(){
    var comLoc=["107","108","109","110","111"];
    //view.displayMessage(comLoc[0]);
    this.comLoc=comLoc;
};