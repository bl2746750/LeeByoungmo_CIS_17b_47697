<!DOCTYPE html>
<!--
/* 
 * File:   testACard.php
 * Author: Student Byoung Mo Lee
 * Created on September 23, 2019 23:09 PM
 * Purpose:  Texas Holdem
 */
-->
<!--<html>
    <head>
        <meta charset="UTF-8">
        <title>Play and Display a Card Deck</title>
        
    </head>
    <body>
        
    </body>
</html>-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Texa Holdem</title>
        <link rel='stylesheet' type='text/css' href='BoardSheet.css' />
        
       
        
    </head>
    
    <body>
       
        <div id="board">
            <div id="messageArea"></div>
            
            <h1> How Many Players? 
                <form action="_GET_input.php" method="get">
                <input type="text" name="input" placeholder="3">
                <input type="button" name="inputButton"  value="input">
            </form>
           </h1>
        </div>
    </body>
</html>