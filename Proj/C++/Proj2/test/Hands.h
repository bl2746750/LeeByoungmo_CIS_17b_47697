/* 
 * File:   Hands.h
 * Author: Byoung Mo Lee
 * Created on May 18, 2019 20:43 PM
 * Purpose: Hands Class for Texas Holdem
 * 
 */


#ifndef HANDS_H
#define HANDS_H

#include <iostream>
#include "Card.h"
using namespace std;



class Hands : public Card{
public:
    Hands();
    Hands(const Hands& orig);
    virtual ~Hands() {delete[] fiveCards;delete [] faceSum;delete[] suitSum;}
    void setHands(Card*);
    void setPoints();
    void displayFiveCards();
    Card* getFiveCards() {return fiveCards;}
    int getHands() {return hands;}
    int getPoints();
    //void displayInformation();
private:
    Card* fiveCards;  //select 5 of 7 
    int hands;
    int points;
    int checkStraight(const int* const*, int);
    int isFlush(Card* );
    void checkFaceHands(Card*);
    struct{
        int** faceSum;
        int faceRow;
        int** suitSum;
        int suitRow;
    };
};    

#endif /* HANDS_H */
