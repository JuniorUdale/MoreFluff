usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var commonlist_basic = [rand(["Enchanted Shield", "Blue Ocean", "Lavender","Magic Heal"]), rand(["Vise Grip", "Sine Wave", "Sprinkler"])];
shuffle(commonlist_basic);

var commonlist_offensive = [
  rand(["Gumball Machine", "Thick Skin"]), 
  "Dice Detonator", 
  "Teleport Spell", 
  "Moonlight Spear",
  "Sunburn",
  "Winds of Winter",
  "April Showers",
  "Snowdrop",
  "Magic Thistle",
  "Enchanted Bolt",
  "Ginger",
  "Rosebud",
  "Magnolia",
  "Pansy",
  "Thermalily",
  "Dogwood",
  "Starspike",
  rand(["Life Drain", "Bandage", "Healing Crystal"]), 
  "Magic Dagger", 
  "Fury Spell", 
  "Magic Spear",
  "Hex",
  "Catastrophe",
  "Decay",
  "drowS",
  "Stun Blast",
  "Rend",
  "Scorch",
  "Hailstorm",
  "Metallicize",
  "Immolate",
  "Furious Spell",
  "Indicetructable",
  "Diamond Wall",
  "Starfall",
  "Lava Burst",
  "Differing Thorns",
  "Mirror Coating"
];
shuffle(commonlist_offensive);
var commonlist_dicemanipulation = [
  "Northern Lights",
  "Bronze Cauldron",
  "Quartz Cauldron",
  "Electrum Cauldron",
  "Stew Pot",
  "Hydrangea",
  "Saw Wave",
  "Subdivide",
  "Candle",
  "Sprinkler",
  "Magic Mirror",
  "Magic Spatula",
  "Magic Sneeze",
  "Marigold",
  "Illuminate", 
  "Glass Cauldron", 
  "Gold Cauldron", 
  "Silver Cauldron", 
  "Crucible",
  "Skeleton Key",
  "Flipper",
  "Multiplicate",
  "Dodge Roll",
  "Natural Charm",
  "Unnatural Charm",
  "Iron Cauldron",
  "Copper Cauldron",
  "Doppliduplicateinate",
  "Binding Spell",
  "Draining Crystal",
  "Glueplicate",
  "Sacridice",
  "Slow Cooker"
];
shuffle(commonlist_dicemanipulation);
var commonlist_spring = [
  "Flower Pot"
  "Honeysuckle",
  "Bloodroot",
  "Pea Pod",
  "Coffee Bean",
  "Pear Spear",
  "Crocus",
  "Twolip"
];
shuffle(commonlist_spring);


if(chance(33)){
  commonlist_dicemanipulation.push("Lunasa");
}else if(chance(50)){
  commonlist_dicemanipulation.push("Spring Equinox");
}else{
	commonlist_dicemanipulation.push("Crucible");
}

//Floor 1:
items = [];
gooditems = [commonlist_basic.pop()];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
commonlist_dicemanipulation = shuffle(commonlist_dicemanipulation);
commonlist_offensive = shuffle(commonlist_offensive);
		
items = [commonlist_spring.pop()];
		
gooditems = [rand(["Mirror Cauldron","Hall of Mirrors","Magic Mirror"])];
otherstuff = [
  health(), 
  health()
];

goodotherstuff = [
  shop(shuffle([commonlist_offensive.pop(), commonlist_dicemanipulation.pop(), commonlist_basic.pop()]))
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  	
//Floor 3:
items = [];
gooditems = [commonlist_spring.pop()];
		
otherstuff = [
  health(), 
  health(), 
  health()
];

goodotherstuff = [
  shop(shuffle([commonlist_offensive.pop(), commonlist_dicemanipulation.pop(), commonlist_spring.pop()]), [2, 3, 4])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [commonlist_dicemanipulation.pop()];
gooditems = [rand(["Moon Beam", "Gladioli", "Enchanted Bolt"])];

var addons = pick(["Rannuncarpus","Sunflower","Iris"]);
var thorns = pick(["Rosebud", "Blackberry", "Magic Mistletoe", "Magic Thistle"]);
var dualweps = pick(["Blizzard","Inferno","Sonic Boom","Lightning Bolt","Sunshower","Plague Wave"]);
var rejectedspells = pick(["Spiky Spell","Armour Spell","Acid Spell"]);

var shopitems = shuffle([addons,thorns,dualweps,rejectedspells]);

var shopstuff = [];
if(chance(50)){
	shopstuff = [shopitems.pop(),shopitems.pop()];
}else{
	shopstuff = [commonlist_offensive.pop(),commonlist_offensive.pop()];
};
commonlist_offensive = shuffle(commonlist_offensive.concat(items));

shuffle(commonlist_dicemanipulation);
shuffle(commonlist_offensive);
		
otherstuff = [
  health(),
  health()
];

goodotherstuff = [
	shop([shopstuff[0], "Health", shopstuff[1]], [2, 3, 4])
];
		
addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [commonlist_dicemanipulation.pop()];
gooditems = [];
otherstuff = [health(), health(), health()];
goodotherstuff = [
  shop(shuffle([rand(["Summer Solstice", "Winter Solstice"]), rand(["Meteor","Absolute Zero","Giga Discharge"]), rand(["Harvest Scythe","Lunasa"])]), [3, 3, 3])
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