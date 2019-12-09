<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function mysql_entities_fix_string($link,$string){
    return htmlentities(mysql_fix_string($link,$string));
}

function mysql_fix_string($link,$string){
    if(get_magic_quotes_gpc()) $string=stripslashes($string);
    return $link->real_escape_string($string);
}