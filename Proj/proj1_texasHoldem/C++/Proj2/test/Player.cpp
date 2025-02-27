/* 
 * File:   Player.cpp
 * Author: Byoung Mo Lee
 * Created on May 27, 2019 10:12 AM
 * Purpose: Player class for Texas Holdem
 * 
 */

#include "Player.h"
#include "Hands.h"

int Player::getNumCards() const{
    int scan=0;
    bool found=0;
    
    while(!found && scan<7){
        if(myCards[scan].getFace()==-1) found=1;
        else scan++;
    }
    
    return scan;
}

void Player::updateMyHands(Player &obj){
    //delete[] obj.myFiveCards;
    //obj.myFiveCards=new Card [5];
    setHands(obj.myCards);
    //obj.hands=obj.getHands();
    //obj.myFiveCards=obj.getFiveCards();
    //obj.points=obj.getPoints();
}

int Player::getMyHands() const{
    return hands;
}
    
Card* Player::getMyFiveCards() const{
    return myFiveCards;
}

int Player::getMyPoints() const{
    return points;
}
void Player::addCards(Card *c, int n){ //mC=players.myCards, c=decked Cards, n=number of addition
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

void Player::displayMyFiveCards(){
    while(myFiveCards->getFace()!=-1){
        myFiveCards->displayCard();
        myFiveCards++;
    }
}