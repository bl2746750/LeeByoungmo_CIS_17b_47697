/* 
    Created on : Sep 18, 2019, 6:28:09 PM
    Author     : Head First Javascript Example Project
 */

/* global view */

var model = {
    boardSize: 3,
    numShips: 1,
//    shipLength: 3,
    shipsSunk: 0,
    marks:[
        {location:"00", hits: "00"},{location:"01", hits: "01"},{location:"02", hits: "02"},
        {location:"10", hits: "10"},{location:"11", hits: "11"},{location:"12", hits: "12"},
        {location:"20", hits: "20"},{location:"21", hits: "21"},{location:"22", hits: "22"}
    ],
    count: 0,
    

    fire: function(guess) {
       
        var index;
        var player;
        if(this.count%2===0) player="O";
        else player="X";
        
        if(guess==="00") index=0;
        else if(guess==="01") index=1;
        else if(guess==="02") index=2;
        else if(guess==="10") index=3;
        else if(guess==="11") index=4;
        else if(guess==="12") index=5;
        else if(guess==="20") index=6;
        else if(guess==="21") index=7;
        else if(guess==="22") index=8;
        
       
//        alert(index);
        
//        for(var i=0;i<9;i++){
//            if(guess===this.marks[i].location){
                  
                    if(this.marks[index].hits ==="x"||this.marks[index].hits ==="o"){
                        view.displayMessage("Oops, you already hit that location!");
                        return true;
                    }
                    else{
                        if(this.count%2===0){
                            this.marks[index].hits="o";
                            view.displayHit(guess);
                            //view.displayMessage("o!");
                            
                        }
                        else {
                            this.marks[index].hits="x";
                            view.displayMiss(guess);
                            //view.displayMessage("x!");
                            
                        }
                    }
//                }
//            }
            
            if (this.isSunk()) {
                view.displayMessage("Player " +player+" won!");
                return true;
            } else{
                if(this.count==8) view.displayMessage("Tie!");
            }
//          
        this.count++;
        return false;
    },

    isSunk: function() {
        if(this.marks[0].hits===this.marks[1].hits&&this.marks[1].hits===this.marks[2].hits) {return true;}
        else if(this.marks[3].hits===this.marks[4].hits&&this.marks[4].hits===this.marks[5].hits) {return true;}
        else if(this.marks[6].hits===this.marks[7].hits&&this.marks[7].hits===this.marks[8].hits) {return true;}
        else if(this.marks[0].hits===this.marks[3].hits&&this.marks[3].hits===this.marks[6].hits) {return true;}
        else if(this.marks[1].hits===this.marks[4].hits&&this.marks[4].hits===this.marks[7].hits) {return true;}
        else if(this.marks[2].hits===this.marks[5].hits&&this.marks[5].hits===this.marks[8].hits) {return true;}
        else if(this.marks[2].hits===this.marks[4].hits&&this.marks[4].hits===this.marks[6].hits) {return true;}
        else if(this.marks[0].hits===this.marks[4].hits&&this.marks[4].hits===this.marks[8].hits) {return true;}
        else return false;
    }
    
};

//    generateShipLocations: function() {
//        var locations;
//        for (var i = 0; i < this.numShips; i++) {
//            do {
//                locations = this.generateShip();
//            } while (this.collision(locations));
//            this.ships[i].locations = locations;
//        }
//        console.log("Ships array: ");
//        console.log(this.ships);
//    },
//
//    generateShip: function() {
//        var direction = Math.floor(Math.random() * 2);
//        var row, col;
//
//        if (direction === 1) { // horizontal
//            row = Math.floor(Math.random() * this.boardSize);
//            col = Math.floor(Math.random() * (this.boardSize - this.shipLength + 1));
//        } else { // vertical
//            row = Math.floor(Math.random() * (this.boardSize - this.shipLength + 1));
//            col = Math.floor(Math.random() * this.boardSize);
//        }
//
//        var newShipLocations = [];
//        for (var i = 0; i < this.shipLength; i++) {
//            if (direction === 1) {
//                newShipLocations.push(row + "" + (col + i));
//            } else {
//                newShipLocations.push((row + i) + "" + col);
//            }
//        }
//        return newShipLocations;
//    },
//
//    collision: function(locations) {
//        for (var i = 0; i < this.numShips; i++) {
//            var ship = this.ships[i];
//            for (var j = 0; j < locations.length; j++) {
//                if (ship.locations.indexOf(locations[j]) >= 0) {
//                    return true;
//                }
//            }
//        }
//        return false;
//    }
//	
//}; 