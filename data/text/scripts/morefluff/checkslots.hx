//checkslots.hx
//Takes a dice slot and a dice value, and checks if the value fits

//Arguments:
/*
 * diceslot:String. Value of a dice slot, e.g. NORMAL, REQUIRE1, RANGE45.
 * dicevalue:Int. Value of a dice, between 1-6 inclusive.
 */
 
//Return values:
/*
 * diceFits:Bool. true if the dice can slot into this slot, false if it can't.
 */
 
if(args.length < 2){
	if(args.length == 1){
		trace("Error: Missing the dice value.");
	}else{
		trace("Error: Missing any arguments. Pass a dice slot, and a dice value.");
	}
}else if(args[1] == null){
	trace("Error: Missing a dice value.");
}else if(args[1] < 1){
	trace("Error: Dice can't be less than 1!");
}else if(args[1] > 6){
	trace("Error: Dice can't be greater than 6!");
}else{
	var slot = args[0];
	var dice = args[1];
	
	//Check common slots
	if(slot == "NORMAL"){return true;};	
	if(slot == "EVEN"){return dice%2 == 0;};
	if(slot == "ODD"){return dice%2 == 1;};
	if(slot.indexOf("FREE") > -1){return false;}; //Can't put dice into free slots
	if(slot.indexOf("SPARE") > -1){return false;}; //Can't put dice into spare slots
	
	if(slot == "REQUIRE"+dice){return true;} //If it's a requireX slot with an X dice, then true
	if(slot.indexOf("REQUIRE") > -1){return false;}; //Otherwise, it's a requireX slot with a Y != X dice, so false
	//This cuts out like 6 checks, saving the time it's taken me to write these comments
	
	for(x in 1... (dice + 1)){ //Loop through MIN1, MIN2, ... MIN(X) - all are valid
        if (slot == "MIN"+x) {
            return true;
        };
    };
	for(x in dice...7){ //Loop through MAX(X), MAX(X+1), ... MAX6 - all are valid
        if (slot == "MAX"+x) {
            return true;
        };
    };
	
	var ranges = [[2,3],[2,4],[2,5],[3,4],[3,5],[4,6]];
	for(r in ranges){ //Loop through RANGE23, RANGE24... RANGE46, check if dice >= first one and <= second one
		if(slot == "RANGE"+r[0]+r[1] && dice >= r[0] && dice <= r[1]){
			return true;
		}
	}
	return false; //Found nothing, whoops, fallback
};