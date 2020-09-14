usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var commonlist_basic = shuffle(["Regen", "Dodge Roll", "Cache Stash", "Trishula", "Tomahawk", "Hand Lens","Segfault","Draining Crystal","Metal Slam","Spearslinger","Reverberate","Reinforce"]);
var commonlist_advanced = shuffle(["Juggling Ball", "Recharge", "Doppeldice", "Short Circuit", "Cable Tie", "Promote", "Superbolt", "Scraps","Antifreeze",  "Chain Whip", "Reboot","Ornamental Shield","Minigun","One With Everything","Vine Whip","Petal to the Metal"]);

items = [commonlist_basic.pop()];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:

commonlist_basic.push("Bumpblade");
commonlist_basic.push("Nudge");
commonlist_basic.push("Mechanical Arm");
commonlist_basic.push("Nudgeknife");
commonlist_basic.push("Nitro Bump");
commonlist_basic.push("Captured Flag");
commonlist_basic.push("Shieldsplosion");
shuffle(commonlist_basic);

commonlist_advanced.push("Ray Gun");
commonlist_advanced.push("Forcefield");
commonlist_advanced.push("Cheat Code");
commonlist_advanced.push("Medigun");
commonlist_advanced.push("Lockdown");
commonlist_advanced.push("Floppy Disk");
commonlist_advanced.push("Convergence");
shuffle(commonlist_advanced);

items = [];

gooditems = [commonlist_advanced.pop()];
otherstuff = [
	health(),
	shop([commonlist_basic.pop(), "health", commonlist_advanced.pop()],[2,2,3])
];
goodotherstuff = [
  shop([commonlist_advanced.pop(), commonlist_basic.pop(), commonlist_advanced.pop()],[3,2,3])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:
commonlist_basic.push("Fixed Payout");
commonlist_basic.push("Spirit Level");
commonlist_basic.push("Coolant Shooter");
commonlist_basic.push("Pliers");
commonlist_basic.push("Custard Cream");
commonlist_basic.push("Superconductor");
commonlist_basic.push("Vortex");
commonlist_basic.push("Freegen");
shuffle(commonlist_basic);

commonlist_advanced.push("Counter Spell");
commonlist_advanced.push("Chocolate Cookie");
commonlist_advanced.push("Metallicize");
commonlist_advanced.push("Electroplating");
commonlist_advanced.push("Overheat");
commonlist_advanced.push("Underclock");
commonlist_advanced.push("Mass Counterspell");
commonlist_advanced.push("First Sit");
shuffle(commonlist_advanced);

items = [];
gooditems = [commonlist_basic.pop()];

otherstuff = [
  shop([commonlist_basic.pop(), "health", commonlist_advanced.pop()],[2,2,3]),
  health()
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
	shop([commonlist_basic.pop(), "health", commonlist_advanced.pop()],[2,2,3]),
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
items = [pick(["Tribute", "Multiplicate", "Turtle", "Doppliduplicateinate"])];
gooditems = [];

otherstuff = [
	shop([commonlist_basic.pop(), "health", commonlist_basic.pop()],[2,3,2]),
	health()
];
goodotherstuff = [
  shop([commonlist_advanced.pop(), "health", commonlist_advanced.pop()],[3,2,3]), 
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