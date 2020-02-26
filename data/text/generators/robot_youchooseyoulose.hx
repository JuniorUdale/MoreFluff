usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var commonlist_basic = shuffle(["Regen", "Cache Stash", "Buckler", "Spare 4", "Plasma Cannon", "Trishula", "Tomahawk", "Hand Lens","Segfault"]);
var commonlist_advanced = shuffle(["Recharge", "Doppeldice", "Short Circuit", "Cable Tie", "Superbolt", "Scraps","Antifreeze", "Pea Shooter", "Chain Whip","Ornamental Shield","Minigun","One With Everything","Vine Whip"]);

items = [commonlist_basic.pop()];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:

commonlist_basic.push("Locklance");
commonlist_basic.push("Flame Spell");
commonlist_basic.push("Mechanical Arm");
commonlist_basic.push("Superconductor");
commonlist_basic.push("Vortex");
shuffle(commonlist_basic);

commonlist_advanced.push("Ray Gun");
commonlist_advanced.push("Forcefield");
commonlist_advanced.push("Backstab");
commonlist_advanced.push("Mass Counterspell");
commonlist_advanced.push("Nitro Bump");
shuffle(commonlist_advanced);

items = [];

gooditems = [commonlist_advanced.pop()];
otherstuff = [
	health(),
	shop([commonlist_basic.pop(), "health", commonlist_advanced.pop()],[1,1,2])
];
goodotherstuff = [
  shop([commonlist_advanced.pop(), commonlist_basic.pop(), commonlist_advanced.pop()],[2,1,2])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:
commonlist_basic.push("Percussive Maintenance");
commonlist_basic.push("Electroplating");
commonlist_basic.push("Spatula");
commonlist_basic.push("Custard Cream");
shuffle(commonlist_basic);

commonlist_advanced.push("Redundant Coolant");
commonlist_advanced.push("Chocolate Cookie");
commonlist_advanced.push("Metallicize");
commonlist_advanced.push("Meteor");
commonlist_advanced.push("Lament");
shuffle(commonlist_advanced);

items = [];
gooditems = [commonlist_basic.pop()];

otherstuff = [
  shop([commonlist_basic.pop(), "health", commonlist_advanced.pop()],[1,1,2]),
  health()
];
goodotherstuff = [
  shop([commonlist_basic.pop(), commonlist_advanced.pop(), commonlist_basic.pop()],[1,2,1]), 
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
	shop([commonlist_basic.pop(), "health", commonlist_advanced.pop()],[1,1,2]),
	health()
];
goodotherstuff = [
  trade(["Heat Sink", "Increment", "Ray Gun", "Pea Shooter"], ["Rake Pick", "Spatula", "Juggling Ball", "Headbutt"])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [pick(["Tribute", "Multiplicate", "Turtle",  "Shammer"])];
gooditems = [];

otherstuff = [
	shop([commonlist_basic.pop(), "health", commonlist_basic.pop()],[1,2,1]),
	health()
];
goodotherstuff = [
  shop([commonlist_advanced.pop(), "health", commonlist_advanced.pop()],[2,1,2]), 
  upgrade()
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