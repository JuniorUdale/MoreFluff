usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var elemweps = shuffle(["Spark","Snowflake","Buzzer","Whisper","Knitting Needle", "Mosquito Bite","Starshine", "Bramble", "Starshine"]);
var sticks =rand([["Matchstick","Nightstick","Wooden Stick","Hockey Stick"],["Scorch","Hailstorm","Gust","Reverb"]]);
var crapstuff = shuffle(["Life Rip","Slime Ball","Stealth","Mini Missile","Blade of JOAT", "Fireflash", "Frostbitten", "Frozen Flute","Knitting Needle", "Mosquito Bite", "Magma Storm", "Cauldron Cauldron", "Drill Bit"]);
var scrap = shuffle(["Scrap Nettle", "Scrap Bump", "Scrap Club", "Scrap Book", "Scrap Spear", "Scrap Kettle","Scrap Cauldron","Scrap Metal"]);
var dicemanip = shuffle(["Change Machine", "Giant Spatula", "Saw Wave", "Solder","Tin Snips","Crescent Pendant","Bowsaw","Belt Sander","Velcro", "Sprinkler", "Ballerina Charm", "Triplicate", "Radical Wrench", "Snippers","Natural Charm", "Pockets","Ratula","Budge","Spirit Level","Tape Measure", "Cable Tie", "Rake Pick", "Hand Lens","Flashlight","Twinkle","Bite"]);

//Floor 1:
items = [pick(["Staff", "Crossbow","Sword","Gemstone Staff", "Wrecking Ball", "Rosebud", "Pursuit"])];
gooditems = [pick(elemweps),pick(crapstuff)];
otherstuff = [];
goodotherstuff = [];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
var commonlist1 = ["Chain Mail", "Bump", "Regen", "Blood Regen", "Spike", "Keyblade", "Shotgun", "Peppergun", "Boomstick", "Sonic Blast", pick(["Pavise","Mace"]), "Focus Beam", "Solar Beam", "Terra Beam","Lunar Beam", "Scorch", "Hailstorm","Quicklime","Quicksilver","Leech Seed", "Mystic Stave", "Steamball", "Gust",  "Trishula", "Labrys", "Pee Shooter", "Medigun","Hi Vis Jacket",  "Elastic Heart", "Berlin Key", "Kalis", "Surfive", "Illumineight", "Threeken", "Nanobots","Caltrops", "Blutsauger","Star Shooter","Magma Storm", "Berserker Rage","Lifesteal", "Preparation","Defibrilator", "Pandora's Box", "Primal Slash", "Primal Punch", "Shadow Stick", "Spiked Hilt", "Sticky Sword", "Lancestave", "Sundew", "Baseball Bat", "Helmet Headbutt",dicemanip.pop(),dicemanip.pop(),dicemanip.pop()];
var shoplist1 = ["Dagger", "Boomerang", "Crystal Sword", "Venus Fly Trap", "Pry Bar", "Demote", "Pockets","Six Shooter", "Focus Beam", "Solar Beam", "Terra Beam","Lunar Beam","Resonator", "Kaboomerang", "Mallet","Trowel","Cat O' Six Tails","Frosted Dirk","Healing Shiv","Venomous Goop","Screwdriver",  pick(["Gold Dagger", "Silver Dagger"]), "Lunar Beam", "Terra Beam", "Firey Firesword of Fire", "Lamppost", "Flourish", "Chromatic Cutlass", pick(["Hexatomb","Blind Rage"]),"Sledgehammer", "Magma Storm", "Flamecrower", "Kerfuffle", "Blunt Dagger", "Blunt Sword", "Slice and Dice", rand(["Blutsauger","Syringe Gun"]), "Fire Siphon", "Electrolysis", "Doppelice", "King Rat", "Spade"];
commonlist1 = shuffle(commonlist1);
shoplist1 = shuffle(shoplist1);

var shopideas;
var uselessthings = shuffle(["Swedge","Plurale Tantrum", "Dainsleif", "Thorium Hammer", "Binding Spell", "Super Spatula", "Backlash", "Helium Balloon", "One Weird Tip"]);
if(chance(50)){
	shopideas = rand([
		[rand(["Radar","Dazzling Light"]), rand(shoplist1), rand(["Flashlight","Twinkle"])],
		[rand(["Stinging Nettle","Dock Leaf"]),rand(shoplist1),rand(["Rosebud","Crown and Anchor"])],
		["Candy Cane",rand(dicemanip),"Bite"],
		["Lunar Beam",rand(shoplist1),"Terra Beam"],
		["Focus Beam",rand(shoplist1),"Focus Beam"],
		[rand(shoplist1),uselessthings.pop(),rand(shoplist1)]
	]);
}else{
	shopideas = [rand(shoplist1),rand(dicemanip),rand(shoplist1)];
};

items = [uselessthings.pop()];
gooditems = [dicemanip.pop()];

otherstuff = [
  shop([shoplist1.pop(),"health", scrap.pop()], [2, 2, 1]), 
  health()
];
goodotherstuff = [
  shop([shoplist1.pop(),"upgrade", uselessthings.pop()], [2, 2, 1]), 
  health()
];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 3:
var midtierdrops = shuffle(["Quicksilver","Transformer@1", "Encyclopedia", "Chainsaw", "Polymorph","Petrification Spell"]);
if(getfinalboss() == "Scathach"){
	midtierdrops.remove("Polymorph");
	//she's just too trivial with Polymorph, sorry :(
};
var s = shuffle(crapstuff.concat(sticks));
items = [s.pop()];
commonlist1 = shuffle(commonlist1.concat(["Broadsword", "Bump", "Chocolate Cookie", "Custard Cream", "Hall of Mirrors", "Midnight Charm", "Heckfire", "Nine Iron"]));
gooditems = [];
	
otherstuff = [
	health(),
	shop(shopideas,[2,2,2])
];
goodotherstuff = [
  shop([shoplist1.pop(),uselessthings.pop(), midtierdrops.pop()], [2, 1, 2]),
  shop([shoplist1.pop(),"upgrade", commonlist1.pop()], [2, 2, 2]),
];
	
addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:

commonlist1 = shuffle(commonlist1.concat(["Deep Freeze","Snapshot","Rend","Leech Soul","Cauterize", "Booplicate", "Clerical Error","Befuddle", "Mosquito Bite", "Lighter", "Triskaidekaphobia","Calculator", "Spannersword", "Rubber Mallet", "Encyclopedia", "Broken Mirror", "Lucky Star", "Swizzle","Auto Turret","Zap Cannon","Glaive","Sarissa","Hoplon","Clipeus"]));

items = [pick(elemweps)];
gooditems = [midtierdrops.pop(),uselessthings.pop()];
		
otherstuff = [
	health(),
	health()
];
goodotherstuff = [
	shop([commonlist1.pop(),shoplist1.pop(),commonlist1.pop()],[2,2,2]),
	shop([commonlist1.pop(),uselessthings.pop(),shoplist1.pop()],[2,2,2])
];
		
addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [pick(["Talons", "Hookshot", "Lightning Rod", "Shammer", "Primal Punch","Daydream","Scorpion", "Lucky 7", "Rotten Egg@6"])];
gooditems = [midtierdrops.pop()];
otherstuff = [
	shop([shoplist1.pop(), "upgrade", shoplist1.pop()],[2,2,2]),
	shop([commonlist1.pop(), "upgrade", commonlist1.pop()],[2,2,2]),
];
goodotherstuff = [
  shop([commonlist1.pop(), "health", commonlist1.pop()],[1,2,1]),
  shop(["health","health","health"],[1,2,1]),
  
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
		
		