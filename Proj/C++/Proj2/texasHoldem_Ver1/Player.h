/* 
 * File:   Player.h
 * Author: Byoung Mo Lee
 * Created on May 17, 2019 10:16 AM
 * Purpose: Player Class for Texas Holdem
 * 
 */

#ifndef PLAYER_H
#define PLAYER_H

#include <string>
#include "Card.h"
using namespace std;

class Player{
protected:
    string name;
    int balance;
    int order;      //if(order==0) Big blind, if(order==1) small blind
    Card* myCards;
public:
    Player() {setPlayer("",10000,0);myCards=new Card[7];}
    ~Player() {}
    void setPlayer(string n,int b, int o) {name=n;balance=b,order=o;}
    void setMyCard(Card* mC) {myCards=new Card[7];myCards=mC;}
    void setName(string n) {name=n;}
    void setBalance(int b) {balance=b;}
    void setOrder(int o) {order=o;}
    string getName() const {return name;}
    int getBalance() const {return balance;}
    int getOrder() const {return order;}
    Card* getMycards() const {return myCards;}
    void putMoneyToPot(int m) {balance-=m;}
    void takeMoneyFromPot(int m) {balance+=m;}
    void addCards(Card *c, int n){ //mC=players.myCards, c=decked Cards, n=number of addition
        int pos=0;
        bool found=0;
        while(!found){
            if(myCards[pos].getFace()==-1){
                
                found=1;
            }
            else{
                pos++;
            }
        }
        //cout << myCards[pos].getFace() << endl; // for test
        //cout << pos << endl;                    // for test
        for(int i=0;i<n;i++){
            myCards[pos+i].setACard(c[i]);
            //c->displayCard();  //test for addCard function
        }
    }
};

#endif /* PLAYER_H */

