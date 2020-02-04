usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var poison = chance(50);
trace(poison);

var warriorshops = ["Katana", "Copper Shield", "Parrying Dagger", "Kite Shield", "Thick Skin", "Boxing Gloves", "Last Stand", "Singularity", "Half Moon Charm", "Dramatic Exit", "Hookshot", "Ignite", "Capacitor", "Elastic Heart", "Overblaster", "Soul Stealer","Nanobots", "Pursuit", "Gavel", "Sledgehammer", "Lamppost", "Firey Firesword of Fire", "Frozen Whip","Claymore","Blessed Bat of Bashing","Gunkblade", "Tesla Cannon", "Rodela", "Baseball Bat", "Min Night Charm", "Heavy Gatling", "Snail Bat", "Black Hole","Reaper", "Stock Up", "Starstaff","Maul","Third Eye","Inflation","Flying Venus Trap","Paw Claw","Warcry","Fruit Loot","Burst Laser"];

shuffle(warriorshops);

var strangeshop = ["Candle", "Particle Accelerator", "Flying Skull", "Slingshot", "Fishing Net", "Scissors" "Flourish", "Mitosis", "Sapping Spores", "Ferrosynthesis", "Sunder", "Blood Transfer", "Mirrorblade", "Come On And Slam","Pandemonium", "Swordbroad","Nice Sword"];
strangeshop = shuffle(strangeshop);

//Floor 1:
items = [];
var awesomelist = ["Trident", "Fishing Net", "Gemstone Staff", "Sledgehammer", "Pickaxe", "Nail Bat", "Quarterstaff", "Chromatic Cutlass","War Axe"];
awesomelist = shuffle(awesomelist);
gooditems = [awesomelist.pop()];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 2:
items = ["Katana"];
var newdicemanipulator = shuffle(["Lucky Roll", "Candle", "Permafrost", "Jolt"]);
gooditems = [newdicemanipulator.pop()];
otherstuff = [health()];
goodotherstuff = [shop([warriorshops.pop(), warriorshops.pop(), warriorshops.pop()],[2,2,2])];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 3:
items = [];
items.push(pick(["Scissors", "Battle Cry", "Sine Wave", "Last Stand", "Fireworks", newdicemanipulator.pop()]));
gooditems = [warriorshops.pop()];

otherstuff = [health(), upgrade()];

goodotherstuff = [
  shop([warriorshops.pop(), warriorshops.pop(), warriorshops.pop()],[1,2,1]),
  shop([warriorshops.pop(), warriorshops.pop(), warriorshops.pop()],[1,2,3])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [];
gooditems = [awesomelist.pop()];

otherstuff = [health()];
goodotherstuff = [
  trade(["weapon", "shield"], [awesomelist.pop()]),
  shop([warriorshops.pop(), "Health", strangeshop.pop()], [2, 3, 4])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [];
items.push(pick(["Disco Ball", "Parrying Dagger", "Sine Wave", "Fishing Net", "Last Stand", "Fireworks"]));
gooditems = [];

otherstuff = [health(), health(),health()];
goodotherstuff = [
  shop([strangeshop.pop(), strangeshop.pop() strangeshop.pop()], [2, 2, 2]),
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