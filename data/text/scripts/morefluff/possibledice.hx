//possibledice.hx
//Takes an equipment and returns all possible dice that fit into it.

//Arguments:
/*
 * eq:String. An equipment.
 * mode:String. Which "way" to output data.
 *   * "all": return ALL values possible; e.g. [[1,2,3],[5,6],[2]] for MAX3|MIN5|REQUIRE2
 *   * "max": return the highest values possible, e.g. [3,6,2] for MAX3|MIN5|REQUIRE2
 *   * "min": return the lowest values possible, e.g. [1,5,2] for MAX3|MIN5|REQUIRE2
 *   * Note, there's no random mode - for that just use "all" then select one at random.
 */
 
//Return values:
/*
 * diceVals:Array<Dynamic>. Output depends on the second argument, "mode".
 */

if(args.length == 0){trace("Error: pass the equipment."); return;};
if(args.length == 1){args.push("all");};

var eq   = args[0];
var type = args[1];

if(type != "all" && type != "min" && type != "max"){trace("Error: Type must be either all, min, max, or just left blank.");};

var returnlist = [];

function checkslot(slotname,mode){
	// Helper function that uses identical syntax to the main function
	if (slotname == "NORMAL") {
		if(mode == "all"){return([1,2,3,4,5,6]);};
		if(mode == "min"){return(1);};
		if(mode == "max"){return(6);};
	};
	if (slotname == "EVEN") {
		if(mode == "all"){return([2,4,6]);};
		if(mode == "min"){return(2);};
		if(mode == "max"){return(6);};
	};
	if (slotname == "ODD") {
		if(mode == "all"){return([1,3,5]);};
		if(mode == "min"){return(1);};
		if(mode == "max"){return(5);};
	};
	for (x in 1...7) {
		if (slotname == "REQUIRE"+x) {
			if(mode == "all"){return([x]);};
			if(mode == "min"){return(x);};
			if(mode == "max"){return(x);};
		};
		if (slotname == "FREE"+x || slotname == "SPARE"+x) {
			//Can't slotname anything into FREE/SPARE slotnames
			if(mode == "all"){return([null]);};
			if(mode == "min"){return(null);};
			if(mode == "max"){return(null);};
		};
		if (slotname == "MIN"+x) {
			if(mode == "all"){
				var temp = [];
				for (y in x + 1...7) {
					temp.push(y);
				};
				returnlist.push(temp);
			};
			if(mode == "min"){return(x);};
			if(mode == "max"){return(6);};
		};
		if (slotname == "MAX"+x) {
			if(mode == "all"){
				var temp = [];
				for (y in 1...x + 1) {
					temp.push(y);
				};
				returnlist.push(temp);
			};
			if(mode == "min"){return(1);};
			if(mode == "max"){return(x);};
		};
	};
	var ranges = [
		[2, 3],[2, 4],[2, 5],[3, 4],[3, 5],[4, 5]
	];
	for (r in ranges) {
		if (slotname == "RANGE"+r[0] + r[1]) {
			if(mode == "all"){
				var temp = [];
				for (y in r[0]...r[1] + 1) {
					temp.push(y);
				};
				return(temp);
			};
			if(mode == "min"){return(r[0]);};
			if(mode == "max"){return(r[1]);};
		}
	};
}


if(eq.needstotal > 0){
	/* Here are some assumptions you CANNOT make:
		* eq has enough slots to satisfy the needstotal (c.eg: NORMAL|NORMAL with NEEDSTOTAL 13)
		* eq has all normal slots
		* eq has all valid slots (should never come into practice but maybe worth checking)
		* with the restrictions eq has, you can fill eq.needstotal (counterex.: ODD|ODD with NEEDSTOTAL 12)
	*/
}else{
	for(slot in eq.getslots()){
		returnlist.push(checkslot(slot,type));
	};
};
return returnlist;














