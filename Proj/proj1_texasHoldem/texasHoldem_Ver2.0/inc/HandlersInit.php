
<script type="text/JavaScript">
function hadleInputButton() {
    var nPlayers = 5;
//    nPlayers.setAttribute("type","number");
    view.displayMessage("test");
    //var guess = guessInput.value.toUpperCase();
    document.getElementById("initGameButton").style.display = "block";
    initGameButton.style.display = "none"; 
    document.getElementById("initGame").style.display = "block";
    initGame.style.display = "none"; 
    <?php $game=new Deal(2);?>

    nPlayers.value = "";
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
    initGameButton.onclick = hadleInputButton;

    // handle "return" key press
    var initGame = document.getElementById("initGame");
    initGame.onkeypress = handleKeyPress;

    // place the ships on the game board
//    model.generateShipLocations();
}
</script>
