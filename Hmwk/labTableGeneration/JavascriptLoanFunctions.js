/*    
    Student Byoung Mo Lee
    September 21th, 2019
    Loan function implemented 
 */


//Loan with a power function
function loan(L,i,n){
    var mp=(i/12*Math.pow((1+i/12),n)*L)/(Math.pow((1+i/12),n)-1);
    return mp;
}


//LoanRemaining with an array
function loanRemaining(L,i,n){
    //Declare an array
    var mp=loan(L,i,n);
    var lr=[];
    //Calculate all the values in the array
    lr.push([L,0]);
    for(var month=1;month<=n;month++){
        lr.push([lr[month-1][0]*(1+i/12)-mp,lr[month-1][0]*i/12]);
    }
    return lr;
}

//Display the savings array
function display(lr){
    //Output the heading for our table
    document.write('<table width="200" border="1">');
    document.write("<tr><th>month</th><th>Loan Remaining</th><th>Interest Paid</th></tr>");
    for(var month=1;month<lr.length;month++){
        document.write("<tr>");
        document.write("<td>"+month+"</td>");
        var x=1*lr[month][0];
        var y=1*lr[month][1];
        document.write("<td>$"+x.toFixed(2)+"</td>");
        document.write("<td>$"+y.toFixed(2)+"</td>");
        document.write("</tr>");
    }
    document.write("</table>");	
}