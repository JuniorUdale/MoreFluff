//delayscript.hx
//Delays the execution of a script passed to this.

//Arguments:
/*
 * script:String. The script to execute. Make sure to escape any ~s or "s!
 * delay:Float. The time (in seconds) to delay execution by.
 */
 
if(args.length < 2){
	if(args.length == 0){
		trace("Error: no script or delay passed.");
	}else{
		trace("Error: no delay passed.");
	}
}

//using an actuator with script injection and a new elements.Skill. the unholy trinity
var tempskill = new elements.Skill("Empty Skill");

if(args[0] != null){
	tempskill.script = args[0];
	if(args[1] != null){
		var tw = new motion.actuators.SimpleActuator(null|delay);
		tw._repeat = 1;
		tw.onComplete(tempskill.execute|[self|target]);
		tw.move();
		tempskill.remove();
	}else{
		trace("Error: no delay passed.");
	}
}else{
	trace("Error: no script passed.");
}

