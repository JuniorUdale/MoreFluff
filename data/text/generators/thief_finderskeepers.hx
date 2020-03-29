usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var commonlist1 = shuffle(["Bandage", "Snake Eye Charm", "Finisher", "Regen", "Nail Gun", "Medigun", "Origami", "Pee Shooter", "Venom Catapult","Scorch","Gust", "Poison Thread", "Hand Lens", "Poisoned Axe","Rend", "Shichishito", "Execute", "Necrosis", "Grandfather Clock", "Minigun", "Dice Magnet", "Caps Lock", "Headcrack","Draining Crystal","Diabolo","Quarantine","Taunting Sword","Asklepios","Saxophone","Karambit""Toxins","Coalescence","Burner Phone","Prescience","Copyrat","Sweep the Legs","Entangle"]);

var items = [];	

commonlist1.push(pick(["Snake Eye Charm", "Paintbrush","Stun Blast"]));
commonlist1.push(pick(["Claw","Talons"]));

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:

items = [];
gooditems = [];

otherstuff = [
	shop([commonlist1.pop(), pick(["Counterfeit","Forgery","Snapshot","Photocopy","Booplicate","Duplicate"]), commonlist1.pop()] , [2,2,2]),
	health()
];

goodotherstuff = [
	health()	
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:

commonlist1 = commonlist1.concat(["First Aid Kit", "Staff", "Poison Slingshot", "Flak Cannon", "Tickly Nose", "Leather Armor", "Antifreeze", "Scraps", "Metalmorph", "Envenomate","Bottled Dragonbreath","Fruit Shooter"]);
var rarelist1 = ["Dodge", "Hookshot", "Midnight Charm","Natural Charm", "Gooplicate","Wing Bash"];
commonlist1 = shuffle(commonlist1);


rarelist1 = shuffle(rarelist1);
items = [];
gooditems = [];

otherstuff = [
  health(),
  health()
];

var shopstuff = pick([["Snake Eye Charm","Ekans Charm"],["Natural Charm","Unnatural Charm"],[commonlist1.pop(),commonlist1.pop()]]);
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

commonlist1 = commonlist1.concat(["Snippers", "Catastrophe", "Pry Bar", "Budge", "Stun Blast", "Backstab", "Nudgeknife", "Turtle"]);

commonlist1 = shuffle(commonlist1);
items = [];
gooditems = [];

otherstuff = [
	health(),
	upgrade()
];

var armortrade = pick([trade(["Dagger"],["Boomstick","Xiphos","Peppergun","Power Creeper"]),trade(["Lockpick"],["Snippers","Locklance","Origami"])]);
goodotherstuff = [
  shop([rarelist1.pop(), commonlist1.pop(), rarelist1.pop()],[2,1,2]),
  armortrade  
];

addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:

items = [];
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
		