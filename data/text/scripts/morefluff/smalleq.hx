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
}

var eq     = args[0];
var x      = args[1];
var y      = args[2];
var script = args[3];
var delay  = args[4];
var col    = args[5];
var desc   = args[6];
var name   = args[7];

if(eq != null){
	var tw = new motion.actuators.SimpleActuator(null,2);
	tw._repeat = 2;
	tw.onComplete(trace|["hello, world!"]);
	tw.move();
	
	
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
	blank.doequipmentaction(self,target,self.isplayer ? 1 : 0,[],delay,true,true);
};













