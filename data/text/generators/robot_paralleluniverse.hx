usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var commonlist_basic = shuffle([rand(["Iron Armor","Leather Armor","Magic Armor"]), "Saw Wave", "Safe Bet"]);
var commonlist_advanced = shuffle(["Slingshot", "Vise Grip", (chance(30)?"Starspear":"Sword Hilt"), "Ungeradedice", "Four Leaf Clover"]);

commonlist_basic = commonlist_basic.concat(["Tin Snips","Critical Hit", "Electric Fence", "Meteor Hammer", "Auto Turret","Backup Drive","Overconfidence","Rosary","Maul","Rift Stabilizer","Starfall","Speedometer"]); //modded stuff
commonlist_advanced = commonlist_advanced.concat(["Belt Sander","Fulcrum Blade", "Cleaver", "Heat Vent", "Mechanical Charm","Star Shooter","Virtual Machine", "CPU Shooter","Amplify","Duplihate","Plug Socket","Electrophoresis","Fruit Loot","Adaptaxe","Regedit"]); //modded stuff

shuffle(commonlist_basic);
shuffle(commonlist_advanced);

items = [];
gooditems = [commonlist_basic.pop()];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
commonlist_basic.push("Lucky Star");
commonlist_basic.push("Mechanical Leg");
commonlist_basic.push("Bayonet");
commonlist_basic.push("Junkblaster");
commonlist_basic.push("Intended Gameplay");
shuffle(commonlist_basic);

commonlist_advanced.push("Elastic Heart");
commonlist_advanced.push("Half Moon Charm");
commonlist_advanced.push("Crystal Skull");
commonlist_advanced.push("Helium Balloon");
commonlist_advanced.push("Boost Panel");
shuffle(commonlist_advanced);

var temp = shuffle(rand([["Virus","Memory Leak"],["Overclock","Garbage Collection"]]));
items = [];
gooditems = [temp.pop()];
commonlist_advanced = shuffle(commonlist_advanced.concat(temp));
otherstuff = [
	shop([commonlist_basic.pop(),commonlist_basic.pop(),commonlist_basic.pop()],[2,2,2]),
	health()
];

goodotherstuff = [
  shop([commonlist_advanced.pop(), commonlist_basic.pop(), commonlist_advanced.pop()],[3,2,3])
];


addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:
commonlist_basic.push("Free Spin");
commonlist_basic.push("Spatulasword");
commonlist_basic.push("Kite Shield");
commonlist_basic.push("Hairpin");
shuffle(commonlist_basic);

commonlist_advanced.push("Parrying Dagger");
commonlist_advanced.push("Dragon's Tooth");
commonlist_advanced.push("Limited Moon");
commonlist_advanced.push("Conformer");
commonlist_advanced.push("Graphics Card");
shuffle(commonlist_advanced);

var shopstuff;
var jackpots = shuffle(["Virtual Memory","Powerfield","Phaser","Marvellous Cheer"]);
var badRNGitems = shuffle(["Death Penalty","Princess Guard", "Premium Heart", "Venus Gospel"]);

if(chance(50)){
	if(chance(66)){
		shopstuff = shop(["Bingo", "health", jackpots.pop()],[2,3,3]);
	}else if(chance(50)){
		shopstuff = shop(["Four Leaf Clover", "health", badRNGitems.pop()],[2,3,3]);
	}else{
		shopstuff = shop([rand(["Ultimeh Weapon","Even Buster Sword"]), "health", commonlist_advanced.pop()],[2,3,3]);
	};
}else{
	shopstuff = shop([commonlist_basic.pop(), "health", commonlist_advanced.pop()],[2,3,3]);
};

commonlist_basic = shuffle(commonlist_basic.concat(jackpots.concat(badRNGitems))); //shove the rest of the unused items into commonlist_basic

items = [commonlist_basic.pop()];
gooditems = [];

otherstuff = [
  health(), 
  shopstuff
];
goodotherstuff = [
  shop([commonlist_basic.pop(), commonlist_advanced.pop(), commonlist_basic.pop()],[2,3,2]), 
  upgrade()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [];
gooditems = [commonlist_advanced.pop()];

otherstuff = [
	health(),
	shop([commonlist_basic.pop(), "health", commonlist_advanced.pop()],[2,2,3]),
];
goodotherstuff = [
	shop(["health", commonlist_advanced.pop(), "upgrade"],[3,3,3])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [];
gooditems = [commonlist_basic.pop()];

otherstuff = [
	shop([commonlist_basic.pop(), "health", commonlist_basic.pop()],[2,3,2]),
	health()
];
goodotherstuff = [
	trade(["Cooling Fan", "Concatenate", "Bucket of Water"], ["Free Spin", "Spatulasword", "Slingshot", "Flaming Sword", "Mechanicalantern","Normality Charm","Glamour"])
];

addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 6:
items = [];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

var lastfloor = addfloor("boss");

if (getfinalboss() == "Drake"){
  items.push("Wooden Stake");
}

lastfloor
  .additems(items, gooditems)
  .setlocation('BOSS')
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();