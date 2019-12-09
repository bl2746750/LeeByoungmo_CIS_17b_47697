<?php



function user_board_tag($p_id){
    require 'loginMysql_1.php';
    require 'query_game.php';
    $game_id= get_playing_game_id();
    $query="SELECT * FROM xref_play_game WHERE game_id=$game_id and p_id=$p_id";
    $result= mysqli_query($link, $query);
    $row=mysqli_fetch_array($result,MYSQLI_ASSOC);
    $output='
        <span class="label label-success">'.$row['user_name'].'</span>
        <p class="card-text">'."$ ".$row['balance'].'</p>
    ';

    echo $output;
}
?>
