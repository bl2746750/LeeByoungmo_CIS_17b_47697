/* 
 * File:   Hands.h
 * Author: Byoung Mo Lee
 * Created on May 18, 2019 20:43 PM
 * Purpose: Player Class for Texas Holdem
 * 
 */

/* 
 * File:   Hands.h
 * Author: pete
 *
 * Created on May 18, 2019, 8:42 PM
 */

#ifndef HANDS_H
#define HANDS_H

#include "Card.h"

class Hands : public Card{
public:
    Hands();
    Hands(const Hands& orig);
    virtual ~Hands();
    void getInformation(Card* cards);
    //void displayInformation();
private:
    Card* cards;
    int hands;
    
    
};    

#endif /* HANDS_H */

// hands=0: Highcard
// hands=1: One Pair
// hands=2: Two Pair
// hands=3: Three of a card
// hands=4: Straight
// hands=5: Flush
// hands=6: Full house
// hands=7: Four of a card
// hands=8: Straight Flush
