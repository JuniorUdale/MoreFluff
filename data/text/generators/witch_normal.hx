usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var commonlist_basic = [pick(["Magic Shield", "Magic Firewall", "Magic Heal"]), pick(["Magic Missile","Magic Frostbolt"]),pick(["Nudge","Demote"])];
shuffle(commonlist_basic);


var commonlist_offensive = [
  rand(["Life Drain", "Bandage", "Healing Crystal"]), 
  "Slime Ball", 
  "Magic Dagger", 
  "Fury Spell", 
  "Magic Spear",
  "Hex",
  "Catastrophe",
  "Decay",
  "Blutsauger",
  "Stun Blast",
  "Rend",
  "Scorch",
  "Hailstorm",
  "Metallicize",
  "Immolate",
  "Fire Siphon",
  "Bolas",
  "Blood Pact",
  "Draining Crystal",
  "Furious Spell",
  "Wing Bash"
];
var commonlist_dicemanipulation = [
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
  "Recycling Spell",
  "Indicetructable",
  "Glueplicate",
  "Diamond Wall",
  "Sacridice",
  "Slow Cooker"
];


//Floor 1:
items = [commonlist_basic.pop()];
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

gooditems = ["Hall of Mirrors"];
otherstuff = [
  shop([commonlist_offensive.pop(), "Magic Key", commonlist_basic.pop()], [3, 3, 3]),
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
items = [commonlist_dicemanipulation.pop()];
gooditems = [commonlist_offensive.pop()];
		
otherstuff = [
  health()
];

goodotherstuff = [
  shop([commonlist_offensive.pop(), commonlist_offensive.pop(), commonlist_dicemanipulation.pop()], [2, 3, 2])
  health()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [];
gooditems = [commonlist_dicemanipulation.pop(), commonlist_offensive.pop()];
		
shuffle(commonlist_dicemanipulation);
shuffle(commonlist_offensive);
var twoslots = shuffle([pick(["Blizzard","Inferno"]),pick(["Sonic Boom","Lightning Bolt"]),pick(["Sunshower","Plague Wave"]),pick(["Magnum Opus","Conjurate"])]);
var shopstuff = [twoslots.pop(),"Health",twoslots.pop()];

var shopstuff2;
var rejectedspells = shuffle(["Armour Spell","Spiky Spell","Acid Spell"]);
if(chance(25)){
	shopstuff2 = [rejectespells.pop(),rejectedspells.pop()];
}else{
	shopstuff2 = [commonlist_offensive.pop(),commonlist_dicemanipulation.pop()];
}

otherstuff = [
  health(),
  shop([shopstuff2[0],"Health",shopstuff2[1]],[2,3,2]);
  shop(shopstuff, [3, 3, 3])
];
goodotherstuff = [
  health()
];
		
addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [];
gooditems = [];
otherstuff = [health(), health(), health()];

goodotherstuff = [
  shop([
      rand(["Meteor","Absolute Zero","Giga Discharge"]), 
      commonlist_offensive.pop(), 
      "Health"
    ],[2,2,2]),
  health()
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