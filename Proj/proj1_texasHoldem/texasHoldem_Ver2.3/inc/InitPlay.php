<script type="text/JavaScript">
    
function setTable(){
    
    <?php $new_game=new Deal();?>
    <?php $p_id=$_SESSION['p_id'];?>
    var p_id="<?php echo $p_id;?>";
    $(document).ready(function(){
        $("playButton").click(function(){
        $("#001").load("test");
  });
    request.open(msg,'inc/structure/play_game.php',true);
    request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    request.setRequestHeader("Content-length",msg.length);
    request.setRequestHeader("Connection", "close");
}

function asyncRequest(){
    try{
        var request=new XMLHttpRequest();
    }
    catch(e1){
        try{
            request=new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch(e2){
            try{
                request=new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch(e3){
                request=false;
            }
        }
    }
    return request;
}

window.onload = init;

function init(){
    var initButton=document.getElementById("playButton");
    initButton.onclick = setTable;
}   
    
</script>