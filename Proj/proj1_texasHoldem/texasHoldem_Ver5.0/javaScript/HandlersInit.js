


$(document).ready(function(){
    
    fetch_user();
    betting_button();
    update_cards();
    setInterval(function(){
        fetch_user();
        update_user_label();
        update_cards();
        betting_button();
    },5000);
    
    
    
})


function update_user_label(){
    $.ajax({
        url:"inc/db/user_board.php",
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
        url:"./inc/db/fetch_user.php",
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
        url:"inc/db/join_game.php",
        method:"POST",
        success:function(data){
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
                start_play_game();
                view.displayMessage("message_box",data);
            }
        
        }  
    })
   
}

function start_play_game(){
    $.ajax({
        url:"./inc/db/start_play_game.php",
        success:function(){
             
            shuffle();
            
        }
    })
}

function shuffle(){
    $.ajax({
        url:"./inc/db/shuffle.php",
        success:function(){
            preflop();
        }
    })
}

function terminate_game(){
    $.ajax({
        url:"./inc/db/terminate_game.php",
        success:function(){
            
            betting_button();
            check_num_players_ready();
            
        }
    })
}

function river(){
    $.ajax({
        url:"./inc/db/river.php",
        success:function(){
            //update_cards();
            betting_button();
             
            
        }
    })
}
function turn(){
    $.ajax({
        url:"./inc/db/turn.php",
        success:function(){
            //update_cards();
            //$('#betting').show();
            betting_button();
             
        }
    })
}

function flop(){
    $.ajax({
        url:"./inc/db/flop.php",
        success:function(){
            //update_cards();
            //$('#betting').show();
            betting_button();
             
        }
    })
}

function preflop(){
    $.ajax({
        url:"./inc/db/preflop.php",
        method:"POST",
        success:function(data){
            //update_cards();
            //$('#betting').show();
            betting_button();
              
            
            
        }
    })
}

function betting_button(){
    
    $.ajax({
        url:"./inc/db/betting_button.php",
        method:"POST",
        success:function(data){
            $('#message_box').html(data);
            //console.log(data);
            if(data*1==0) {}
            else if(data*1==1) {
                go_to_next_step();
            }
            else if(data*1==2) {
                increment_betting_order();
            }
            else if(data*1==-1) {terminate();}
            else{
                $('#betting').html(data);
            }
            
            
        }
    })
}

function increment_betting_order(){
    $.ajax({
        url:"./inc/db/increment_betting_order.php",
        method:"POST",
        success:function(data){
            
        }
    })
}


function go_to_next_step(){
    $.ajax({
        url:"./inc/db/go_to_next_step.php",
        method:"POST",
        success:function(data){
            console.log(data);
            if(data*1==1) {flop();}
            else if(data*1==2) {turn();}
            else if(data*1==3) {river();}
            else if(data*1==4) {terminate_game();}
        }
    })
}

//$(document).reay(function(){
//    
//})

$(document).on('click','#check_call',function(){
    //e.preventDefault();
    $.ajax({
        url:"./inc/db/check_call_process.php",
        success:function(){
            $('#betting').hide();
            
                      
        }
    })
})

$(document).on('click','#raise_button',function(){
    
    var max=document.getElementById("raise_button").value;
    var min=0;
    var raise=prompt("Please enter an amount between 0 and "+max);
    while(raise>max||raise<0){
        raise=prompt("Amount should be between 0 and "+max);
    }
    document.getElementById("raise_button").value=raise;
    $.ajax({
        type:'POST',
        url:'./inc/db/raise.php',
        data:{raise:$('#raise_button').val()},
        success: function(data){
            //$("#message_box").html(data);
            $('#betting').hide();
        }    
    })
})

$(document).on('click','#fold',function(){
    
    $.ajax({
        type:'POST',
        url:'./inc/db/fold.php',
        success: function(data){
            $("#message_box").html("Success");
            if(data*1==-1) terminate_game();
            $('#betting').hide();
            
        }    
    })
})


function update_cards(){
    $.ajax({
        type:"POST",
        data:"action=getjson",
        url:"./inc/db/update_cards.php",
        dataType:"JSON",
        success:function(data){
            console.log(data);
            for(var i=0;i<data.length;i++){
                view.displayCard(data[i][1],data[i][2]);
            }
            
            
        }
    })
    
}