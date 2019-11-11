/* 
 * File:   Player.h
 * Author: Byoung Mo Lee
 * Created on May 17, 2019 10:16 AM
 * Purpose: Player Class for Texas Holdem
 * 
 */

#ifndef PLAYER_H
#define PLAYER_H

#include <iostream>
#include <string>
#include "Card.h"
#include "Hands.h"

using namespace std;

class Player  {
private:
    string playerName;
    int balance;
    int order;      //if(order==0) Big blind, if(order==1) small blind
    int status;
    Card* myCards;
    
public:
    Player() { }
    ~Player() {}
    
    void setPlayer(string n,int b, int o, int s) {playerName=n;balance=b;order=o;status=s;}
    void setMyCard(Card* mC) {myCards=new Card[7];myCards=mC;}
    void setName(string n) {playerName=n;}
    void setBalance(int b) {balance=b;}
    void setOrder(int o) {order=o;}
    void setStatus(int s) {status=s;}
    string getName() const {return playerName;}
    int getBalance() const {return balance;}
    int getNumCards() const;
    int getOrder() const {return order;}
    Card* getMycards() const {return myCards;}
    int getStatus() const {return status;}
    void putMoneyToPot(int m) {balance-=m;}
    void takeMoneyFromPot(int m) {balance+=m;}
    void addCards(Card *c, int n); //mC=players.myCards, c=decked Cards, n=number of addition
    void print() const;
};

#endif /* PLAYER_H */

