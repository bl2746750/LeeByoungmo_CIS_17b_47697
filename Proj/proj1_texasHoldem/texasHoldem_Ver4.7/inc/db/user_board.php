<?php


user_board_tag();


function user_board_tag(){
    require '../db/query_players.php';
    require '../db/query_game.php';
    require '../db/query_balance.php';
    require '../db/retrieve_game_class.php';
    require_once '../Classes/Deal.php';
    
    
    $game_id= get_playing_game_id();
    
    if($game_id>=0){
        $user_board=array();
        $game= retrieve_game_class($game_id);
        $num_players=$game->getNumP();
        //echo $num_players;
        //print_r($p);
      
        
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
        
        $loc_pot='100';
        $potBal=$game->getPotBal();
        $output_pot='
        <span class="label label-success">game_id = '.$game_id.'</span>
        <p class="card-text">'."$ ".$potBal.'</p>
    ';
       $user_board[$num_players]=array($loc_pot,$output_pot); 
       $output_json=json_encode($user_board);
       echo $output_json;
    }
    else{
        
    }
    
    //print_r($user_board);

    //echo $output;
}
?>
