<?php 
session_start();
require 'survey.php';
$mysurvey = new Survey();
?>

<!DOCTYPE html>

<html lang="en">
<head>

  <!-- Basic Page Needs
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta charset="utf-8">
  <title>Survey Engine</title>
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Mobile Specific Metas
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- FONT
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link href="//fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">

  <!-- CSS
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/skeleton.css">

  <!-- Favicon
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link rel="icon" type="image/png" href="images/favicon.png">

</head>
<body>

  <!-- Primary Page Layout
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <div class="container">
		<div class="sixteen columns">
			<h1 class="remove-bottom" style="margin-top: 40px">Survey Engine</h1>
		</div>
		<div class="sixteen columns">
			<div id="nav">
				<ul>    
                                        <?php if(isset($_SESSION['email'])) : ?> 
					<li>
						<a href="take_survey.php" >Take the survey</a>
					</li>
                                        <li>
						<a href="logout.php">Logout</a>
					</li>
                                        <?php endif; ?>
                                        <?php if(isset($_SESSION['admin'])) : ?>    
					<li>
						<a href="admin.php" >Dashboard</a>
					</li>
					<li>
						<a href="admin.php?task=add_new">Add new Question</a>
					</li>
                                        <?php endif; ?>
					
					

				</ul>
			</div>
		</div>

