<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function betting_window_appear($betting_order){
    if(isset($_SESSION['p_id'])&&$_SESSION['p_id']==$betting_order){
        $output=' <button type="check_button" class="btn btn-success">Check/Call</button>
                  <button type="raise_button" class="btn btn-primary">Raise</button>
                  <button type="fold_button" class="btn btn-secondary">Fold</button>
                ';
        echo $output;
    }
}

