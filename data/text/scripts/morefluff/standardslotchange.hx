//standardslotchange.hx
//Used for changing slots in the same way `simplify`, `complicate`, `increaserange`, `decreaserange` or `doublerequirements` work.

//Arguments:
/*
 * eqlist:Array<Equipment>. A list of equipment to change the slots of.
 * method:String. Either `simplify`, `complicate`, `increaserange`, `decreaserange`, `doublerequirements`. A list of ways to change slots.
 */
 
//This script does not return any values. Use a copy of `eqlist` to change the slots back, lest shenanigans occur!

/*
It's worth first looking at what these different functions "mean".

* Simplify is just that - it makes equipment easier to play. An example of this is Hall of Mirrors' upgrade (NEEDS6 -> EVEN). Not recommended for equipment that actually uses the dice value for things like damage, since this makes them much more free to deal damage. Battle Axe would go from MAX4 -> Normal, quite a power boost!
* Complicate is the opposite, it makes equipment harder to play. Used for downgrades, for example Magic Shield goes from ODD -> NEEDS5. Similarly not recommended for dice damage equipment, since this is too harsh a nerf (Sword goes from NORMAL -> MAX3, which is a bit much!)
* IncreaseRange is like it sounds, it increases ranges. So MAX4 -> MAX5, REQUIRE6 -> MIN5, REQUIRE4 -> RANGE35 (aww yiss). The counterpart of Simplify for dice damage equipment, it's much more fair.
* DecreaseRange is the opposite, it decreases ranges. So MIN4 -> MIN5, MAX2 -> REQUIRE1, etc.
* DoubleRequirements does just that, it doubles the requirements **where possible**. So if a size 2 equipment has 3 slots, this is ineligible for this. Really not recommended for anything that uses the dice value to deal damage/inflict statuses, since the value will be doubled!

*/
function simplifySubstitute(slotstring){
    var returnslots = slotstring;
    for(i in 0...returnslots.length){
		switch(returnslots[i]){
			case "EVEN","ODD","MAX3","MAX4","MAX5","MIN2","MIN3","MIN4","RANGE25": returnslots[i] = "NORMAL";
			case "REQUIRE1","REQUIRE3","REQUIRE5": returnslots[i] = "ODD";
			case "REQUIRE2","REQUIRE4","REQUIRE6": returnslots[i] = "EVEN";
			case "MAX1": returnslots[i] = "MAX2"; //no, bad
			case "MAX2","RANGE23": returnslots[i] = "MAX4";
			case "RANGE24": returnslots[i] = "MAX5";
			case "RANGE34": returnslots[i] = "RANGE25";
			case "RANGE35": returnslots[i] = "MIN2";
			case "RANGE45": returnslots[i] = "MIN3";
			default: returnslots[i] = "NORMAL";
		}
    }
    return returnslots;
}

function increaseRangeSubstitute(slotstring){
    var returnslots = slotstring;
    for(i in 0...returnslots.length){
		for(x in [1,2,3,4,5,6]){
			if(returnslots[i] == "MAX"+x){
				returnslots[i] = "MAX"+(x+1);
			}
			if(returnslots[i] == "MIN"+x){
				returnslots[i] = "MIN"+(x-1);
			}
		}
		switch(returnslots[i]){
			case "REQUIRE1": returnslots[i] = "MAX2";
			case "REQUIRE2": returnslots[i] = "MAX3";
			case "REQUIRE3": returnslots[i] = "RANGE24";
			case "REQUIRE4": returnslots[i] = "RANGE35";
			case "REQUIRE5": returnslots[i] = "MIN4";
			case "REQUIRE6": returnslots[i] = "MIN5";
			case "RANGE23": returnslots[i] = "MAX4";
			case "RANGE24": returnslots[i] = "MAX5";
			case "RANGE25": returnslots[i] = "NORMAL";
			case "RANGE34": returnslots[i] = "RANGE25";
			case "RANGE35": returnslots[i] = "RANGE26";
			case "RANGE45": returnslots[i] = "MIN3";
			//lots of fall-through cases here, hopefully it's fine
		}
    }
    return returnslots;
}

function doubleRequirements(slotstring){
	var returnslots = [];
	for(slot in slotstring){
		returnslots.push(slot);
		returnslots.push(slot);
	}
	return returnslots;	
}




if(args.length < 2){
	trace("Error: missing argument.");
	if(args.length == 1){
		trace("Missing the slot changing method, either \"simplify\", \"complicate\", \"increaserange\", \"decreaserange\", \"doublerequirements\.");
	}else{
		trace("Missing any requirements. Pass a list of equipment to change, as well as the slot changing method (either \"simplify\", \"complicate\", \"increaserange\", \"decreaserange\", \"doublerequirements\.");
	}
}else if(args[1] == "" || args[1] == null){
	trace("Missing the slot changing method, either \"simplify\", \"complicate\", \"increaserange\", \"decreaserange\", \"doublerequirements\.");
}else{
	if(args[0].length > 0){
		for(eq in args[0]){ //Change the slots of every item in this list
			if(args[1] == "simplify" || args[1] == "Simplify"){
				
			}
		}
	}
};


























