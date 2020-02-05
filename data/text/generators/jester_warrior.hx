usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var poison = chance(50);
trace(poison);

var warriorshops = ["Broadsword", "Iron Shield", "Buckler", "Snake Eye Charm", "Midnight Charm", "Healing Crystal", "Claw", "Snowball", "Boomerang", "Tazer", "First Aid Kit"];

warriorshops = warriorshops.concat( ["Zweihander", "Halberd", "Chakram", "Paintbrush", "Flail", "Iron Fist", "Natural Charm", "Loaded Dice", "Blooplicate",  "Spiked Sword","Shield Toss","Chronoblade","Saxophone","Diamond Wall","Explosive Shield","Molten Staff","Iron Swan","Vine Whip"]); //modded items

shuffle(warriorshops);

var strangeshop = ["Spatula", "Lightning Rod", "Shriek", "Power Through", "drowS", "Budge", "Metallicize", "Divine Blade"];
strangeshop = shuffle(strangeshop);

//Floor 1:
var temp = rand([[rand(["Mace","Pavise"]),rand(["Boopin' Stick","Natural Charm","Snake Eye Charm"])],["Iron Fist",rand(["Loaded Dice","Thump"])]]);


var awesomelist = ["Whip", "Hammer", "Nine Iron","Shovel"]; 

if(poison){
	awesomelist.push("Claw");
	awesomelist.push("Toxic Ooze");
	awesomelist.push("Talons");
}else{
	awesomelist.push("Staff");
	awesomelist.push("Battle Axe");
	awesomelist.push("Stun Blast");
};

awesomelist = shuffle(awesomelist);

items = [temp[1]];
gooditems = [temp[0]];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 2:
items = [pick(["Bump","Promote"])];
gooditems = [pick(["Nudge","Demote"])];

var newstuff = shuffle(["Mallet","Trowel","Cat O' Six Tails","Frosted Dirk","Healing Shiv","Venomous Goop"]);


otherstuff = [shop([warriorshops.pop(), "Health", newstuff.pop()] , [2,1,2])];
goodotherstuff = [shop([newstuff.pop(), warriorshops.pop(), warriorshops.pop()],[1,2,3])];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 3:
items = [];

if(poison){
	items.push(pick(["Blight","Detonator"]));
	items.push("Poison Slingshot");
}else{
	items.push(rand(["Six Shooter", "Chocolate Cookie", "Finisher"]));
	items.push(warriorshops.pop());
}

warriorshops = warriorshops.concat(newstuff); //add the rest of the new items to Warrior's loot pool
gooditems = [];

otherstuff = [health()];

goodotherstuff = [
  shop([warriorshops.pop(), warriorshops.pop(), warriorshops.pop()] , [1,2,3]),
  shop(["Upgrade", warriorshops.pop(), "Delete"] , [2,1,2])

];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [];
gooditems = [awesomelist.pop(),awesomelist.pop()];

otherstuff = [health()];
goodotherstuff = [
  trade(["Sword"], [newstuff.pop()]),
  shop([warriorshops.pop(), "Health", warriorshops.pop()], [2, 3, 2]),
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [];
items.push(pick(["Counter Spell", "Shammer", "Chocolate Cookie", "Toxic Ooze", "Custard Cream", "Doppliduplicateinate"]));
gooditems = [];

otherstuff = [health(), health()];
goodotherstuff = [
  shop([strangeshop.pop(), strangeshop.pop() strangeshop.pop()], [2, 2, 2]),
  shop(["Health", "Upgrade", "Health"], [2, 2, 2])
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
		