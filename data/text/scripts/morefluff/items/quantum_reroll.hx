var script = "for(mydice in self.dicepool){	if(mydice.available() && mydice.basevalue != "+args[0]+"){ mydice.animatereroll("+args[0]+"|self.screenposition()|0);};}; sfx(\"_magic\");";
var s = new elements.Skill("mf_blankskill");
s.script = script;
var tw = new motion.actuators.SimpleActuator(null|1);


tw.onComplete(s.execute,[self,target]);
tw.move();