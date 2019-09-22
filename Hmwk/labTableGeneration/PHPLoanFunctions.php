<?php
/*    
    Student Byoung Mo Lee
    September 21th, 2019
    Loan function implemented 
 
 */


//Loan with a power function
function loan($L,$i,$n){
    $mp=($i/12*pow(1+$i/12,$n)*$L)/(pow(1+$i/12,$n)-1);
    return $mp;
}

//LoanRemaining with an array
function loanRemaining($L,$i,$n){
    //Declare an array
    $mp=loan($L,$i,$n);
    $lr=array();
    //Fill the array
    
    $lr[0][0]=$L;
    $lr[0][1]=0;
    for($month=1;$month<=$n;$month++){
        $lr[$month][0]=$lr[$month-1][0]*(1+$i/12)-$mp;
        $lr[$month][1]=$lr[$month-1][0]*$i/12;
    }
    return $lr;
}


//Display the Loan array
function display($lr){
    echo '<table width="200" border="1">';
    echo "<tr><th>Month</th><th>Loan Remaining</th><th>Interest Paid</th></tr>";
    for($month=1;$month<count($lr);$month++){
        echo "<tr>";
        echo "<td>".$month."</td>";
        echo "<td>".number_format($lr[$month][0],2)."</td>";
        echo "<td>".number_format($lr[$month][1],2)."</td>";
        echo "</tr>";
    }
    echo "</table>";
}