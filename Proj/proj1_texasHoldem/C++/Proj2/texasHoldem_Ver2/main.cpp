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



int main(int argc, char** argv) {
    int n=3;
    Dealer a(3);
    a.shuffle();
    //cout << "1111" << endl;
    //cout << a.getNumPlayers() << endl;
    a.dealPreflop();
    //cout << "3333" << endl;
    a.dealFlop();
    a.dealTurn();
    a.dealRiver();
    Hands b;
    for(int i=0;i<n;i++){
        b.getInformation(a.getPlayers()[i].getMycards());
    }
    return 0;
}
