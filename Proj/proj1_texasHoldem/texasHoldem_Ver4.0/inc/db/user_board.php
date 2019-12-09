<?php


user_board_tag();


function user_board_tag(){
    require 'query_players.php';
    require 'query_game.php';
    require_once '../Classes/Deal.php';
    
    $game_id= get_playing_game_id();
    
    
    if($game_id>=0){
        $user_board=array();
        $num_players= get_num_players_playing_by_game_id($game_id);
        //echo $num_players;
        $game=new Deal($num_players);
        $p= retrieve_players($game_id);  //xref_play_game entry
        //print_r($p);
        $game->setGameId($game_id);
        $game->setPlayers($p);
        $game->setLoc();
        
        for($i=0;$i<$num_players;++$i){
            $loc=$game->getUMLocByP_id($i);
            $user_name=$game->getPlayerName($i);
            $balance=$game->getPlayerBalance($i);
            
            $output='
        <span class="label label-success">'.$user_name.'</span>
        <p class="card-text">'."$ ".$balance.'</p>
    ';
            $user_board[$i]=array($loc,$output);
        }
        
       $output_json=json_encode($user_board);
       echo $output_json;
    }
    else{
        
    }
    
    //print_r($user_board);

    //echo $output;
}
?>
