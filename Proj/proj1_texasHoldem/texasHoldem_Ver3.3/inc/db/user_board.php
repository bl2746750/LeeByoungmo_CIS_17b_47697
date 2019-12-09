<?php




function user_board_tag($p_id){
    require 'loginMysql_1.php';
    $query="SELECT * FROM entity_users WHERE p_id=$p_id";
    $result= mysqli_query($link, $query);
    $row=mysqli_fetch_array($result,MYSQLI_ASSOC);
    $output='
        <div id="user_board">
        <span class="label label-success">'.$row['email'].'</span>
        <span class="badge badge-secondary">'."$ ".$row['balance'].'</span>
        </div>
    ';

    echo $output;
}
?>
