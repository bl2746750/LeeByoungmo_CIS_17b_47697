<?php

function update_balance_for_user($user_id,$amount){
    require 'loginMysql_1.php';
    $stmt=mysqli_prepare($link,"UPDATE entity_users SET balance=balance-$amount,in_pot_balance=in_pot_balance+$amount WHERE user_id=$user_id");
    mysqli_stmt_execute($stmt);
    echo mysqli_error($link);
} 

function update_balance_for_pot($game_id,$amount){
    require 'loginMysql_1.php';
    $stmt=mysqli_prepare($link,"UPDATE entity_game SET pot_balance=pot_balance+$amount WHERE game_id=$game_id");
    mysqli_stmt_execute($stmt);
    echo mysqli_error($link);
}  