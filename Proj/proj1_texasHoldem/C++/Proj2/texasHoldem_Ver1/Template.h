/* 
 * File:   Templates.h
 * Author: Byoung Mo Lee
 * Created on May 17, 2019 09:50 AM
 * Purpose: Templates
 * 
 */

#ifndef TEMPLATES_H
#define TEMPLATES_H
using namespace std;


template <class T>

void swapVars(T &var1, T &var2){
    T temp;
    
    temp=var1;
    var1=var2;
    var2=temp;
}

 
#endif /* TEMPLATES_H */

