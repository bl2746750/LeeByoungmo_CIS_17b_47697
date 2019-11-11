/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function hadleInputButton() {
    var nPlayers = document.getElementById("input").value;
//    nPlayers.setAttribute("type","number");
    view.displayMessage(nPlayers);
    //var guess = guessInput.value.toUpperCase();
    document.getElementById("inputButton").style.display = "block";
    inputButton.style.display = "none"; 
    document.getElementById("input").style.display = "block";
    input.style.display = "none"; 
    controller.initGame(nPlayers);

    nPlayers.value = "";
}

function handleKeyPress(e) {
    var inputButton = document.getElementById("inputButton");

    // in IE9 and earlier, the event object doesn't get passed
    // to the event handler correctly, so we use window.event instead.
    e = e || window.event;

    if (e.keyCode === 13) {
            inputButton.click();
            return false;
    }
}

// init - called when the page has completed loading

window.onload = init;

function init() {
    // Fire! button onclick handler
    view.displayMessage("Please Enter the number of players!!!");
    var inputButton = document.getElementById("inputButton");
    inputButton.onclick = hadleInputButton;

    // handle "return" key press
    var input = document.getElementById("input");
    input.onkeypress = handleKeyPress;

    // place the ships on the game board
//    model.generateShipLocations();
}