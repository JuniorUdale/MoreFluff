//timebubble.hx
//Kludgey jinx status effect script

//Arguments:
/*
 * damage:Int. The damage..
 * turns:Int. The number of turns to delay the damage by.
 */
 
//Return values:
/*
 * status:Int. Returns true upon successful completion.
 */

if(args.length == 0){trace("Error: pass the damage amount."); return false;};
if(args.length == 1){trace("Error: pass the number of turns."); return false ;};

var damage = args[0];
var turns  = args[1];

jinx("Time Bubble","take [sword]%VAR% damage","Take [sword]%VAR% damage","attack(%VAR%); sfxdamage(%VAR%|null)",self,self,turns,damage); 

return true;















