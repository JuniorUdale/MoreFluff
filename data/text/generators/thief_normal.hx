usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var commonlist1 = shuffle(["Bandage", "Snake Eye Charm", "Finisher", "Regen", "Nail Gun", "Origami", "Venom Catapult", "Poison Thread", "Hand Lens","Rend", "Shichishito", "Execute", "Necrosis", "Grandfather Clock", "Minigun", "Dice Magnet", "Caps Lock", "Headcrack","Draining Crystal","Diabolo","Quarantine","Taunting Sword"]);

var countdowns = shuffle(["Scorch","Gust","Medigun","Metalmorph","Shrapnel","Paintbrush","Pee Shooter","Pea Shooter","Chain Dagger", "Plague Stave","Asklepios","Saxophone","Karambit","Socket Wrench","Mirror Coating"]);


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

goodotherstuff = [
	health()	
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:


commonlist1 = commonlist1.slice(0,8); //get it down to 8 items to make these show up more
commonlist1 = commonlist1.concat(["First Aid Kit", "Staff", "Poison Slingshot", "Flak Cannon", "Antifreeze", "Scraps", "Metalmorph", "Envenomate","Bottled Dragonbreath","Fruit Shooter"]);

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

var shopstuff = pick([
	["Snake Eye Charm","Ekans Charm"],
	["Natural Charm","Unnatural Charm"],
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

commonlist1 = commonlist1.concat(["Snippers", "Catastrophe", "Budge", "Stun Blast", "Backstab", "Nudgeknife","Turtle"]);

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
		trade(["Dagger"],["Boomstick","Xiphos","Peppergun","Power Creeper"]),
		trade(["Lockpick"],["Snippers","Locklance","Origami"]),
		trade(["Leather Armor"], ["Chain Mail", "Iron Armor", "Mirror Coating"])
	]);
}else{
	armortrade = pick([
		trade(["Dagger"],["Boomstick","Xiphos","Peppergun","Power Creeper"]),
		trade(["Lockpick"],["Snippers","Locklance","Origami"])
	]);
};

goodotherstuff = [
  shop([rarelist1.pop(), commonlist1.pop(), rarelist1.pop()],[2,1,2]),
  armortrade,
  health()
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
	health(),
	trade(["Crowbar","Shatter","Poison Needle"],["Tickly Nose","Clerical Error", "Poisoned Axe"])
];

goodotherstuff = [
	health(),
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
		