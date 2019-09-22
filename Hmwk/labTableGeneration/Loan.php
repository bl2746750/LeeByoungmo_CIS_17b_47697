<!DOCTYPE html>
<!--
    Student Byoung Mo Lee
    September 21st, 2019
    Include a function library with arrays utilization
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Utilize the Loan PHP Functions</title>
            <?php   include './PHPLoanFunctions.php';   ?>
    </head>
    <body>
        <?php
            //Declare variables
            $L=10000;   //Loan Amount $'s
            $i=0.06; //Interest Rate % per year
            $n=36;//Number of compounding periods months

            //Use the function to calculate the value
            $mp= loan($L,$i,$n);//Monthly Payment Calculation
            $lr= loanRemaining($L,$i,$n);//Loan Remaining Array Calculation
            

            //Display results
            echo "<p> Loan Amount = $".$L."</p>";
            echo "<p> Interest Rate =  ".($i*100)."%</p>";
            echo "<p> Number of Months =  ".$n."(Month)</p>";
            echo "<p> Monthly Payment = $".number_format($mp,2)."</p>";
            display($lr);
        ?>
    </body>
</html>