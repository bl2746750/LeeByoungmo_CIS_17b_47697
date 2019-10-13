<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

Class View{
    public function displayMessage($msg){
        $doc = new DomDocument;

        // We need to validate our document before refering to the id
        $doc->validateOnParse = true;
        $doc->Load('BoardSheet.php');
        $messageArea=$doc->getElementById("messageArea")->nodeValue;
        $message->innerHTML=msg;
    }
    
    public function display($location,$cardImg){
        $doc = new DOMDocument;
        $cell = $doc->createElement($location);
        $newCell = $doc->appendChild($cell);
        $newCell->setAttribute("class", "Card");
    }
}
