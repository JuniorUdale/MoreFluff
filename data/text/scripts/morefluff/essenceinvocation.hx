/* Internal script used for the handling of Essence removal */

var essences = ["base","fire","ice","shock","weaken","poison","dark"];
var descs = ["Take [sword]4 damage","Receive [fire]1 burn","Receive [ice]1 freeze","Receive [shock]1 shock","Receive [weaken]1 weaken","Receive [poison]2 poison","Receive a bad status"];
var effs = ["attack(4); sfxdamage(null,3);","inflict(FIRE); sfx(\"_fire\");","inflict(ICE); sfx(\"_ice\");","inflict(SHOCK); sfx(\"_shock\");","inflict(WEAKEN); sfx(\"_weaken\");","inflict(POISON,2); sfx(\"_poison\");","var stat = rand([\"curse\",\"lock\",\"stun\"]); if(stat == \"curse\"){inflict(CURSE); sfx(\"_curse\");}; if(stat == \"lock\"){inflict(LOCK); sfx(\"_lock\");}; if(stat == \"stun\"){inflict(\"mf_stun\"); sfx(\"_shock\");};"];

var counter = 0;
if(target.status.length > 0){
	var t = target.status.copy();
	for(st in t){
		if (st.type.split("_")[0] == "jinx"){
			st.add(1); 
		};
	};
	for(st in 0...essences.length){
		if(getstatus("essence_"+essences[st]) > 0){
			for(x in 0...getstatus("essence_"+essences[st])){
				jinx("Invocation",descs[st].toLowerCase(),descs[st],removestatusself("essence_"+essences[st]),target,self,1,1);
				counter+=1;
			};
			removestatus("essence_"+essences[st],ALL);
		};
	};
	boostjinxcountdowns(target,1);
};

return counter;