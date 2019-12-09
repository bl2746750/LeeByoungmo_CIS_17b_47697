


$(document).ready(function(){
    
    fetch_user();
    
    setInterval(function(){
        fetch_user();
        update_user_label();
        update_cards();
        betting();
    },5000);
    
    
    
})


function update_user_label(){
    $.ajax({
        url:"./inc/db/user_board.php",
        method:"POST",
        data:"action=getjson",
        dataType:"JSON",
        success:function(data){
            console.log("success");
            for(var i=0;i<data.length;i++){
                view.displayMessage(data[i][0],data[i][1]);
            }
        }
    })
}


function fetch_user(){
        $.ajax({
        url:"inc/db/fetch_user.php",
        method:"POST",
        success:function(data){
            $('#user_info').html(data);
        }
    })
}
    
$(document).on('click','.start_play',function(){
    user_status_ready();
    

})


function user_status_ready(){
    $.ajax({
        url:"./inc/db/join_game.php",
        method:"POST",
        success:function(data){
            console.log(data);
            view.displayMessage("message_box",data);
            check_num_players_ready();
            
        }
    })
}


function check_num_players_ready(){
   
    $.ajax({
        url:"./inc/db/check_num_players_ready.php",
        method:"POST",
        success:function(data){
            num_players=data*1;
            if(num_players>1) {
                start_play_game(num_players);
                view.displayMessage("message_box",data);
            }
            else {
                view.displayMessage("message_box","Still waiting for another players to come");
        }
    }  
    })
   
}

function start_play_game(num){
    $.ajax({
        url:"./inc/db/start_play_game.php",
        success:function(){
            preflop();
        }
    })
}


function preflop(){
    $.ajax({
        url:"./inc/db/preflop.php",
        method:"POST",
        success:function(data){
            update_cards();
            betting();
            
            
        }
    })
}

function betting(){
    $.ajax({
        url:"./inc/db/betting_button.php",
        method:"POST",
        success:function(data){
            $('#betting').html(data);
        }
    })
}

$(document).on('click','.check_call',function(){
    //console.log("test");
    betting();

}) 
function update_cards(){
    $.ajax({
        type:"POST",
        data:"action=getjson",
        url:"./inc/db/update_cards.php",
        dataType:"JSON",
        success:function(data){
            for(var i=0;i<data.length;i++){
                //console.log(data[i][1]);
                view.displayCard(data[i][1],data[i][2]);
            }
            
            
        }
    })
    
}