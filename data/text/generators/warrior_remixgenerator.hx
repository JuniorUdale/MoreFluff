usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var warriorshops = ["Broadsword", "Iron Shield", "Dagger", "Buckler", "Target Shield", "Nightstick", "Blight", "Snake Eye Charm", "Midnight Charm", rand(["Healing Crystal", "Thick Skin", "Elastic Heart"]), "Claw", "Snowball", "Boomerang", "Tazer", rand(["First Aid Kit", "Kite Shield"]), "Parrying Dagger", "Boxing Gloves", "Last Stand", "Singularity", "Half Moon Charm", "Dramatic Exit", "Hookshot", "Capacitor", "Trowel", "Mallet", "Frosted Dirk", "Spiked Sword", "Lamppost", "Firey Firesword of Fire", "Blessed Bat of Bashing", "Trident", "Gemstone Staff", "Sledgehammer", "Tesla Cannon", "Rodela", "Baseball Bat","Katana","Urumi","Crass Knuckles","Blood Transfer","Generous Sword","Ornamental Shield","Spikemail","Hairdryer","Mirrorblade","Panic Button","Snail Bat","Jade Blade","Black Hole","Reaper","Shielding Potion","Stock Up","Field Dressing","Incapacitate","Plague Stave","Asklepios","Starstaff","Maul","Shield Toss","Chronoblade","Come On And Slam","Saxophone","Diamond Wall","Evocation","Revoke","Explosive Shield","Karambit","War Axe","Molten Staff","Molten Blast","Parasol","Iron Swan","Bloodclaw","Fruit Loot","Fruit Shooter","Warcry","Juggernaut","Burst Laser","Taunting Sword","Nice Sword","Vine Whip","Differing Thorns","Mirror Coating","Dicepenser","Shrug","Adaptaxe"];
shuffle(warriorshops);

var strangeshop = ["Spatula", "Lightning Rod", "Shriek", "Juggling Ball", "Candle", "Particle Accelerator", "Flying Skull", "Sledgehammer", "Slingshot", "Fishing Net", "Scissors","Heckle", "Ferrosynthesis", "Really Spiky Shield", "Sunder","Malediction","Evil Eye","Pandemonium","Swordbroad","Third Eye","Lockdown","Flying Venus Trap","Paw Claw"];
strangeshop = shuffle(strangeshop);

//Floor 1:
items = [];
var awesomelist = ["Whip", "Toxic Ooze", "Claw", "Staff", "Hammer", "Shovel", "Battle Axe", "Nail Bat", "Quarterstaff", "Sapping Spores", "Resonator",  "Leech Seed", "Canesword"];
awesomelist = shuffle(awesomelist);
gooditems = [awesomelist.pop()];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 2:
items = [warriorshops.pop()];
var newdicemanipulator = shuffle(["Bump", "Lucky Roll", "Candle", "Permafrost", "Jolt", "Promote","Inflation"]);
gooditems = [newdicemanipulator.pop()];
otherstuff = [health()];
goodotherstuff = [shop([warriorshops.pop(), warriorshops.pop(), warriorshops.pop()])];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 3:
items = [];
items.push(pick(["Bump", "Six Shooter", "Crystal Sword", "Chocolate Cookie", "Blight", "Detonator", "Spatula", "Scissors", "Battle Cry", "Sine Wave", "Last Stand", "Fireworks", newdicemanipulator.pop(), "Finisher"]));
gooditems = [warriorshops.pop()];

otherstuff = [health(), health()];

goodotherstuff = [
  shop([warriorshops.pop(), warriorshops.pop(), warriorshops.pop()],[3,2,3]),
  shop([warriorshops.pop(), warriorshops.pop(), warriorshops.pop()],[3,2,3])
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
items.push(pick(["Counter Spell", "Chocolate Cookie", "Disco Ball", "Parrying Dagger", "Sine Wave", "Fishing Net", "Last Stand", "Fireworks", "Custard Cream", "Doppliduplicateinate","Shield Scrap"]));
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
		