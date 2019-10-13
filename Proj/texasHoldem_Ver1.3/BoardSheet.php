<?php
    header("Content-type: text/css; charset: UTF-8");
?>

<!--/* 
    Created on : Oct 10, 2019, 10:56:53 AM
    Author     : byoung
*/-->


body {
    background-color: darkgreen;
}
<!--div#board {
    position: relative;
    width: 1024px;
    height: 863px;
    margin: auto;
    background: url("board.jpg") no-repeat;
}-->

div#messageArea {
    position: absolute;
    bottom: 0px;
    right: 0px;
    color: rgb(83, 175, 19);
}
.card {
    background: url("<?php$cardImg?>") no-repeat center center;
}

table {
    border-spacing: 0px; 
    /* could use border-collapse instead */
    /* border-collapse: collapse; */
    position: absolute;
    width:100%;
    
    left: 50px;
    right: 50px;
    top: 50px;
    bottom: 450px;
    
    
}
td {
    width: 250px;
    height: 100px;
    border:1px solid black;
}
form {
    position: absolute;
    bottom: 420px;
    right: 0px;
    padding: 15px;
    background-color: rgb(83, 175, 19);
}
form input {
    background-color: rgb(152, 207, 113);
    border-color: rgb(83, 175, 19);
    font-size: 1em;
}