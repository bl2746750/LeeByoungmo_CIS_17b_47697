<?php


require_once 'Deal.php';


class Game extends Deal{
    //put your code here
    public $savedGame;
    
    
    public function Game($num){
        $this->savedGame=new Deal($num);
    }
        
    public function save_game_class(){
        global $game;
        $this->savedGame=clone $game;
    }
    
    public function retrieve_game_class(){
        return $this->savedGame;
    }
}
