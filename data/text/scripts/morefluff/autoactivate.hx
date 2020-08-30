//autoactivate.hx
//Takes an equipment, and automatically activates it depending on some criteria.

//Arguments:
/* 
 * eq:Equipment. An equipment to activate.
 * fillStyle:String. Either "max", "random", or "min". Defaults to "max".
 * delay:Float. The delay to use in activating the item.
 * ignoreCurse:bool. If true, ignores curse when activating. Defaults to false.
 * 
 */
 
if(args.length == 0){
	trace("Error: No arguments provided. Provide an equipment to automatically activate.");
};