/* Script for the item "Archmage's Rune". */

var total = args[0];
var coords = args[1];
var itcount = 0;
if(args.length > 2){itcount=args[2];};

trace("TOTAL: "+total);
trace("ITERATION COUNT: "+itcount);

var newitem;

function blacklistedscript(item){
	return item.script.length > 50 || (item.script.indexOf("endturn") > -1 || item.scriptbeforeexecute.indexOf("endturn") > -1 ||
	item.script.indexOf("boomerang") > -1 || item.scriptbeforeexecute.indexOf("boomerang") > -1 ||
	item.script.indexOf("actuator") > -1 || item.scriptbeforeexecute.indexOf("actuator") > -1 ||
	item.script.indexOf("usesleft") > -1 || item.scriptbeforeexecute.indexOf("usesleft") > -1 ||
	item.script.indexOf("fury") > -1 || item.scriptbeforeexecute.indexOf("fury") > -1);
}

//Specialcasing some smaller sizes speeds up searching
if(total <= 0){ //you're done!
	return;
}else if(total == 1){
	newitem = new elements.Equipment("Junk Spell"); //speeds up things
	//Could specialcase 2 and 3, but there's legitimate cases for those
}else if(total == 2){
	newitem = new elements.Equipment(rand(["Burning Stick","Junk Spell"]));
}else{
	var l = getequipmentlist(null,[],["witchonly","robotonly","inventoronly","thiefonly","warrioronly","jesteronly","excludefromrandomlists","alternateversion"]);
	
	//Now... we need to go find countdowns!
	newitem = new elements.Equipment(rand(l));
	while((itcount < 1 && newitem.countdown == total) || newitem.countdown == 0 || newitem.countdown == null || newitem.countdown > total || blacklistedscript(newitem)){
		newitem = new elements.Equipment(rand(l));
	}
}
trace("NEW ITEM: "+newitem.name);
trace("COUNTDOWN: "+newitem.countdown);

total -= newitem.countdown;
trace("NEW TOTAL:"+total);

if(total < 0){
	trace("Oh no! What a bad roll! Something's gone horribly, horribly wrong.");
	trace("The culprit equipment is "+newitem+" with a countdown of "+newitem.countdown+" which made total "+total+".");
	trace("This is obviously not good! Returning prematurely.");
	return;
}

self.equipment.push(newitem); //even if it's only going to be there for a few seconds!

//if(newitem.remainingcountdown > 6){newitem.remainingcountdown = 6;};
newitem.reuseable = 0;
newitem.usesleft = 1;
newitem.temporary_thisturnonly = true;

newitem.x = coords[0];
newitem.y = coords[1];
if(newitem.size == 2){
	newitem.y-=144;
}

newitem.addtag("ignorereuse");

newitem.script = "runscript(\"morefluff/items/archmage\", ["+total+","+coords+","+(itcount+1)+"]);" + newitem.script;

var count = newitem.remainingcountdown;
while(count > 6){
	var b = new elements.Dice();
	b.basevalue = 6;
	b.owner = self;
	newitem.assigndice(b);
	count -= 6;
}
var b = new elements.Dice();
b.basevalue = count;
b.owner = self;
newitem.assigndice(b);
newitem.animate("flashandshake");











