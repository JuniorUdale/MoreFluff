//smalleq.hx
//Creates a small equipment and fires it.
//Used for... visual effects? kinda?

//Arguments:
/* 
 * x:Float. The x-coordinate to create it at.
 * y:Float. The y-coordinate to create it at.
 * script:String. The script to execute.
 * delay:Float. The delay before activating it. Defaults to 0.
 * name:String. The name of the small equipment. Defaults to nothing.
 * col:String. The equipment colour. Defaults to yellow.
 * 
 */

var reqAmount = 0;
if(self.status.length > 0){
	for(st in self.status){
		if(st.type == "reequipnext"){
			reqAmount = st.value;
			st.value = 0;
		};
		if(st.type == "recycle"){
			st.value = 0;
		}
	}
}
 
switch(args.length){
	case(0): trace("Error: no arguments supplied.");
	case(1): trace("Error: no y-coord supplied.");
	case(2): trace("Error: no script supplied.");
	case(3): args.push(0);
	case(4): args.push("");
	case(5): args.push(4);
	
}

var x      = args[0];
var y      = args[1];
var script = args[2];
var delay  = args[3];
var name   = args[4];
var col    = args[5];

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
blank.changecolour("col");

blank.animate("flashandshake");

if(self.status.length > 0){
	for(st in self.status){
		if(st.type == "reequipnext"){
			st.value = reqAmount;
		};
		if(st.type == "recycle"){
			st.value = 1;
		}
	}
};

return(blank);













