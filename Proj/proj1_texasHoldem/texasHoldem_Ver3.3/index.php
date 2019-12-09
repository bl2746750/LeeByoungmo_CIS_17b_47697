<?php 

session_start();
if(!isset($_SESSION['user_id'])){
    header("location:./inc/login/login.php");
}

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
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdn.rawgit.com/mervick/emojionearea/master/dist/emojionearea.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.js"></script>
        <script src="./javaScript/HandlersInit.js"></script>
        <script src="./javaScript/view.js"></script>
        <script src="./inc/Classes/Card.js"></script>
        <script src="./inc/Classes/Player.js"></script>
       

</head>
<body>
<div class="container">
	<h1 class="title" style="margin-top: 40px">Texas Holdem</h1>
            <?php if(isset($_SESSION['email'])) : ?> 
               <?php echo "Hi, ".htmlspecialchars($_SESSION["email"]); ?>
                  <a href="inc/login/logout.php">Logout  </a>
               
            <?php endif; ?>
</div>

    <div id="board">
                    <div id="messageArea"></div>
            <table class="board_table" >
                <tr bgcolor="darkgreen" >
                    <td id="000">000</td> <td id="001">001</td> 
                    <td id="002">002</td> <td id="003">003</td>
                    <td id="004">004</td> <td id="005">005</td> 
                    <td id="006">006</td> <td id="007">007</td>
                    <td id="008">008</td> <td id="009">009</td> 
                    <td id="010">010</td> <td id="011">011</td>
                    <td id="012">012</td> <td id="013">013</td> 
                    <td id="014">014</td> <td id="015">015</td>
                    
            </tr>
                <tr bgcolor="darkgreen" >
                    <td id="100">100</td> <td id="101">101</td> 
                    <td id="102">102</td> <td id="103">103</td>
                    <td id="104">104</td> <td id="105">105</td> 
                    <td id="106">106</td> <td id="107">107</td>
                    <td id="108">108</td> <td id="109">109</td> 
                    <td id="110">110</td> <td id="111">111</td>
                    <td id="112">112</td> <td id="113">113</td> 
                    <td id="114">114</td> <td id="115">115</td>
                    
                </tr>
                <tr bgcolor="darkgreen" >
                    <td id="200">200</td> <td id="201">201</td> 
                    <td id="202">202</td> <td id="203">203</td>
                    <td id="204">204</td> <td id="205">205</td> 
                    <td id="206">206</td> <td id="207">207</td>
                    <td id="208">208</td> <td id="209">209</td> 
                    <td id="210">210</td> <td id="211">211</td>
                    <td id="212">212</td> <td id="213">213</td> 
                    <td id="214">214</td> <td id="215">215</td>
                   
                </tr>
                
            </table>
        <div id='betting'>
          <button type="check_button" class="btn btn-success">Check/Call</button>
          <button type="raise_button" class="btn btn-primary">Raise</button>
          <button type="fold_button" class="btn btn-secondary">Fold</button>
        </div>
    </div>
    <div id="user_info"></div>  
    <div id="message_box"></div>
    
    </body>
</html>
