<?php 
session_start();


?>

  <div class="container">
	<h1 class="title" style="margin-top: 40px">Texas Holdem</h1>
            <?php if(isset($_SESSION['email'])) : ?> 
               <?php echo "Hi,".htmlspecialchars($_SESSION["email"]); ?>
                  <a href="inc/login/logout.php">Logout  </a>
               
            <?php endif; ?>
</div>

