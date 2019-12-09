<?php 
require "inc/structure/header.php";
include "inc/Classes/Deal.php";
include "inc/view.php";
include "inc/structure/footer.php";
// include "inc/login/login_process.php";


?>

<!DOCTYPE html>

<html lang="en">
<head>

  <!-- Basic Page Needs
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta charset="utf-8">
  <title>Texas Holdem</title>
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Mobile Specific Metas
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- FONT
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link rel="stylesheet" href="css/BoardSheet.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  

</head>

<body>
    <div id="board">
        <?php include "inc/structure/play_game.php";?>
    </div>
   
  <!-- Primary Page Layout
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <div class="wrapper">
	  
	  <div id="login">
          <?php include "inc/login/login.php"; ?>
      </div>
	  
	  
	  
	  <?php if(isset($_SESSION['loggedin'])===true): ?>
      <div id="playButton"></div>
	  <?php endif; ?>
  </div>
      
  
  <div id='betting'>
      <?php include "inc/structure/betting_board.php";?>
  </div>