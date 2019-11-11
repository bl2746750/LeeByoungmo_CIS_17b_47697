<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Texa Holdem</title>
        <link rel='stylesheet' type='text/css' href='BoardSheet.css' />
        
        <script src="View.js">          </script>
        

 
 <?php
include ("Hands.php");

           
$nPlayers=$_GET['input'];   
            $game=new Deal($nPlayers);
            $result=new Hands($game);
?>

    </head>
    
    <body>
       

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