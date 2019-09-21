/* 
 * File:   Hands.cpp
 * Author: Byoung Mo Lee
 * Created on May 18, 2019 20:43 PM
 * Purpose: Hands Class for Texas Holdem
 * 
 */
#include <iostream>
#include <cmath>
#include "Hands.h"
#include "Templates.h"
using namespace std;

Hands::Hands(Card* mc){
    set(mc);
}

Hands::Hands(const Hands& orig){
    
}

int Hands::checkStraight(const int* const* f,int row){
    int isStraight=0;
    int diffOne=0;
    bool isThereAce=0;
    int scan=0;
    int stop=0;
    
    
    for(int i=0;i<row;i++){
        if(f[i][0]==14) isThereAce=1;
    }
    
    while(scan<row-1 && !stop){
        if(f[scan][0]-f[scan+1][0]==1) {
            diffOne++;
            if(diffOne>=4 && isThereAce && f[scan+1][0]==2) {
                isStraight=1;               //when A, 2, 3, 4, 5
            }
            else if(diffOne>=5) {                           //when there is no Ace
                isStraight=f[scan+1][0]+diffOne-1;          //return the highest value      
            }
        }
        else{
            diffOne=0;
            if(isStraight) stop=1;
        }
        scan++;
    }
    
    return isStraight;
}

