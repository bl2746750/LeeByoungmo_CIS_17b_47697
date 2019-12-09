


$(document).ready(function(){
    
    fetch_user();
    
    setInterval(function(){
        fetch_user();
        update_user_label();
        
    },5000);
    
    
    
})

function select_user_loc(p_id){
    switch(p_id){
        case 0: return "000";break;
        case 1: return "004";break;
        case 2: return "008";break;
        case 3: return "012";break;
        case 4: return "212";break;
        case 5: return "208";break;
        case 6: return "204";break;
        case 7: return "200";break;
        default: return "Bad Value";
    }
}

function update_user_label(){
    $.ajax({
        url:"./inc/db/check_num_players.php",
        method:"POST",
        success:function(data){
            for(var i=0;i<data*1;i++){
                update_each_label(i);
            } 
        }
    })
}

function update_each_label(p_id){
    $.ajax({
      url:"./inc/db/update_p"+p_id+"_messages.php",
      method:"POST",
      success:function(data){
          user_tag_loc=select_user_loc(p_id);
          var url="./Cards/aceclubs.jpg";
          view.displayMessage(user_tag_loc,data);
//          view.displayCard("001",url);
//          view.displayCard("002",url);
//          view.displayCard("005",url);
//          view.displayCard("006",url);
//          view.displayCard("009",url);
//          view.displayCard("010",url);
//          view.displayCard("013",url);
//          view.displayCard("014",url);
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
    

})


function user_status_ready(){
    $.ajax({
        url:"./inc/db/join_game.php",
        success:function(){
            //$('.start_play').hide();
            check_num_players_ready();
        }
    })
}

function check_num_players_ready(){
   
    $.ajax({
        url:"./inc/db/check_num_players_ready.php",
        success:function(data){
            num_players=data*1;
            //document.write(num_players);
            if(num_players>1) {
                start_play_game(num_players);
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

function preflop(){
    $.ajax({
        url:"./inc/db/preflop.php",
        success:function(){
            update_cards();
            
        }
    })
}

function update_cards(){
    $.ajax({
        url:"./inc/db/update_cards.php",
        method:"POST",
        success:function(data){
            
        }
    })
    
}