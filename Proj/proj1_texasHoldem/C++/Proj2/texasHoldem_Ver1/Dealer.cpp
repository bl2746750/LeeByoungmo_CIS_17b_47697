/* 
 * File:   Dealer.cpp
 * Author: Byoung Mo Lee
 * Created on May 17, 2019 00:19 AM
 * Purpose: Texas Holdem
 * 
 */
#include <string>
#include <iostream>
#include <cstdlib>
#include "Dealer.h"
#include "Template.h"

using namespace std;

Dealer::Dealer(int n) {
    dealStage=0;
    potAmount=0;
    initialContributeAmount=50;
    numPlayers=n;
    setPlayers(n);
    DeckOfCards();
}

void Dealer::DeckOfCards() {
    cards=new Card [52];
    for(int j=0;j<4;j++){
        for(int i=0;i<13;i++){
            cards[13*j+i].setCard(i+1,j);
        }
    }
    for(int j=0;j<4;j++){
        for(int i=0;i<13;i++){
            if(cards[13*j+i].getFace()==1) cards[13*j+i].setFace(14);
            //cards[13*j+i].displayCard(); //test for deckOfCards
        }
        //cout << endl;
    }
}



void Dealer::shuffle(){
    // Initialize seed randomly 
    srand(time(0)); 
  
    for (int i=0; i<52 ;i++) 
    { 
        // Random for remaining positions. 
        int r = i + (rand() % (52 -i)); 
  
        swapVars(cards[i], cards[r]);
     }
    
    for(int i=0;i<52;i++){
        cards[i].displayCard();
    } 
    cout << endl;// test for shuffle function
}

void Dealer::setPlayers(int n){
    players=new Player [n];
    numPlayers=n;
    for(int i=0;i<n;i++){
        players[i].setOrder(i);
    }
}

void Dealer::dealPreflop(){
    int count=0;
    int bigBlind;
    bool found=0;
    
    dealStage++;
    
    while(!found && count<7){
        if(players[count].getOrder()==0) {
            //cout << players[count].getOrder() << endl; //test
            found=1;
        }
        else count++;
    }
    
    if(found) bigBlind=count;
    else cout << "Error: no found the player's order=0" << endl;
    
    for(int i=0;i<2*numPlayers;i++){   
        int n=(bigBlind+i)%numPlayers;  //by the order of big blind, we deal the cards
        players[n].addCards(cards+i,1);
    }
    
    for(int i=0;i<numPlayers;i++){
        displayCards(players[i].getMycards(),2);
        cout << "            " ;
    }
    cout << endl << endl;
}
   
    
void Dealer::dealFlop(){
    dealStage++;
    int n=numPlayers*2;
    
    for(int i=0;i<numPlayers;i++){   
        players[i].addCards(cards+n+1,3);  //Since before the flop dealer burn a card 
    }
    cout << "           ";
    displayCards(cards+n+1,3);
}

void Dealer::dealTurn() {
    dealStage++;
    int n=numPlayers*2+4;
    
    for(int i=0;i<numPlayers;i++){   
        players[i].addCards(cards+n+1,1);  //Since before the flop dealer burn a card 
    }
    displayCards(cards+n+1,1);
}
void Dealer::dealRiver() {
    dealStage++;
    int n=numPlayers*2+4+2;
    
    for(int i=0;i<numPlayers;i++){   
        players[i].addCards(cards+n+1,1);  //Since before the flop dealer burn a card 
    }
    displayCards(cards+n+1,1);
}

void Dealer::initiateRound(){
    int bigBlind=initialContributeAmount*2;
    int smallBlind=initialContributeAmount;
    
    if(players->getOrder()==0) {
        players->putMoneyToPot(bigBlind);
        potAmount+=bigBlind;
    }
    
    else if(players->getOrder()==1) {
        players->putMoneyToPot(smallBlind);
        potAmount+=smallBlind;
    }
}//Inheritance, contribute money from big blind and small blind

void Dealer::decideWinner(){
    
}
void Dealer::completeRound(){
    for(int i=0;i<numPlayers;i++){
        int o;
        if(players->getBalance()<numPlayers-1){
            o=players->getOrder();
            players->setOrder(++o);
        }
        else players->setOrder(0);
    }
    round++;
} // rotate order by using Operator Overloading (++ operator go back to zero for the last player

void Dealer::displayCards(Card* cards,int n){
    for(int i=0;i<n;i++){
        cards[i].displayCard();
    }
} 

