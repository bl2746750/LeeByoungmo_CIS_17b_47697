

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
    var num_players;
    user_status_ready();
    check_num_players();
//    num_players=document.getElementById('num_players').value;
//    document.write(num_players);
//    if(num_players>1) {
//        view.displayeMessage("message_box", num_players+"play game");
//        play_game();
//    }
//    else view.displayMessage("message_box","Waiting for another players to come.");
    
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
            var x=data*1;
            if(x>1) {
                view.displayMessage("message_box","Start game for "+x+" players");
                play_game();
            }
            else {
                view.displayMessage("message_box","Still waiting for another players to come");
        }
    }  
    })
   
}

function play_game(){
    $.ajax({
        url:"./inc/db/play_game.php",
        success:function(){
            
        }
    })
}

