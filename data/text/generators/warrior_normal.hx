usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var warriorshops = ["Broadsword", "Iron Shield", "Dagger", "Buckler", "Target Shield", "Nightstick", "Snake Eye Charm", "Midnight Charm", "Healing Crystal", "Claw", "Snowball", "Boomerang", "Tazer", "First Aid Kit"];

warriorshops = warriorshops.concat( ["Pike", "Zweihander", "Halberd", "Chakram", "Paintbrush", "Mace", "Pavise", "Natural Charm", "Loaded Dice", "Shotgun","Boomstick", "Blooplicate", "Trowel", "Mallet", "Frosted Dirk", "Spiked Sword", "Electroplating", "Trishula", "Tomahawk","Cat O' Six Tails", "Divine Blade", "Healing Shiv", "Venomous Goop", "Really Spiky Shield", "Nether Portal", "Ornamental Shield", "Execute", "Spikemail", "Hairdryer", "Shielding Potion", "Field Dressing", "Staff", "Plague Stave", "Asklepios","Shield Toss","Draining Crystal","Saxophone","Evocation","Revoke","Explosive Shield","Karambit","Molten Staff","Lockdown","Bloodclaw","Fruit Shooter","Juggernaut","Taunting Sword","Vine Whip","Differing Thorns"]); //modded items

shuffle(warriorshops);

var strangeshop = ["Spatula", "Lightning Rod", pick(["Shriek","Heckle"]), "Power Through", "drowS", "Expose Weakness", "Budge", "Metallicize", "Resonator",  "Leech Seed", "Panic Button", "Jade Blade", "Malediction", "Evil Eye", "Incapacitate","Chronoblade","Diamond Wall"];
strangeshop = shuffle(strangeshop);

//Floor 1:
var awesomelist = ["Whip", "Hammer", "Nine Iron", "Shovel", "Talons", "Labrys", "Targe Charge", "Canesword", "Urumi", "Crass Knuckles","Iron Swan"]; 

awesomelist = shuffle(awesomelist);

items = [awesomelist.pop()];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 2:
items = [pick(["Bump","Promote"])];
var combos = shuffle(["Boopin' Stick","Buckler", "Lantern Shield", "Iron Fist", "Bolster", "Targe Charge"]);
gooditems = [combos.pop()];

otherstuff = [health()];
goodotherstuff = [shop([warriorshops.pop(), warriorshops.pop(), warriorshops.pop()] , [2,3,2])];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 3:
var temp = shuffle(["Six Shooter", "Crystal Sword", "Chocolate Cookie", "Custard Cream","Bolster", "Finisher"]);
items = [temp.pop()];

gooditems = [combos.pop()];

otherstuff = [health(),upgrade()];

goodotherstuff = [
  shop([warriorshops.pop(), warriorshops.pop(), warriorshops.pop()] , [1,2,3]),
  shop([warriorshops.pop(), "Health", warriorshops.pop()] , [2,1,2])

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
  trade(["Sword","Venus Fly Trap","Battle Axe"], [awesomelist.pop()]),
  shop([warriorshops.pop(), "Health", strangeshop.pop()], [2, 3, 4])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [];
items.push(pick(["Counter Spell", "Shammer", "Chocolate Cookie", "Custard Cream", "Doppliduplicateinate"]));
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
		