void Hands::set(Card* cards){
    int** faceSum;
    int faceRow;
    int endPos=0;
    bool found=0;
    int faceStat[14]={0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    int moreThanFiveCards=0;
    
    while(!found && endPos<7){
        if(cards[endPos].getFace()==-1) found=1;
        else endPos++;
    }
    
    if(endPos>2) moreThanFiveCards=1;
    
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
    
    faceRow=0;  //how many values are not zero
    for(int i=0;i<14;i++){
        if(faceStat[i]) faceRow++;
    }
    
    faceSum=new int* [faceRow];
    
    for (int i=0; i < faceRow; i++) faceSum[i] = new int[2]; //2D table
    
    faceRow=0;
    for(int i=0;i<14;i++){
        if(faceStat[i]) {
            faceSum[faceRow][0]=i+1;
            faceSum[faceRow][1]=faceStat[i];
            faceRow++;
        }
    }
    //cout << "faceSum[0][2]=" << faceSum[0][2] << endl;
    selectionSortVar(faceSum,0,faceRow);
    selectionSort(faceSum,1,0,faceRow);
    
    int** suitSum;
    int suitRow;
    endPos=0;
    found=0;
    int suitStat[4]={0,0,0,0};
    int Flush=0;
    
    while(!found && endPos<7){
        if(cards[endPos].getFace()==-1) found=1;
        else endPos++;
    }
    
    for(int i=0;i<endPos;i++){                  //suit analysis
        if(cards[i].getSuit()==0) ++suitStat[0];
        else if(cards[i].getSuit()==1) ++suitStat[1];
        else if(cards[i].getSuit()==2) ++suitStat[2];
        else if(cards[i].getSuit()==3) ++suitStat[3];
    }
    
    suitRow=0; 
    for(int i=0;i<4;i++){
        if(suitStat[i]) suitRow++;
        //cout << suitStat[i] << " ";
    }
    
    suitSum=new int* [suitRow];
    
    for (int i=0; i < suitRow; i++) suitSum[i] = new int[2];
    
    suitRow=0;
    for(int i=0;i<4;i++){
        if(suitStat[i]) {
            suitSum[suitRow][0]=i;
            suitSum[suitRow][1]=suitStat[i];
            suitRow++;
        }
    }
    
    selectionSortVar(suitSum,0,suitRow);
    selectionSort(suitSum,1,0,suitRow);
    
    if(suitSum[0][1]>=5) Flush=1;               //isFlush? yes=1, no=0

    
    Card* fiveCards=new Card[5];
    int hands=0;
    int index=0;
    int scan=0;
    found=0;
    int isStraight=0;
        
    if(!moreThanFiveCards){
        if(faceSum[0][1]==2){
            hands=1;
        }
        
        else if(faceSum[0][1]==1){
            hands=0;
        }
    }
    
    else {
        Flush=isFlush(cards);
        isStraight=checkStraight(faceSum,faceRow);
    

        if(Flush && isStraight) {
            int size=suitRow;
            int suit=suitSum[0][0];
            int scan=0;
            int index=0;
            int numACard=0;
            Card* flushCards=new Card [size];
            while(scan<7 && index<size){
                if(cards[scan].getSuit()==suit){
                    flushCards[index].setACard(cards[scan]);
                    index++;
                }
                scan++;
            }
            checkFaceHands(flushCards,numACard);
            isStraight=checkStraight(faceSum,faceRow);
            if(isStraight) {
                hands=8;

                if(isStraight==1) {             //A, 2,3,4,5

                    index=0;
                    found=0;
                    scan=0;
                    while(scan<faceRow && !found){
                        if(flushCards[scan].getFace()==14){
                            found=1;
                            fiveCards[index].setACard(flushCards[scan]);
                            index++;
                        }
                        scan++;
                    }

                    for(int i=0;i<4;i++){
                        found=0;
                        scan=0;
                        while(scan<faceRow && !found){
                            if(flushCards[scan].getFace()==2+i){
                                found=1;
                                fiveCards[index].setACard(flushCards[scan]);
                                index++;
                            }
                            scan++;
                        }

                    }
                }

                else if(isStraight>1){         //no ace in the straight

                    index=0;

                    for(int i=0;i<5;i++){
                        scan=0;
                        found=0;
                        while(scan<faceRow && !found){
                            if(flushCards[scan].getFace()==isStraight-index){
                                found=1;
                                fiveCards[index].setACard(flushCards[scan]);
                                index++;
                            }
                            scan++;
                        }
                    }
                }

            }

        }

        else{
            if(faceSum[0][1]==4){
                hands=7;
                index=0;
                scan=0;
                while(index<faceSum[0][1] && scan<7) {
                    if(cards[scan].getFace()==faceSum[0][0]){
                        fiveCards[index].setACard(cards[scan]);
                        index++;

                    }
                    scan++;
                }
                selectionSort(faceSum,0,1,faceRow-1);
                scan=0;
                while(index<5 && scan<7){
                    if(cards[scan].getFace()==faceSum[1][0]){
                        fiveCards[index].setACard(cards[scan]);
                        index++;

                    }
                    scan++;
                }
            }

            else if(faceSum[0][1]==3 && faceSum[1][1]>=2){
                hands=6;
                index=0;
                scan=0;

                while(index<faceSum[0][1] && scan<7) {
                    if(cards[scan].getFace()==faceSum[0][0]){
                        fiveCards[index].setACard(cards[scan]);
                        index++;
                    }
                    scan++;
                }
                scan=0;
                while(index<5 && scan<7){
                    if(cards[scan].getFace()==faceSum[1][0]){
                    fiveCards[index].setACard(cards[scan]);
                    index++;
                    }
                    scan++;
                }
            }

            else if(Flush){
                hands=5;
                scan=0;
                index=0;

                while(scan<7 && index<5){
                    if(cards[scan].getSuit()==suitSum[0][0]){
                        fiveCards[index].setACard(cards[scan]);
                        index++;
                    }
                    scan++;
                }

                selectionSortByFace(fiveCards,0,5);

            }

            else if(isStraight){
                hands=4;

                if(isStraight==1) {             //A, 2,3,4,5
                    index=0;
                    found=0;
                    scan=0;
                    while(scan<faceRow && !found){
                        if(cards[scan].getFace()==14){
                            found=1;
                            fiveCards[index].setACard(cards[scan]);
                            index++;
                        }
                        scan++;
                    }

                    for(int i=0;i<4;i++){
                        found=0;
                        scan=0;
                        while(scan<faceRow && !found){
                            if(cards[scan].getFace()==2+i){
                                found=1;
                                fiveCards[index].setACard(cards[scan]);
                                index++;
                            }
                            scan++;
                        }

                    }
                }
                else if(isStraight>1){         //no ace in the straight

                    index=0;

                    for(int i=0;i<5;i++){
                        scan=0;
                        found=0;
                        while(scan<faceRow && !found){
                            if(cards[scan].getFace()==isStraight-index){
                                found=1;
                                fiveCards[index].setACard(cards[scan]);
                                index++;
                            }
                            scan++;
                        }
                    }
                }
            }

            else if(faceSum[0][1]==3 && faceSum[1][1]==1){
                hands=3;
                index=0;
                scan=0;
                while(index<faceSum[0][1] && scan<7) {
                    if(cards[scan].getFace()==faceSum[0][0]){
                        fiveCards[index].setACard(cards[scan]);
                        index++;

                    }
                    scan++;
                }
                selectionSort(faceSum,0,1,faceRow-1);

                for(int i=3;i<5;i++){
                    scan=0;
                    while(index<i+1 && scan<7){
                        if(cards[scan].getFace()==faceSum[i-2][0]){
                        fiveCards[index].setACard(cards[scan]);
                        index++;
                        }
                        scan++;
                    }
                }
            }

            else if(faceSum[0][1]==2){
                if(faceSum[1][1]==2){
                    hands=2;
                    index=0;
                    scan=0;

                    while(index<faceSum[0][1] && scan<7) {
                        if(cards[scan].getFace()==faceSum[0][0]){
                            fiveCards[index].setACard(cards[scan]);
                            index++;
                        }
                        scan++;
                    }

                    scan=0;

                    while(index<4 && scan<7){
                        if(cards[scan].getFace()==faceSum[1][0]){
                        fiveCards[index].setACard(cards[scan]);
                        index++;
                        }
                        scan++;
                    }

                    selectionSort(faceSum,0,2,faceRow-2);
                    scan=0;
                    while(index<5 && scan<7){
                        if(cards[scan].getFace()==faceSum[2][0]){
                        fiveCards[index].setACard(cards[scan]);
                        index++;
                        }
                        scan++;
                    }
                }

                else if(faceSum[1][1]==1){
                    hands=1;
                    index=0;
                    scan=0;

                    while(index<faceSum[0][1] && scan<7) {
                        if(cards[scan].getFace()==faceSum[0][0]){
                            fiveCards[index].setACard(cards[scan]);
                            index++;

                        }
                        scan++;
                    }
                    selectionSort(faceSum,0,1,faceRow-1);
                    for(int i=2;i<5;i++){
                        scan=0;
                        while(index<i+1 && scan<7) {
                            if(cards[scan].getFace()==faceSum[i-1][0]){
                                fiveCards[index].setACard(cards[scan]);
                                index++;
                            }
                            scan++;
                        }
                    }
                }
            }

            else if(faceSum[0][1]==1){
                hands=0;
                index=0;
                for(int i=0;i<5;i++){
                    scan=0;
                    while(index<i+1 && scan<7) {
                        if(cards[scan].getFace()==faceSum[i][0]){
                            fiveCards[index].setACard(cards[scan]);
                            index++;

                        }
                        scan++;
                    }
                }
            }
        }
    }
    
    int points=0;
    points+=hands*10000000;
    for(int i=0;i<5;i++){
            points+=(fiveCards[i].getFace())*pow(15,4-i);
    }
}
