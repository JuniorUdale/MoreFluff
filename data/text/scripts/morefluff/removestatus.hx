//removestatus.hx
//Removes a status effect. Doesn't crash the game when used in a status effect's script.
//(hopefully)

//Arguments:
/* 
 * s:String. The status effect to remove.
 * amount:Int. The amount of the status effect to remove.
 */
 
if(args.length == 0){
	trace("Error: no status effect supplied.");
}if(args.length <= 1){
	trace("Error: no amount supplied");
	return;
};

var status = args[0];
var amount = args[1];

var tw = new motion.actuators.SimpleActuator(null|0.01);
var s = new elements.Skill("mf_blankskill");
s.script = "removestatusself(\"" + status + "\","+amount+");";
tw.onComplete(s.execute|[self|target]);
tw.move();

trace("completed!");