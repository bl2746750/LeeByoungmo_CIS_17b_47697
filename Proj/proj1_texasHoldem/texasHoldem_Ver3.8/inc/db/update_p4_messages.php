<?php
include 'user_board.php';

//session_start();

$p_id=4;
$tag=user_board_tag($p_id);
return $tag;

