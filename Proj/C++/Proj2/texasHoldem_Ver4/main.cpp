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

using namespace std;

//User Libraries Here
//Global Constants Only, No Global Variables
//Like PI, e, Gravity, or conversions
//Structure



//Function Prototypes Here
//Execution begins here

void displayGame(Dealer);

int main(int argc, char** argv) {
    int n=5;
    int exit=1;
    Dealer a(n);
    while(exit){
        displayGame(a);
        cout << "for exit, press 0" << endl;
        cin >> exit;
    }
    return 0;
}
void displayGame(Dealer d){
    
    d.initiateRound();
    cout << "round: " << d.getRound() << endl;
    for(int i=0;i<d.getNumPlayers();i++){
        cout << "Player " << i+1 << " :  $ " << d.getPlayers()[i].getBalance() << " "
          <<  d.getPlayers()[i].getOrder() << endl;
    }
    cout << "Pot      :  $ " << d.getPotAmount() << endl;

    d.shuffle();
    d.dealPreflop();
    for(int i=0;i<d.getNumPlayers();i++){
        //cout << d.getPlayers()[i].getNumCards() << " "; 
        cout << d.getPlayers()[i].getHands(d.getPlayers()[i].getMycards(),d.getPlayers()[i].getNumCards()) << "    ";
    }
    d.dealFlop();
    cout << endl;
    for(int i=0;i<d.getNumPlayers();i++){
        //cout << d.getPlayers()[i].getNumCards() << " "; 
        cout << d.getPlayers()[i].getHands(d.getPlayers()[i].getMycards(),d.getPlayers()[i].getNumCards()) << "    ";
    }
    d.dealTurn();
    d.dealRiver();
    
    cout << endl;
    for(int i=0;i<d.getNumPlayers();i++){
        
        cout << d.getPlayers()[i].getHands(d.getPlayers()[i].getMycards(),d.getPlayers()[i].getNumCards()) << "    ";
    }
    cout << endl;
    for(int i=0;i<d.getNumPlayers();i++){
        d.getPlayers()[i].displayFiveCards(d.getPlayers()[i].getMycards(),d.getPlayers()[i].getNumCards());
        cout << "       " ;
    }
    d.decideWinner();
    d.completeRound();
    
    cout << endl;
    cout << d.getRound() << endl;
    
}