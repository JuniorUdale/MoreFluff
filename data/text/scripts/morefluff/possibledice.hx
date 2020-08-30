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

for(slot in eq.slots){
	if (slot == "NORMAL") {
		if(type == "all"){returnlist.push([1,2,3,4,5,6]);};
		if(type == "min"){returnlist.push(1);};
		if(type == "max"){returnlist.push(6);};
	};
	if (slot == "EVEN") {
		if(type == "all"){returnlist.push([2,4,6]);};
		if(type == "min"){returnlist.push(2);};
		if(type == "max"){returnlist.push(6);};
	};
	if (slot == "ODD") {
		if(type == "all"){returnlist.push([1,3,5]);};
		if(type == "min"){returnlist.push(1);};
		if(type == "max"){returnlist.push(5);};
	};
	for (x in 1...7) {
		if (slot == "REQUIRE"+x) {
			if(type == "all"){returnlist.push([x]);};
			if(type == "min"){returnlist.push(x);};
			if(type == "max"){returnlist.push(x);};
		};
		if (slot == "FREE"+x || slot == "SPARE"+x) {
			//Can't slot anything into FREE/SPARE slots
			if(type == "all"){returnlist.push([null]);};
			if(type == "min"){returnlist.push(null);};
			if(type == "max"){returnlist.push(null);};
		};
		if (slot == "MIN"+x) {
			if(type == "all"){
				var temp = [];
				for (y in x + 1...7) {
					temp.push(y);
				};
				returnlist.push(temp);
			};
			if(type == "min"){returnlist.push(x);};
			if(type == "max"){returnlist.push(6);};
		};
		if (slot == "MAX"+x) {
			if(type == "all"){
				var temp = [];
				for (y in 1...x + 1) {
					temp.push(y);
				};
				returnlist.push(temp);
			};
			if(type == "min"){returnlist.push(1);};
			if(type == "max"){returnlist.push(x);};
		};
	};
	var ranges = [
		[2, 3],[2, 4],[2, 5],[3, 4],[3, 5],[4, 5]
	];
	for (r in ranges) {
		if (slot == "RANGE"+r[0] + r[1]) {
			if(type == "all"){
				var temp = [];
				for (y in r[0]...r[1] + 1) {
					temp.push(y);
				};
				returnlist.push(temp);
			};
			if(type == "min"){returnlist.push(r[0]);};
			if(type == "max"){returnlist.push(r[1]);};
		}
	};
}