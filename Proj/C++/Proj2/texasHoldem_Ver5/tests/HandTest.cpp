/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   HandTest.cpp
 * Author: pete
 *
 * Created on May 29, 2019, 2:41 PM
 */

#include <stdlib.h>
#include <iostream>
#include "Hands.h"

/*
 * Simple C++ Test Suite
 */


void test1() {
   // Card* myCards;
    
    
    
    
    
    std::cout << "HandTest test 1" << std::endl;
}

void test2() {
    std::cout << "HandTest test 2" << std::endl;
    std::cout << "%TEST_FAILED% time=0 testname=test2 (HandTest) message=error message sample" << std::endl;
}

int main(int argc, char** argv) {
    std::cout << "%SUITE_STARTING% HandTest" << std::endl;
    std::cout << "%SUITE_STARTED%" << std::endl;

    std::cout << "%TEST_STARTED% test1 (HandTest)" << std::endl;
    test1();
    std::cout << "%TEST_FINISHED% time=0 test1 (HandTest)" << std::endl;

    std::cout << "%TEST_STARTED% test2 (HandTest)\n" << std::endl;
    test2();
    std::cout << "%TEST_FINISHED% time=0 test2 (HandTest)" << std::endl;

    std::cout << "%SUITE_FINISHED% time=0" << std::endl;

    return (EXIT_SUCCESS);
}

