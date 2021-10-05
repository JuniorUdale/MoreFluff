//smalleq.hx
//Creates a small equipment and fires it.
//Used for... visual effects? kinda?
//Necessarily needs a callback to the original equipment to double check if it's been cursed

//Arguments:
/* 
 * e:Equipment. The equipment firing the small equipments. If this is null, fire them normally. If not, then it's possible that this equipment may have been cursed. If so, the small equipments aren't fired.
 * x:Float. The x-coordinate to create it at.
 * y:Float. The y-coordinate to create it at.
 * script:String. The script to execute.
 * delay:Float. The delay before activating it. Defaults to 0.
 * col:String. The equipment colour. Defaults to gray.
 * desc:String. The description of the equipment (used for animations). Defaults to blank.
 * name:String. The name of the small equipment. Defaults to nothing.
 * dir:String. The name of the small equipment. Defaults to nothing.
 */
 
if(args.length == 0){
	trace("Error: no arguments supplied.");
}if(args.length <= 1){
	trace("Error: no equipment supplied. (can be null)");
}if(args.length <= 2){
	trace("Error: no y-coord supplied.");
}if(args.length <= 3){
	trace("Error: no script supplied.");
	return;
}if(args.length <= 4){
	args.push(0);
}if(args.length <= 5){
	args.push("GRAY");
}if(args.length <= 6){
	args.push("");
}if(args.length <= 7){
	args.push("");
}if(args.length <= 8){
	args.push("");
}

var eq     = args[0];
var x      = args[1];
var y      = args[2];
var script = args[3];
var delay  = args[4];
var col    = args[5];
var desc   = args[6];
var name   = args[7];
var dir    = args[8];

if(eq != null){
	trace(Rules.curseodds); //traces the curse odds!
	
	//If the equipment gets cursed, then there's no way to check for that.
	//So... handle all the cursey stuff yourself!
	var curse_eq = false;
	var alt_curse = false;
	if(self.hasstatus(CURSE)){ //If you've got curse, then check for cursey stuff
		curse_eq = chance(Rules.curseodds);
		if(eq.hastag("curseavoid")){ //Check if it avoids...
			curse_eq = false;
		}
		if(eq.hastag("curseattract")){ //...but also if it attracts. 
			curse_eq = true;
		}
		//Note that a curseavoid + curseattract equipment WILL be cursed if you've got cursed.
		//Weird, but that's how the game does it!
		
		var alt_curse = false;
		if(Rules.alternatestatus.indexOf("all") != -1){ //If everything's alternate, then curse is PU too
			alt_curse = true;
		}else if(Rules.alternatestatus.indexOf("curse") != -1){
			alt_curse = true;
		}
		trace(alt_curse);
	}
	
	if(curse_eq){ //If it's cursed
		self.decrementstatus(CURSE,true); //nix one curse frometh thineself
		if(alt_curse){ //Fire the equipment AT YOU!
			var blank = new elements.Equipment("mf blank equipment");
			self.equipment.push(blank);

			blank.temporary_thisturnonly = true;
			blank.show = true;
			blank.width = 400;
			blank.height= 400;

			blank.x = x;
			blank.y = y;

			blank.script = script;
			blank.displayname = name;
			blank.changecolour(col);
			blank.fulldescription = desc;

			blank.animate("flashandshake");
			trace("cursed!");
			sfx("_curse");
			blank.doequipmentaction(target,self,self.isplayer ? 0 : 1,[],delay,true,true);
		}else{ //Curse it manually
			eq.usesleft = 0;
			eq.animate(CURSE);
			sfx("_curse");
		}
	}else{
		var blank = new elements.Equipment("mf blank equipment");
		self.equipment.push(blank);

		blank.temporary_thisturnonly = true;
		blank.show = true;
		blank.width = 400;
		blank.height= 400;

		blank.x = x;
		blank.y = y;

		blank.script = script;
		blank.displayname = name;
		blank.changecolour(col);
		blank.fulldescription = desc;

		blank.animate("flashandshake");
		trace("not cursed!");
		blank.doequipmentaction(self,target,self.isplayer ? 1 : 0,[],delay,true,true);
	}
};













