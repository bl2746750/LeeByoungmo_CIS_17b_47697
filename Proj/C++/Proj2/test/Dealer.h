/* 
 * File:   Dealer.h
 * Author: Byoung Mo Lee
 * Created on May 17, 2019 09:08 AM
 * Purpose: Texas Holdem
 * 
 */
#ifndef DEALER_H
#define DEALER_H

#include "Card.h"
#include "Player.h"


using namespace std;

class Dealer{  
private:
    int potAmount;
    int initialContributeAmount;
    int round;
    int numPlayers;
    Player* players;
    Card* cards;
    Card* myCards;
    void DeckOfCards();
    
    
public:
    Dealer(){potAmount=0;initialContributeAmount=50;numPlayers=2;
            DeckOfCards();players=new Player [numPlayers];}
    ~Dealer() {}
    Dealer(int n);
    void shuffle();
    void setPlayers(int n);
    void setCards(Card* c) {cards=new Card [52]; cards=c;}
    void setMyCards(Card* mc) {myCards=mc;}
    void setRound(int r) {round=r;}
    void initiateRound();
    void decideWinner();
    void completeRound();
    void dealPreflop();
    void dealFlop();
    void dealTurn();
    void dealRiver();
    int getPotAmount() const {return potAmount;}
    int getInitContAmount() const {return initialContributeAmount;}
    int getRound() const {return round;}
    Player* getPlayers() const {return players;}
    Card* getCards() const {return cards;}
    int getNumPlayers() const {return numPlayers;}
    void displayCards(Card* cards);
    void selectionSort(int*,int, int);
    void display();
    
};

//int Dealer::round=0;

#endif /* DEALER_H */

