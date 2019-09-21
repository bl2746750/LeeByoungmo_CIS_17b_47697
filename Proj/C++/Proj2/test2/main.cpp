/* 
 * File:   main.cpp
 * Author: Byoung Mo Lee
 * Created on May 17, 2019 00:29 AM
 * Purpose: Texas Holdem
 * 
 */

//System Libraries Here
#include <iostream>//I/O Library
#include <cstdlib>   //Srand
#include <ctime>     //Time to set random number seed
#include <cmath>     //Math Library
#include <fstream> //file I/O Library 
#include <cctype>  //ch+10
#include <string>  //string library
#include <clocale> //print card library
#include "Dealer.h"
#include "Hands.h"

using namespace std;

//User Libraries Here
//Global Constants Only, No Global Variables
//Like PI, e, Gravity, or conversions
//Structure



//Function Prototypes Here
//Execution begins here

void displayGame(Dealer ,Hands );

int main(int argc, char** argv) {
    int n=3;
    Dealer a(3);
    Hands b;
    displayGame(a,b);
    return 0;
}
void displayGame(Dealer d,Hands h){
    
    for(int i=0;i<d.getNumPlayers();i++){
        cout << "Player " << i+1 << " :  $ " << d.getPlayers()[i].getBalance() << endl;
    }
    cout << "Pot      :  $ " << d.getPotAmount() << endl;
    
    d.shuffle();
    d.dealPreflop();
    d.dealFlop();
    d.dealTurn();
    d.dealRiver();
    
    cout << endl;
    for(int i=0;i<d.getNumPlayers();i++){
        cout << h.getHands(d.getPlayers()[i].getMycards(),d.getPlayers()[i].getNumCards()) << "    ";
    }
    cout << endl;
    for(int i=0;i<d.getNumPlayers();i++){
        h.displayFiveCards(d.getPlayers()[i].getMycards(),d.getPlayers()[i].getNumCards());
        cout << "       " ;
    }
}