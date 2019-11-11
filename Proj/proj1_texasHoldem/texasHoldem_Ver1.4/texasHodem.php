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
        <script src="Model.js">         </script>
        <script src="View.js">          </script>
        <script src="Controller.js">    </script>
        <script src="HandlersInit.js">  </script>
        <?php   include './Hands.php';   ?>
        
    </head>
    
    <body>
       echo($_GET['input']."<br>");           
       $nPlayers=$_GET['input'];   
       $game=new Deal($nPlayers);
       $result=new Hands($game);

        <div id="board">
            <div id="messageArea"></div>
            <table>
                <tr>
                    <td id="00"></td> <td id="01"></td> 
                    <td id="02"></td> <td id="03"></td>
                    
                </tr>
                <tr>
                    <td id="10"></td> <td id="11"></td> 
                    <td id="12"></td> <td id="13"></td>
                    
                </tr>
                <tr>
                    <td id="20"></td> <td id="21"></td> 
                    <td id="22"></td> <td id="23"></td>
                   
                </tr>
                
            </table>
            <form action="_GET_nPlayer.php" method="get">
                <input type="text" id="input" placeholder="3">
                <input type="button" id="inputButton"  value="input">
            </form>
        </div>
    </body>
</html>