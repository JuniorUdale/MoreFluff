var database = loaddata("morefluff/generators/main_generator.csv");

var pooltargets = ["warriorshops","strangeshop","awesomelist","floor2gooditem","floor3item","floor5item","vampireitem"];
var pools = [[],[],[],[],[],[],[]];

for(item in database){
	if(item.warrior == "YES" && item.vanilla == "YES"){
		var tags = item.tags.split(",");
		var generators = item.generators.split(",");
		var i = 0;
		while(i < generators.length){
			if(generators[i] == "warrior_normal"){
				var target = pooltargets.indexOf(tags[i]);
				if(target != -1){
					pools[target].push(item.name);
				}
			}
			i+=1;
		}
	}
}

return pools;