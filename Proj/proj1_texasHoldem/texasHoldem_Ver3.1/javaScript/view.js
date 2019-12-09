


var view = {
    displayMessage: function(location, msg) {
        var msgloc = document.getElementById(location);
        msgloc.innerHTML = msg;
    },

    displayCard: function(location,url) {
        var cell = document.getElementById(location);
        document.getElementById(location).style.background=
                "url('" +url + "') no-repeat center center";
        
    }

}; 