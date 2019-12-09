<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <div id='betting'>
            <?php session_start() ?>
            <?php if(isset($_SESSION['p_id'])&&$_SESSION['p_id']=$order):?>
            <form action="POST">
                <input type="hidden" id="custId" name="custId" value="3487">
                <input type="submit" value="Submit">
            </form>
            <button type="check_button" class="btn btn-success">1Check/Call</button>
          <button type="raise_button" class="btn btn-primary">Raise</button>
          <button type="fold_button" class="btn btn-secondary">Fold</button>
           <?php endif; ?>         
          
          <button type="check_button" class="btn btn-success">2Check/Call</button>
          <button type="raise_button" class="btn btn-primary">Raise</button>
          <button type="fold_button" class="btn btn-secondary">Fold</button>
          
          <button type="check_button" class="btn btn-success">Check/Call</button>
          <button type="raise_button" class="btn btn-primary">Raise</button>
          <button type="fold_button" class="btn btn-secondary">Fold</button>
          
          <button type="check_button" class="btn btn-success">Check/Call</button>
          <button type="raise_button" class="btn btn-primary">Raise</button>
          <button type="fold_button" class="btn btn-secondary">Fold</button>
          
          <button type="check_button" class="btn btn-success">Check/Call</button>
          <button type="raise_button" class="btn btn-primary">Raise</button>
          <button type="fold_button" class="btn btn-secondary">Fold</button>
          
          <button type="check_button" class="btn btn-success">Check/Call</button>
          <button type="raise_button" class="btn btn-primary">Raise</button>
          <button type="fold_button" class="btn btn-secondary">Fold</button>
          
          <button type="check_button" class="btn btn-success">Check/Call</button>
          <button type="raise_button" class="btn btn-primary">Raise</button>
          <button type="fold_button" class="btn btn-secondary">Fold</button>
          
          <button type="check_button" class="btn btn-success">Check/Call</button>
          <button type="raise_button" class="btn btn-primary">Raise</button>
          <button type="fold_button" class="btn btn-secondary">Fold</button>
          
          <button type="check_button" class="btn btn-success">Check/Call</button>
          <button type="raise_button" class="btn btn-primary">Raise</button>
          <button type="fold_button" class="btn btn-secondary">Fold</button>
          
          
            <form action="" method="get" class="form-example">
  <div class="form-example">
    <label for="name">Enter your name: </label>
    <input type="text" name="name" id="name" required>
  </div>
  <div class="form-example">
    <label for="email">Enter your email: </label>
    <input type="email" name="email" id="email" required>
  </div>
  <div class="form-example">
    <input type="submit" value="Subscribe!">
  </div>
</form>
          
          <form action="/action_page.php">
  First name: <input type="text" name="fname"><br>
  <input type="hidden" id="custId" name="custId" value="3487">
  <input type="submit" value="Submit">
</form>

          <button type="check_button" class="btn btn-success">Check/Call</button>
          <button type="raise_button" class="btn btn-primary">Raise</button>
          <button type="fold_button" class="btn btn-secondary">Fold</button>
        </div>
        <?php
        // put your code here
        ?>
    </body>
</html>
