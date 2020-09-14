usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];


var uselessthings = shuffle(["Swedge","Plurale Tantrum", "Dainsleif", "Thorium Hammer", "Super Spatula", "Backlash", "Helium Balloon", "Magma Storm", "Super Lockpick", "Blood To Dice", "Crystal Rock", "Cauldron Cauldron", "Starshine", "Drill Bit","Booster Pack","Perpetual Motor","Reconstructificate","Blood Blessing","Joke Answer","Overtime","Scraptula","Ghost Blood"]);
var scrap = shuffle(["Scrap Nettle", "Scrap Bump", "Scrap Club", "Scrap Book", "Scrap Spear", "Scrap Kettle","Scrap Cauldron","Scrap Turret","Scrap Remote"]);
var weapons = shuffle(["Double Edge", "Blast Chiller", "Tetraphobia", "Fulcrum Blade" ,"Nunchucks", "Big Stick", "Rubber Mallet",  "Jail Bat", "Crystal Skull","Starsword", "Blunt Sword", "Blunt Dagger", "Slice and Dice", "Starspike","Primal Slash", "Spiked Hilt", "Sticky Sword", "Lancestave", "Sundew", "Baseball Bat","Heavy Gatling","Blood Transfer","Mirrorblade","Snail Bat",pick(["Frostfire","Firefrost"]),"Bureaucratic Blade","Starstaff","Maul","Come On And Slam","Diffraction Spike","Fortnight","Popcount","Jianzi","Spear of Justfire","War Axe","Swordbroad","Offering","Flying Venus Trap","Paw Claw","Warcry","Burst Laser","Nice Sword","Molten Blast","Iron Swan","Dark Matter","Tail Bap","Flip Me Right Round","Steamstaff","Sunshine Ray","Blood Breath","Swipe","Revolver","Stop Sign","Solar Flair","Red Skies","Twin Slam","Doot","Induction Blade","Positivity","Spear Strike","Plaster Blaster","Spelksword","Dropkick","Woozy Whack","Eye Beam","Differblade","Virial Blade"]);
var dicemanip = shuffle(["Giant Spatula", "Sine Wave", "Saw Wave", "Square Wave","Triangle Wave", "Solder","Tin Snips","Crescent Pendant","Bowsaw","Belt Sander","Velcro", "Sprinkler", "Ballerina Charm", "Triplicate", "Radical Wrench", "Berserker Rage","Trianguleight","Min Night Charm","Staple Gun","Stock Up","Electrophoresis","Arbitrage","Rift Stabilizer","Sawmill","Inflation","Overcharge","Janky Spanner","Doppeldagger","Pinball Machine","Popcorn","Sour Note","Metal Crusher","Mirror Madness","Discombobulate"]);

var shopideas = [
	[rand(["Radar","Dazzling Light"]), rand(weapons), rand(["Flashlight","Twinkle"])],
	[rand(["Stinging Nettle","Dock Leaf"]),rand(weapons),rand(["Rosebud","Crown and Anchor"])],
	["Candy Cane",rand(weapons),"Bite"],
	["Lunar Beam",rand(weapons),"Terra Beam"]
];

//Floor 1:
items = ["Spannersword", pick(["Gemstone Staff", "Wrecking Ball", "Rosebud", "Pursuit", "Lucky Sword"])];
gooditems = [pick(["Knitting Needle", "Mosquito Bite", "Bramble"])];
otherstuff = [];
goodotherstuff = [];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
var commonlist1 = ["Hi Vis Jacket",  "Elastic Heart", "Berlin Key", "Kalis", "Surfive", "Illumineight", "Threeken", "Nanobots","Caltrops","Lifesteal", "Preparation", "Defibrilator", "Pandora's Box", dicemanip.pop(),dicemanip.pop(),"Stony Armour","Cup of Tea","Message in a Bottle","Sunday Sundae"];
var shoplist1 = ["Screwdriver",  pick(["Gold Dagger", "Silver Dagger"]), "Lunar Beam", "Terra Beam", "Firey Firesword of Fire", "Lamppost", "Flourish", "Chromatic Cutlass", pick(["Hexatomb","Blind Rage"]),"Sledgehammer", "Magma Storm", "Flamecrower", "Kerfuffle",weapons.pop(),weapons.pop(), "Electrolysis", "Doppelice", "Gavel","Spade","Dice Synthesis"];
commonlist1 = shuffle(commonlist1);
shoplist1 = shuffle(shoplist1);

items = [uselessthings.pop()];
gooditems = [commonlist1.pop()];

otherstuff = [
  health(),
  health()
];
goodotherstuff = [
  shop([weapons.pop(),"upgrade", rand(scrap)], [2, 3, 2]),
  shop([dicemanip.pop(),"health", shoplist1.pop()], [2, 1, 2]),
];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 3:
var midtierdrops = shuffle(["Fifteen Squirrels", "Hallucinogen", "Triskaidekaphobia", "Polymorph"]);
if(getfinalboss() == "Scathach"){
	midtierdrops.remove("Polymorph");
	//she's just too trivial with Polymorph, sorry :(
};

var commonlist2 = ["Scissors", "Polar Star", "Capacitor", "Puppy Paws", rand(scrap), "Elastic Heart", "Belated Delivery", "Preparation", "Rope Dart", "Calculator", "Spannersword", "Rubber Mallet", "Encyclopedia", "Broken Mirror", "Lucky Star", "Swizzle","Auto Turret", "Sarissa","Clipeus", rand(dicemanip), rand(dicemanip)];

shuffle(commonlist2);

items = [rand(scrap)];
gooditems = [];

otherstuff = [
	health(),
	shop([uselessthings.pop(), scrap.pop(), uselessthings.pop()], ([1, 1, 1])),
];
goodotherstuff = [
  shop([weapons.pop(), "upgrade", dicemanip.pop()], ([2, 3, 2])),
  shop(rand(shopideas), ([2, 3, 2])),
];
	
addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
items = [pick(["Transformer@1", "Chainsaw", "Petrification Spell"])];
gooditems = [midtierdrops.pop(), uselessthings.pop()];
		
otherstuff = [health(), health()];
goodotherstuff = [
	shop([dicemanip.pop(), uselessthings.pop(), shoplist1.pop()],[3,1,3]),
	shop([shoplist1.pop(), uselessthings.pop(), dicemanip.pop()],[3,1,3])
];
		
addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [pick(["Scorpion", "Lucky 7", "Rotten Egg@6"])]; //no more last laugh?, sorry
gooditems = [midtierdrops.pop()];
		
otherstuff = [
	shop(["health","health","health"],[1,2,1]),
	shop([shoplist1.pop(),"upgrade",commonlist1.pop()],[2,3,1])
];
goodotherstuff = [
  shop([shoplist1.pop(), "health", commonlist2.pop()],[2,2,2]),
  shop([commonlist2.pop(), "upgrade", shoplist1.pop()],[2,2,2])
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
		
		