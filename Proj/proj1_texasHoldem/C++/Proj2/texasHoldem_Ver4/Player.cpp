/* 
 * File:   Player.cpp
 * Author: Byoung Mo Lee
 * Created on May 27, 2019 10:12 AM
 * Purpose: Player class for Texas Holdem
 * 
 */

#include "Player.h"

int Player::getNumCards() const{
    int scan=0;
    bool found=0;
    
    while(!found && scan<7){
        if(myCards[scan].getFace()==-1) found=1;
        else scan++;
    }
    
    return scan;
}

