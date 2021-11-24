/* Script for the item "Archmage's Rune". */

var total = args[0];
var coords = args[1];

var newitem;

//Specialcasing some smaller sizes speeds up searching
if(total <= 0){ //Uh, something's gone wrong
	trace("Something's gone wrong! Oh no!");
	trace("Luckily, Jackeea's amazing foresight in doing the very minimum of error checking has saved the day once again.");
	trace("Total is "+total+", for reference");
}else if(total == 0){
	//If you're at 0 - bingo bango boingo you're done!
	return;
}else if(total == 1){
	newitem = new elements.Equipment("Junk Spell");
}else if(total == 2){
	newitem = new elements.Equipment("Burning Stick");
}else if(total == 3){
	newitem = new elements.Equipment("Magic Armor");
}else{
	var l = getequipmentlist(null,["small"],["witchonly","robotonly","inventoronly","thiefonly","warrioronly","jesteronly","excludefromrandomlists","alternateversion"]);
	
	//Now... we need to go find countdowns!
	newitem = new elements.Equipment(rand(l));
	while(newitem.countdown == 0 || newitem.countdown == null || newitem.countdown > total){
		newitem = new elements.Equipment(rand(l));
	}
}

total -= newitem.countdown;
if(total < 0){
	trace("Oh no! What a bad roll! Something's gone horribly, horribly wrong.");
	trace("The culprit equipment is "+newitem+" with a countdown of "+newitem.countdown+" which made total "+total+".");
	trace("This is obviously not good! Returning prematurely.");
	return;
}

self.equipment.push(newitem); //even if it's only going to be there for a few seconds!

if(newitem.countdown > 6){newitem.countdown = 6;};
newitem.reuseable = 0;
newitem.usesleft = 1;
newitem.temporary_thisturnonly = true;

newitem.x = coords.x;
newitem.y = coords.y

newitem.addtag("ignorereuse");

var b = new elements.Dice();
b.basevalue = newitem.countdown;
b.owner = self;
newitem.assigndice(b);

//is this one even needed?
//newitem.doequipmentaction(self|target|(self.isplayer ? 1 : -1)|[]|0|true);

//wrap the recursion in an actuator!
var sc = "if(total > 0){ runscript(\"morefluff/items/archmage\", [total,coords]); }";
var s = new elements.Skill("mf_blankskill");
s.script = sc;
var tw = new motion.actuators.SimpleActuator(null|1|null);
tw._repeat = 1;
tw.onComplete(s.execute,[self,target]);
tw.move();
s.remove();




















































