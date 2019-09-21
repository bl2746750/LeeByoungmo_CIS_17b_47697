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

class Dealer{   //inheritance: derived from Card class
private:
    int dealStage;
    int potAmount;
    int initialContributeAmount;
    int round=0;
    int numPlayers;
    Player* players;
    Card* cards;
    Card* myCards;
    void DeckOfCards();
    
    
public:
    Dealer(){dealStage=0;potAmount=0;initialContributeAmount=50;numPlayers=2;
            DeckOfCards();players=new Player [numPlayers];}
    ~Dealer() {}
    Dealer(int n);
    void shuffle();
    void setPlayers(int n);
    void setCards(Card* c) {cards=new Card [52]; cards=c;}
    void setMyCards(Card* mc) {myCards=mc;}
    void initiateRound();
    void decideWinner();
    void completeRound();
    void dealPreflop();
    void dealFlop();
    void dealTurn();
    void dealRiver();
    int getDealStage() const {return dealStage;}
    int getPotAmount() const {return potAmount;}
    int getInitContAmount() const {return initialContributeAmount;}
    int getRound() const {return round;}
    Player* getPlayers() const {return players;}
    Card* getCards() const {return cards;}
    int getNumPlayers() const {return numPlayers;}
    void displayCards(Card* cards,int n);
};

//int Deal::round=0;

#endif /* DEALER_H */

