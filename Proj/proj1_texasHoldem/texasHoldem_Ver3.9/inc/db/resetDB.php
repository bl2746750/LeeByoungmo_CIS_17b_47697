<?php

reset_to_before_start_game();

function reset_to_before_start_game(){
    //$user_status=1, game_status=1 from 2
    require 'loginMysql_1.php';
    $stmt=mysqli_prepare($link,"UPDATE entity_game SET status=1 WHERE status=2");
    mysqli_stmt_execute($stmt);
    
    $stmt=mysqli_prepare($link,"UPDATE entity_users SET status=1 WHERE status=2");
    mysqli_stmt_execute($stmt);
}