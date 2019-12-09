

var num_player;
$(document).ready(function(){
    fetch_user();
    
    setInterval(function(){
        
        fetch_user();
    },5000);
    
    function fetch_user(){
        $.ajax({
        url:"inc/db/fetch_user.php",
                method:"POST",
                success:function(data){
                    $('#user_info').html(data);
                }
            })
    }
    
})

$(document).on('click','.start_play',function(){
    user_status_ready();
    check_num_players();
    if(num_player>1) {set_players();}
    else view.displayMessage("message_box","Waiting for another players to come.");
    
})

function user_status_ready(){
    $.ajax({
        url:"./inc/db/join_game.php",
        success:function(){
            $('.start_play').hide();
        }
    })
}

function check_num_players(){
    
    $.ajax({
        url:"./inc/db/check_num_players.php",
        success:function(data){
            num_player=data*1;
            
        }
    })
}

function set_players(){
    $.ajax({
        url:"./inc/db/set_players.php",
    })
}