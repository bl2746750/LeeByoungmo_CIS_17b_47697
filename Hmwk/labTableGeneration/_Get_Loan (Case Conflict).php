<!DOCTYPE html>
<!--
    Student Byoung Mo Lee
    September 21th, 2019
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
            $L=$_GET['Loan_Amount'];   //Loan Amount $'s
            $i=$_GET['Interest_Rate']/100; //Interest Rate %
            $n=$_GET['Periods'];//Number of compounding periods month

            //Use the function to calculate the value
            $mp= loan($L,$i,$n);//Monthly Payment Calculation
            $lr= loanRemaining($L, $i, $n);//Loan Remaining

            //Display results
            echo "<p> Loan Amount = $".$L."</p>";
            echo "<p> Interest Rate =  ".($i*100)."%</p>";
            echo "<p> Number of Months =  ".$n."(months)</p>";
            echo "<p> Monthly Payment = $".number_format($mp,2)."</p>";
            display($lr);
        ?>
    </body>
</html>