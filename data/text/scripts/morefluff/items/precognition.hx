/* Script for the item "Precognition". */



var effects=["inflict(SHIELD,4); sfx(\"_shield\");","inflict(REDUCE); sfx(\"_shield\");","inflict(FURY); sfx(\"_fury\");","attack(-4); sfx(\"_heal\");","inflict(THORNS); sfx(\"_thorns\");"]; 
var descs=["Receive [shield]4 shield","Receive [reduce]1 reduce","Receive [fury] Fury","Recover [heal]4 health","Receive [thorns]1 thorns"];
var r = rand([0,1,2,3,4]);
jinx("Precognition",descs[r].toLowerCase(),descs[r],effects[r],self,self,1,d);