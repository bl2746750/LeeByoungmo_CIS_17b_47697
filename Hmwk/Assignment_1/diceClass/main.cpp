/* 
 * File:   main.cpp
 * Author: Student Byoung Mo Lee
 * Created on September 19, 2019, 10:04 PM
 * Purpose: Create Dice Class with C++ and 
 *          Convert to JavaScript and PHP
 */

#include <cstdlib>
#include <iostream>
#include "Dice.h"

using namespace std;

/*
 * 
 */
int main(int argc, char** argv) {
    int num=6;
    Dice** d1=new Dice* [num];
              
    for(int i=0;i<num;i++){
        d1[i]=new Dice(i);
        cout << d1[i]->toString() << endl;    
    }
 
    //Clean up memory allocation
    for(int i=0;i<num;i++){
        delete d1[i];
    }
    delete []d1;

    return 0;
}

