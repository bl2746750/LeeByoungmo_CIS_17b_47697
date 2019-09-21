/* 
 * File:   Hands.h
 * Author: Byoung Mo Lee
 * Created on May 18, 2019 20:43 PM
 * Purpose: Player Class for Texas Holdem
 * 
 */
#include <iostream>
#include "Hands.h"
#include "Template.h"

using namespace std;

Hands::Hands() {
}

Hands::Hands(const Hands& orig) {
}

Hands::~Hands() {
}

void Hands::getInformation(Card* cards){
    int endPos=0;
    bool found=0;
    int faceStat[14]={0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    int suitStat[4]={0,0,0,0};
    int** faceSum;
    int** suitSum;
    
    while(!found && endPos<7){
        if(cards[endPos].getFace()==-1) found=1;
        else endPos++;
    }
    
    for(int i=0;i<endPos;i++){
        if(cards[i].getFace()==1) faceStat[0]++;
        else if(cards[i].getFace()==2) faceStat[1]++;
        else if(cards[i].getFace()==3) faceStat[2]++;
        else if(cards[i].getFace()==4) faceStat[3]++;
        else if(cards[i].getFace()==5) faceStat[4]++;
        else if(cards[i].getFace()==6) faceStat[5]++;
        else if(cards[i].getFace()==7) faceStat[6]++;
        else if(cards[i].getFace()==8) faceStat[7]++;
        else if(cards[i].getFace()==9) faceStat[8]++;
        else if(cards[i].getFace()==10) faceStat[9]++;
        else if(cards[i].getFace()==11) faceStat[10]++;
        else if(cards[i].getFace()==12) faceStat[11]++;
        else if(cards[i].getFace()==13) faceStat[12]++;
        else if(cards[i].getFace()==14) faceStat[13]++;
    }
    
    int count=0;  //how many values are not zero
    for(int i=0;i<14;i++){
        if(faceStat[i]) count++;
    }
    
    faceSum=new int* [count];
    
    for (int i=0; i < count; i++) faceSum[i] = new int[2];
    
    count=0;
    for(int i=0;i<14;i++){
        if(faceStat[i]) {
            faceSum[count][0]=i+1;
            faceSum[count][1]=faceStat[i];
            count++;
        }
    }
    
    selectionSortVar(faceSum,0,count);
    selectionSort(faceSum,1,0,count);
    cout << endl << "count=" << count << endl;
    
    int onePos=0;
    int index=0;
    found=0;
    
    while(!found && index<count){
        if(faceSum[index][1]==1) {
            found=1;
            onePos=index;
        }
        else index++;
    }
    
    //selectionSortVar(faceSum,onePos,count-onePos-1);
    selectionSort(faceSum,0,onePos,count-onePos);
    for(int i=0;i<count;i++){
        for(int j=0;j<2;j++){
            cout << faceSum[i][j] << " ";
        }
        cout << endl;
    }
    cout << endl << "endPos=" << endPos << endl;
    for(int i=0;i<endPos;i++){
        if(cards[i].getSuit()==0) ++suitStat[0];
        else if(cards[i].getSuit()==1) ++suitStat[1];
        else if(cards[i].getSuit()==2) ++suitStat[2];
        else if(cards[i].getSuit()==3) ++suitStat[3];
    }
    
    count=0; 
    for(int i=0;i<4;i++){
        if(suitStat[i]) count++;
        //cout << suitStat[i] << " ";
    }
    
    cout << endl << "*count=" << count;
    suitSum=new int* [count];
    
    for (int i=0; i < count; i++) suitSum[i] = new int[2];
    
    count=0;
    for(int i=0;i<4;i++){
        if(suitStat[i]) {
            suitSum[count][0]=i;
            suitSum[count][1]=suitStat[i];
            count++;
        }
    }
    
    //selectionSortVar(suitSum,0,count);
    selectionSort(suitSum,1,0,count);
    cout << endl << "count=" << count << endl;
    
    for(int i=0;i<count;i++){
        for(int j=0;j<2;j++){
            cout << suitSum[i][j] << " ";
        }
        cout << endl;
    }
}

// hands=0: Highcard
// hands=1: One Pair
// hands=2: Two Pair
// hands=3: Three of a card
// hands=4: Straight
// hands=5: Flush
// hands=6: Full house
// hands=7: Four of a card
// hands=8: Straight Flush
