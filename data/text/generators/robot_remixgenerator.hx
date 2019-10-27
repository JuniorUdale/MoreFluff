usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var commonlist_basic = shuffle(["Regen", "Dodge Roll", "Cache Stash", "Trishula", "Tomahawk", "Hand Lens",rand(["Iron Armor","Leather Armor","Magic Armor"]), "Saw Wave", "Safe Bet","Tin Snips","Critical Hit", "Electric Fence", "Meteor Hammer", "Auto Turret"]);
var commonlist_advanced = shuffle(["Juggling Ball", "Recharge", "Doppeldice", "Short Circuit", "Cable Tie", "Promote", "Superbolt", "Scraps","Antifreeze",  "Chain Whip","Slingshot", "Vise Grip", (chance(30)?"Starspear":"Sword Hilt"), "Ungeradedice", "Four Leaf Clover","Belt Sander","Fulcrum Blade", "Cleaver", "Heat Vent", "Mechanical Charm","Star Shooter","Virtual Machine", "Amplify","Reboot"]);

items = [commonlist_basic.pop()];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:

commonlist_basic.push("Bumpblade");
commonlist_basic.push("Nudgeknife");
commonlist_basic.push("Nudge");
commonlist_basic.push("Mechanical Arm");
commonlist_basic.push("Lucky Star");
commonlist_basic.push("Mechanical Leg");
commonlist_basic.push("Bayonet");
commonlist_basic.push("Junkblaster");
shuffle(commonlist_basic);

commonlist_advanced.push("Ray Gun");
commonlist_advanced.push("Forcefield");
commonlist_advanced.push("Cheat Code");
commonlist_advanced.push("Medigun");
commonlist_advanced.push("Elastic Heart");
commonlist_advanced.push("Half Moon Charm");
commonlist_advanced.push("Crystal Skull");
commonlist_advanced.push("Helium Balloon"); //maybe, just maybe, consider making this more common?
//it's a fun item, but would ruin some of the novelty if it appeared in every single run
//consider making a shop-exclusive list of items
shuffle(commonlist_advanced);

items = [];

gooditems = [commonlist_advanced.pop()];
otherstuff = [
	health(),
	shop([commonlist_basic.pop(), "health", commonlist_advanced.pop()],[2,2,3])
];
goodotherstuff = [
  shop([commonlist_advanced.pop(), commonlist_basic.pop(), commonlist_advanced.pop()],[3,2,3])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:
commonlist_basic.push("Fixed Payout");
commonlist_basic.push("Spirit Level");
commonlist_basic.push("Coolant Shooter");
commonlist_basic.push("Pliers");
commonlist_basic.push("Custard Cream");
commonlist_basic.push("Free Spin");
commonlist_basic.push("Spatulasword");
commonlist_basic.push("Kite Shield");
commonlist_basic.push("Hairpin");
shuffle(commonlist_basic);

commonlist_advanced.push("Counter Spell");
commonlist_advanced.push("Chocolate Cookie");
commonlist_advanced.push("Metallicize");
commonlist_advanced.push("Electroplating");
commonlist_advanced.push("Overheat");
commonlist_advanced.push("Underclock");
commonlist_advanced.push("Parrying Dagger");
commonlist_advanced.push("Dragon's Tooth");
commonlist_advanced.push("Limited Moon");
commonlist_advanced.push("Conformer");
commonlist_advanced.push("Graphics Card");
shuffle(commonlist_advanced);

items = [];
gooditems = [commonlist_basic.pop()];

otherstuff = [
  shop([commonlist_basic.pop(), "health", commonlist_advanced.pop()],[2,2,3]),
  health()
];
goodotherstuff = [
  shop([commonlist_basic.pop(), commonlist_advanced.pop(), commonlist_basic.pop()],[2,3,2]), 
  upgrade()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [];
gooditems = [commonlist_advanced.pop()];

var shopstuff;
var jackpots = shuffle(["Virtual Memory","Powerfield","Phaser","Marvellous Cheer"]);
var badRNGitems = shuffle(["Death Penalty","Princess Guard", "Premium Heart", "Venus Gospel"]);

if(chance(50)){
	if(chance(66)){
		shopstuff = shop(["Bingo", "health", jackpots.pop()],[2,3,3]);
	}else if(chance(50)){
		shopstuff = shop(["Four Leaf Clover", "health", badRNGitems.pop()],[2,3,3]);
	}else{
		shopstuff = shop([rand(["Ultimeh Weapon","Even Buster Sword"]), "health", commonlist_advanced.pop()],[2,3,3]);
	};
}else{
	shopstuff = shop([commonlist_basic.pop(), "health", commonlist_advanced.pop()],[2,3,3]);
};

otherstuff = [
	shopstuff,
	health()
];
goodotherstuff = [
  trade(["weapon"], ["Rake Pick", "Spatula", "Juggling Ball", "Headbutt","Free Spin", "Spatulasword", "Slingshot", "Flaming Sword", "Mechanicalantern"])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [pick(["Tribute", "Multiplicate", "Turtle", "Doppliduplicateinate","Calculator"])];
gooditems = [];

otherstuff = [
	shop([commonlist_basic.pop(), "health", commonlist_basic.pop()],[2,3,2]),
	health()
];
goodotherstuff = [
  shop([commonlist_advanced.pop(), "health", commonlist_advanced.pop()],[3,2,3]), 
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