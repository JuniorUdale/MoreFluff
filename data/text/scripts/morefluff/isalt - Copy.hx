//nonstackingstatus.hx
//Creates a non-stacking status effect. hooooo oo ooooooooo boy

//Arguments:
/*
 * status:String. The status to check. If left blank, returns a list of all alternate status effects (or [all] if all are PU)
 * 
 * 
 * 
 * 
 */

if(args.length == 0){
	return Rules.alternatestatus;
};

//status supplied, check it

if(Rules.alternatestatus.indexOf("all") != -1){ //all are alt, return true
	return true;
};

var status = args[0];

//if it's not equal to -1, then it was found, so is alternate
//if it IS equal to -1, then it isn't found, so isn't alternate
return Rules.alternatestatus.indexOf(status) != -1
