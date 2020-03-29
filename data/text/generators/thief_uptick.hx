usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var commonlist1 = shuffle(["Bandage", "Snake Eye Charm", "Finisher", "Regen", "Nail Gun", "Origami", "Venom Catapult", "Poison Thread", "Hand Lens", pick(["Counterfeit","Forgery","Snapshot","Photocopy","Booplicate","Duplicate"]), "Execute", "Necrosis", "Grandfather Clock", "Minigun", "Dice Magnet", "Caps Lock", "Headcrack","Draining Crystal","Diabolo","Quarantine","Taunting Sword","Toxins","Coalescence","Burner Phone","Prescience","Copyrat"]);

var countdowns = shuffle(["Scorch","Gust","Medigun","Metalmorph","Shrapnel","Paintbrush","Pee Shooter","Pea Shooter", "Chain Dagger","Plague Stave","Asklepios","Saxophone","Karambit","Sewage Pipe","Watermelon Trebuchet","Gluestick","Caduceus","Terminal Velocity","Sweep the Legs","Entangle"]);


var items = [];	
items = [pick(["Snake Eye Charm", "Paintbrush","Stun Blast","Claw","Talons"])];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:

items = [commonlist1.pop()];
gooditems = [];

otherstuff = [
	shop([countdowns.pop(), pick(["Counterfeit","Forgery","Snapshot","Photocopy","Booplicate","Duplicate"]), countdowns.pop()] , [2,2,2]),
	health()
];

commonlist1 = shuffle(commonlist1.concat(countdowns)); //this is just to get 2 countdowns in the shop first lol

var shopstuff = pick([["Photocopy","Snapshot"],["Forgery","Duplicate"],["Booplicate","Gooplicate"]]);

goodotherstuff = [
	health()	
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:


commonlist1.pop(); commonlist1.pop(); commonlist1.pop(); commonlist1.pop(); commonlist1.pop(); commonlist1.pop(); commonlist1.pop(); //get it down to 7 items to make these show up more often
commonlist1 = commonlist1.concat(["Poison Needle", "Crowbar", "Magic Spear", "Teleport Spell", "Antifreeze", "Scraps", "Metalmorph", "Envenomate","Bottled Dragonbreath","Fruit Shooter"]);

var rarelist1 = ["Dodge", "Hookshot", "Midnight Charm","Natural Charm", "Gooplicate","Wing Bash"];
commonlist1 = shuffle(commonlist1);


rarelist1 = shuffle(rarelist1);
var armor = chance(25);
if(armor){
	items = ["Leather Armor"];
}else{
	items = [commonlist1.pop()];
};
gooditems = [];

otherstuff = [
  health(),
  health()
];

var spells=shuffle(["Teleport Spell","Thunder Spell","Spiky Spell","Armour Spell","Acid Spell"]);

var shopstuff = pick([
	["Snake Eye Charm","Ekans Charm"],
	["Natural Charm","Unnatural Charm"],
	[spells.pop(),spells.pop()],
	[commonlist1.pop(),commonlist1.pop()]
]);
shopstuff = shop([shopstuff[0], rarelist1.pop(), shopstuff[1]],[2,3,2]);

goodotherstuff = [
  shopstuff,
  upgrade()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:

commonlist1 = commonlist1.concat(["Snippers", "Catastrophe", "Budge", "Stun Blast","Nudgeknife","Turtle"]);

commonlist1 = shuffle(commonlist1);
items = [commonlist1.pop()];
gooditems = [];

otherstuff = [
	health(),
	shop([rarelist1.pop(), "health", rarelist1.pop()],[2,2,2]),
];

var armortrade;
if(armor){
	armortrade = pick([
	trade(["Dagger"],["Boomstick","Shotgun","Peppergun","Power Creeper"]),
	trade(["Lockpick"],["Snippers","Locklance","Origami"]),
	trade(["Leather Armor"], ["Chain Mail", "Iron Armor", "Mirror Coating"])
]);
}else{
	armortrade = pick([
	trade(["Dagger"],["Boomstick","Shotgun","Peppergun","Power Creeper"]),
	trade(["Lockpick"],["Snippers","Locklance","Origami"])
]);
};

goodotherstuff = [
  shop([rarelist1.pop(), commonlist1.pop(), rarelist1.pop()],[2,1,2]),
  armortrade  
];

addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:

items = [commonlist1.pop()];
gooditems = [];
otherstuff = [
	health(),
	trade(["Kunai","Hall of Mirrors","Crackleslash"],["Clerical Error", "Poisoned Axe", "Turtle"])
];

goodotherstuff = [
	shop([commonlist1.pop(),"upgrade",pick(["Stun Blast","Decay","Pry Bar","Cauterize"])],[2,3,2]),
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
		