<?php


 function get_available_game_id(){
    $game_id= check_available_game_id();
    //echo "game_id=".$game_id."<br />";
    if($game_id<0){
        $game_id=create_game();
    }
    update_avail_game_to_playing($game_id);
    return $game_id;
}

 function check_available_game_id(){
    require 'loginMysql_1.php';
    $query="SELECT game_id FROM entity_game WHERE status=1";
    $result=mysqli_query($link,$query);
    $rows=mysqli_num_rows($result);
    if($rows == 0) {return -1;}
    else {
        $row=mysqli_fetch_array($result,MYSQLI_ASSOC);
        return $row['game_id'];    
    }
}

function get_playing_game_id(){
    require 'loginMysql_1.php';
    $query="SELECT game_id FROM entity_game WHERE status=2";
    $result=mysqli_query($link,$query);
    $rows=mysqli_num_rows($result);
    if($rows == 0) {return -1;}
    else {
        $row=mysqli_fetch_array($result,MYSQLI_ASSOC);
        return $row['game_id'];    
    }
}

 function create_game(){
    require 'loginMysql_1.php';

    $query="INSERT INTO entity_game VALUES (NULL,0,NULL,1)";
    $result=$link->query($query);
    $game_id= $link->insert_id;
    if(!$result) echo "CREATE GAME failed!";
    return $game_id;
}  

 function update_avail_game_to_playing($game_id){
    require 'loginMysql_1.php';
    $stmt=mysqli_prepare($link,"UPDATE entity_game SET status=2 WHERE game_id=$game_id");
    mysqli_stmt_execute($stmt);
    echo mysqli_error($link);
}    
