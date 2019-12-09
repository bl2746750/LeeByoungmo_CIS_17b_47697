<?php ?>

<script type="text/JavaScript">
var view = {
    displayMessage: function(location, msg) {
        var cell = document.getElementById(location);
        cell.innerHTML = msg;
    },

    displayCard: function(location,url) {
        var cell = document.getElementById(location);
        cell.setAttribute("class","card");
        cell.style.background="url('" +url + "')";
        
    }

}; 
</script>