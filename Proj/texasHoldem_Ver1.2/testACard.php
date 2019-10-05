<!DOCTYPE html>
<!--
/* 
 * File:   testACard.php
 * Author: Student Byoung Mo Lee
 * Created on September 23, 2019 23:09 PM
 * Purpose:  Texas Holdem
 */
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Play and Display a Card Deck</title>
        <?php   include './Hands.php';   ?>
    </head>
    <body>
        <?php
            //Test the Cards by creating a deck then printing the result
            $game=new Deal(5);
            $result=new Hands($game);
            
            
        ?>
    </body>
</html>
