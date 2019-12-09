<?php
require '../Classes/Game.php';

$game=new Game(2);
save_game_class($game);
print_r($storedGame);