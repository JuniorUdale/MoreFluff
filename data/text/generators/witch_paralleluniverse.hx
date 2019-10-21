usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var commonlist_basic = [rand(["Enchanted Shield", "Blue Ocean", "Lavender"]), rand(["Vise Grip", "Sine Wave", "Sprinkler"])];
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
  "Starspike"
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
  "Marigold"
];
shuffle(commonlist_dicemanipulation);
var commonlist_spring = [
  "Flower Pot"
  "Honeysuckle",
  "Pea Pod",
  "Bloodroot",
  "Coffee Bean",
  "Pear Spear",
  "Crocus",
  "Twolip"
];
shuffle(commonlist_spring);


if(chance(20)){
  commonlist_dicemanipulation.push("Lunasa");
}else{
  commonlist_dicemanipulation.push("Spring Equinox");
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
		
items = [];
		
gooditems = ["Mirror Cauldron"];
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
items = [commonlist_dicemanipulation.pop()];
gooditems = [commonlist_spring.pop()];
		
otherstuff = [
  health(), 
  health(), 
  health()
];

goodotherstuff = [
  shop(shuffle([commonlist_offensive.pop(), commonlist_spring.pop(), commonlist_offensive.pop()]), [2, 3, 2])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [];
gooditems = [rand(["Moon Beam", "Gladioli", "Enchanted Bolt"])];

var addons = shuffle(["Rannuncarpus","Sunflower","Iris"]);
var thorns = [pick(["Rosebud", "Blackberry", "Magic Mistletoe", "Magic Thistle"]),pick(["Stinging Nettle","Dock Leaf"])];

var shopstuff = [];
if(chance(50)){
	if(chance(50)){
	shopstuff = [addons[0],addons[1]];
	commonlist_offensive.push(thorns.pop());
	}else{
		shopstuff = [thorns[0],thorns[1]];
		gooditems = addons.pop();
		commonlist_offensive.push(addons.pop());
	}
}else{
	shopstuff = [commonlist_offensive.pop(),commonlist_offensive.pop()];
	gooditems = addons.pop();
	commonlist_offensive.push(addons.pop());
}


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
  shop(shuffle([rand(["Summer Solstice", "Winter Solstice"]), commonlist_offensive.pop(), pick(["Harvest Scythe","Begonia"])]), [3, 4, 5])
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