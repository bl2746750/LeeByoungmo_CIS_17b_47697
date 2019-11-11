/*
 * File:   view.js
 * Author: Byoung Mo Lee
 * Created on October 10, 2019 10:33 AM
 * Purpose: Texas Holdem
 * 
 */

var view = {
    displayMessage: function(msg) {
        var messageArea = document.getElementById("messageArea");
        messageArea.innerHTML = msg;
    },

    displayCard: function(location,url) {
        var num=Deal.nPlayers;
        document.getElementById(location).style.background="url('" +url + "') no-repeat center center";
    }

}; 