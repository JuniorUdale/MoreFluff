//inflictrandomstatus.hx
//Used for inflicting negative random statuses; e.g. Warlock's Dark Shadow.

//Arguments:
/*
 * amount:Int = 1. The amount of statuses to inflict.
 * singleStatus:Bool = false. false if you want to randomly inflict multiple statuses, true if you want to pick a single random status and inflict `amount` of that status. So with `true` and `amount = 3` you will only get results like 3 shock, 3 burn, 3 freeze or 3 curse, but with `false` and `amount=3` you might get 1 burn+1 freeze+1 shock, 1 curse+2 lock, etc.
 * includeStatuses:String. A filepath of statuses/sound effects to pull from. If this is empty, pull from statuslist.csv (see Related Files). If this has contents, only consider strings from this list.
 * excludeStatuses:Array<String>. An array of statuses to exclude. For example, if this is [FIRE,ICE], then random statuses except Fire or Ice can be inflicted randomly. Leave empty to apply any statuses from statuslist.csv. Works with includeStatuses, but why would you need that?
 * playSound:Bool = true. If false, don't play any sound effect. If true, plays the sound effect for each status in order, with a delay of soundDelay (see below) between them.
 * soundDelay:Float = 0.1. The delay between each sound effect, if playSound is true or default.
 */
 
//Return values:
/*
 * statuslist:Array<String>. A list of all statuses inflicted, in the order they were inflicted. Does **not** take into account Reduce? on the enemy or elemental immunities!
 */
 
//Related files:
/*
 * basemod/statuslist.csv. A list of all statuses in the game this function is able to inflict, as well as their sound effects. Append to this file to make your own random statuses inflictable. Example format:
	FIRE    _fire
	ICE     _ice
	SHOCK   _shock
	
	[e.g. modded stat:]
	NEWSTAT _magic
 */


var statuses = [];
if(args.length >= 2 && args[2] != null && args[2] != ""){
	statuses = loadtext(args[2]); //if custom statuses are specified, load from that file
}else{
	loadtext("basemod/statuslist"); //[[FIRE,"_fire"],[ICE,"_ice"], ... ]
}

if(args.length >= 3 && args[3] != null && args[3].length > 0){ //If there's statuses to remove
	newstats = [];
	for(stat in statuses){ //so [FIRE,"_fire"], [ICE,"_ice"], etc
		include = true;
		for(removestat in args[3]){
			if(stat[0] == removestat){
				include = false; //on match, don't include it
			}
		}
		if(include){newstats.push(stat);};
	}
}

var returnlist = [];
var playSound = (args.length > 3 && args[3] == true);

if(args.length > 1 && args[1] == true){ //Only 1 status? Inflict it.
	var randstat = rand(statuses);
	inflict(randstat[0], amount);
	sfx(randstat[1]);
	for(count in 0...amount){
		returnlist.push(randstat[0]);
	}
}else{ //Inflict multiple random ones
	var delay = 0;
	var delayIncrement = 0.1;
	if(args.length > 4 && args[4] != null){delayIncrement = args[4];};
	for(count in 0...amount){ //ha, that rhymes
		randstat = rand(statuses);
		inflict(randstat[0], 1);
		if(playsound){
			sfx(randstat[1], delay);
			delay+=delayIncrement;
		}
		returnlist.push(randstat[0]);
	}	
}

return returnlist;