<?php
include 'user_board.php';

//session_start();

$p_id=5;
$tag=user_board_tag($p_id);
return $tag;

