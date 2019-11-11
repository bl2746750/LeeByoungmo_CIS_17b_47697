/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function hadleInputButton() {
    var nPlayers = document.getElementById("input");
    //var guess = guessInput.value.toUpperCase();

    controller.initGame(nPlayers);

    input.value = "";
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
    var inputButton = document.getElementById("inputButton");
    inputButton.onclick = handleInputButton;

    // handle "return" key press
    var input = document.getElementById("input");
    input.onkeypress = handleKeyPress;

    // place the ships on the game board
    model.generateShipLocations();
}