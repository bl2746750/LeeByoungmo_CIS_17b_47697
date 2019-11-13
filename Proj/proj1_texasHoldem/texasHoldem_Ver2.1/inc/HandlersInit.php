<script type="text/JavaScript">
    
function hadleInitButton() {
    <?php
    update_status_to_active();
    
    function update_status_to_active(){
        require_once 'loginMysql.php';
        $email=$_SESSION['email'];
        $query="UPDATE entity_users SET status=1 WHERE email='$email'";
        $result=$link->query($query);
        if(!$result) die("Database access failed1");
    }
    $user_id=$_SESSION['user_id'];
    $email=$_SESSION['email'];
    $newGame=new Deal();
    $newGame->joinGame($user_id);
    $newGame->setPlayers($email);
    ?>
//    var nPlayers= <?php echo $newGame->nPlayers;?>;       
//    for(var i=0;i<nPlayers;++i){
//        view.displayMessage(<?php echo $newGame->players[$cnt]->user_message_loc;?>,<?php echo $newGame->players[$cnt]->pName?>);
//    }        
    
    //var guess = guessInput.value.toUpperCase();
    document.getElementById("initGameButton").style.display = "block";
    initGameButton.style.display = "none"; 
    document.getElementById("initGame").style.display = "block";
    initGame.style.display = "none"; 
    
}

function handleKeyPress(e) {
    var initGameButton = document.getElementById("initGame");

    // in IE9 and earlier, the event object doesn't get passed
    // to the event handler correctly, so we use window.event instead.
    e = e || window.event;

    if (e.keyCode === 13) {
            initGameButton.click();
            return false;
    }
}

// init - called when the page has completed loading

window.onload = init;

function init() {
    // "initGame" button onclick handler
//    view.displayMessage("Please Enter the number of players!!!");
    var initGameButton = document.getElementById("initGame");
    initGameButton.onclick = hadleInitButton;
    
    // handle "return" key press
//    var initGame = document.getElementById("initGame");
//    initGame.onkeypress = handleKeyPress;

    // place the ships on the game board
//    model.generateShipLocations();
}
</script>
