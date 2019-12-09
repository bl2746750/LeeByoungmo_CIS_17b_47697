<?php

function update_balance_calculate($game_id,$user_id,$amount){
    update_balance_for_user($game_id,$user_id, $amount);
    update_balance_for_pot($game_id, $amount);
}

function update_balance_for_user($game_id,$user_id,$amount){
    require 'loginMysql_1.php';
    $stmt=mysqli_prepare($link,"UPDATE entity_users SET balance=balance-$amount WHERE user_id=$user_id");
    mysqli_stmt_execute($stmt);
    echo mysqli_error($link);
    $stmt=mysqli_prepare($link,"UPDATE xref_play_game SET in_pot_balance=in_pot_balance+$amount WHERE game_id=$game_id and user_id=$user_id");
    mysqli_stmt_execute($stmt);
    echo mysqli_error($link);
} 

function update_balance_for_pot($game_id,$amount){
    require 'loginMysql_1.php';
    $stmt=mysqli_prepare($link,"UPDATE entity_game SET pot_balance=pot_balance+$amount WHERE game_id=$game_id");
    mysqli_stmt_execute($stmt);
    echo mysqli_error($link);
}  

function get_pot_balance($game_id){
    require 'loginMysql_1.php';
    $query="SELECT pot_balance FROM entity_game WHERE game_id=$game_id";
    $result=mysqli_query($link,$query);
    $rows=mysqli_num_rows($result);
    if($rows == 0) {return -1;}
    else {
        $row=mysqli_fetch_array($result,MYSQLI_ASSOC);
        return $row['pot_balance'];    
    }
}