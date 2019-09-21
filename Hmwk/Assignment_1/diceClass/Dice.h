/* 
 * File:   Dice.h
 * Author: Student Byoung Mo Lee
 * Created on September 19, 2019, 10:04 PM
 * Purpose: Create Dice Class with C++ and 
 *          Convert to JavaScript and PHP
 */

#ifndef DICE_H
#define DICE_H


#include <string>
#include <sstream>
using namespace std;

class Dice {
private:
    static const int MAXDICES=6;
    static const int MINDICES=0;
    int num;
    string name;
    string picture;
    
    void setName(){
        switch(this->num%6){
            case 0:  this->name="One";  break;
            case 1:  this->name="Two";break;
            case 2:  this->name="Three"; break;
            case 3:  this->name="Four"; break;
            case 4:  this->name="Five";  break;
            case 5:  this->name="Six";break;
            
            default: this->name="Bad Value";
        }
    }
    void setPict(){
        this->picture="dices/dice" +this->name+".jpg";
    }

public:
    Dice(int n){
        if(n<MAXDICES&&n>=MINDICES){
            this->num=n;
            setName();
            setPict();
        }
        else{
            this->num=-1;
            this->name="none";
            this->picture="none";
        }
    }
    ~Dice(){}
    
    string toString(){
        ostringstream diceNum;
        diceNum  << this->num;
        string str="\n";
        str+=("<img src="+this->picture+" />");
        str+=("\nNumber = "+diceNum.str());
        str+=("\nName = "+this->name);
        str+=("\n \n");
        return str;
    }
    
    int getNum() {return num;}
    string getName(){return name;}
    string getPicture(){return picture;}
};

#endif /* DICE_H */

