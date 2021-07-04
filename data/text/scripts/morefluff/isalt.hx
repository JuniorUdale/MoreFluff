//isalt.hx
//is alt, not iSalt, the new overpriced Apple condiment
//Takes a status and returns whether or not it's alternate or not (if PU rules are active for it)

//Arguments:
/*
 * status:String. The status to check. If left blank, returns a list of all alternate status effects (or [all] if all are PU)
 */

if(args.length == 0){
	return Rules.alternatestatus;
};

//status supplied, check it

if(Rules.alternatestatus.indexOf("all") != -1){ //all are alt, return true
	return true;
};

var status = args[0];
return Rules.alternatestatus.indexOf(status) != -1;
//if it's not equal to -1 then it's found so is alt