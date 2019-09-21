<!DOCTYPE html>
<!--
/* 
* File:   TestADice.php
 * Author: Student Byoung Mo Lee
 * Created on September 20, 2019, 21:31 PM
 * Purpose: Create Dice Class with C++ and 
 *          Convert to JavaScript and PHP
 */
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Play and Display Dice</title>
        <?php   include './Dice.php';   ?>
    </head>
    <body>
        <?php
            //Test the Cards by creating a deck then printing the result
            $nNum=6;
            $d1=array();
            for($i=0;$i<$nNum;$i++){
                $d1[$i]=new Dice($i);
                $d1[$i]->toString();
                
            }
        ?>
    </body>
</html>
