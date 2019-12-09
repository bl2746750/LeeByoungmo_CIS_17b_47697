<?php

require_once './loginMysql_1.php';

$query="SELECT * FROM entity_users WHERE status=1";
$result=$link->query($query);
if(!$result) {return 0;}
else{
    $rows=$result->num_rows;
    echo $rows;
}


