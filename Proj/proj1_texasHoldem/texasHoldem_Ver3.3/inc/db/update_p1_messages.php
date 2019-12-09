<?php

include 'user_board.php';

//session_start();

$p_id=0;
$tag=user_board_tag($p_id);
//$game_id= check_game_id();
//$_SESSION['game_id']=$game_id;
//
//
//$msg_loc="000";
//$query="SELECT * FROM xref_message_board 
//        WHERE game_id=$game_id and msg_loc=$msg_loc";
//$result=mysqli_query($link,$query);
//$rows=mysqli_num_rows($result);
//$row=mysqli_fetch_array($result,MYSQLI_ASSOC);
//
////echo "test";
////for($i=0;$i<$rows;$i++){
////    echo $row['msg_loc']."\n";
////    echo $row['message']."\n";
////}
//echo json_encode($row);
////echo count($row);
////print_r($row);
return $tag;

