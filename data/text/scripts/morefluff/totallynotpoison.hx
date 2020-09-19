if(args[0] > 0){
	jinx("Totally Not Poison","take [sword]%VAR% damage","Take [sword]%VAR% damage","attack(%VAR%); sfxdamage(target|%VAR%); runscript(\"morefluff/totallynotpoison\",["+(args[0]-1)+"]);",target,self,1,args[0]);
}