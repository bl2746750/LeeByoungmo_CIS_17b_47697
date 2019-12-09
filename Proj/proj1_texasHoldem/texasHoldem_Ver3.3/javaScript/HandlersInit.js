

$(document).ready(function(){
    
    fetch_user();
    
    
    setInterval(function(){
        fetch_user();
        update_messages();
    },5000);
    
    
    
})

function update_messages(){
    update_p1_message();
}

function update_p1_message(){
    $.ajax({
      url:"./inc/db/update_p1_messages.php",
      method:"POST",
      success:function(data){
//          var msg=JSON.parse(data);
//          var url="./Cards/aceclubs.jpg";
//            view.displayMessage(msg.msg_loc,nl2br(msg.message));
//            view.displayCard("001",url);
    $('#000').html(data);
            
          
      }
  })
}

function nl2br (str, is_xhtml) {
    if (typeof str === 'undefined' || str === null) {
        return '';
    }
    var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';
    return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
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
    check_num_players();

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
                start_play_game();
            }
            else {
                view.displayMessage("message_box","Still waiting for another players to come");
        }
    }  
    })
   
}

function start_play_game(){
    $.ajax({
        url:"./inc/db/start_play_game.php",
        success:function(){
            update_messages();
        }
    })
}

