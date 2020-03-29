usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var dicemanip = ["Chisel", "Candle", "Jerk", "Swizzle", "Sprinkler"];
dicemanip = shuffle(dicemanip);

var commonlist1 = shuffle(["Cloak", dicemanip.pop(), "Plaster", "Dramatic Exit", pick(["Square Pair", "Ballerina Charm"]), pick(["Twotool", "Crowpick"]), "Lifesteal", "Thistle Tea", "Illumineight", "Rope Dart", "Blunt Dagger", "Starspike","Rockfall", "Slice And Dice", "Blunt Dagger","Secateurs", "Heavy Gatling", "Vampire Blade", "Duoplicate", "Juice Box", "Ignite", "Umbrella","Rock Crusher","Arbitrage","Rift Stabilizer","Sawmill","Inflation","Flying Venus Trap","Iron Swan","Bottled Thunder","Tail Bap","Broken Blender","Blenderblade","Bludgeon","Revolver","Popcorn","Stop Sign","Hand Sanitiser","Twin Slam","Sky Lantern"]);

var countdowns = shuffle([pick(["Ballerina Charm", "Square Pair"]), "Cleaver", "Magma Storm", "Plaster", "Blast Chiller", "Splat", "Cup Of Tea", "Trianguleight", "Coin Flip", "Dodgy Chronometer", "Starstaff","Warcry","Fortnight","Cup of Tea","Fan the Flames","Huge Fan","Steamstaff","Pinball Machine"]);
var cowbell = shuffle(["Kalis","Splutter", "Twoplicate", "Stinging Nettle", "Crown and Anchor", "Knitting Needle","Warcry","Fortnight","Molten Blast","Drumkit","Doot"]);	

items = [countdowns.pop()];

var tempfloor = addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 2:
commonlist1.push("Thick Skin");
commonlist1.push("Stony Armour");
commonlist1 = shuffle(commonlist1);


items = [cowbell.pop()];

gooditems = [];

otherstuff = [health(), health()];
var shopstuff = shuffle([countdowns.pop(),cowbell.pop()]);
goodotherstuff = [shop([shopstuff[0], pick(["Befuddle","Duoplicate"]), shopstuff[1]],[2,3,2])];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:
commonlist1 = commonlist1.concat(["Paper Lantern", pick(["Last Stand","Surfive"]), "Kite Shield", "Tetraphobia", "Chisel", "Lucky 7", "Kalis", "Toxic Trebuchet", "Rope Dart", "Scorpion", "Threeken", "Full House", "Gem Of Healing", "Insult To Injury","Jianzi","Starfall"]);
var rarelist1 = ["Dramatic Entrance", "Raw Ambition", "Hookshot", "Signal Jammer", "Determination", "Precision Blade", "Scales of Justdice", "Meteor Hammer", "Megaclone", "Curseven", "Quadrahedron", "Imperishability", "Fairy In A Bottle", "Blightmare","Blood Blessing","Push Knife","Lava Burst","Hydraulic Press","Key Change"];

commonlist1 = shuffle(commonlist1);
rarelist1 = shuffle(rarelist1);
items = [commonlist1.pop()];
gooditems = [];

otherstuff = [
  health(),
  health()
];
goodotherstuff = [
  shop([cowbell.pop(), commonlist1.pop(), countdowns.pop()]),
  upgrade()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
commonlist1 = commonlist1.concat([dicemanip.pop(), "Secret Weapon", "Gong", pick(["Splitula", "Spatuplicate"]), "Broken Mirror", "Threeken", "Unsettling Dream", "Momentum", "Tesseract","Glitter"]);
commonlist1 = shuffle(commonlist1);
items = [commonlist1.pop()];
gooditems = [];

var floor5item = commonlist1.pop();

commonlist1.push("Table Slam");
commonlist1 = shuffle(commonlist1);

otherstuff = [
	health(),
	shop([rarelist1.pop(), rarelist1.pop(), commonlist1.pop()])
	
];

var thieftrade;
if(chance(5)){
	thieftrade = trade(["master key"], ["Doppeltwice"]);
}else if(chance(10)){
	thieftrade = trade(["master key"], ["Ungeradedice"]);
}else{
	if(chance(50)){
		thieftrade = trade(["nunchucks"], ["Tesseract", "Weapons Hot", "Fourns", "Trebuchet", "Three Shooter"]);
	}else{
		thieftrade = trade(["master key"], ["Magic Sneeze", "Locktrick", "Broken Mirror", "Blunderbuss", "Aqua Fortis"]);
	}
}

goodotherstuff = [
  shop([rarelist1.pop(), rarelist1.pop(), commonlist1.pop()]),
  health(),
  thieftrade
];

addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
var shopstuff; 
if(chance(25)){
	shopstuff = ["Twoplicate","Threeken","Fourns"];
}else{
	shopstuff = [commonlist1.pop(),rarelist1.pop(),commonlist1.pop()];
};
  
 
 //Floor 5:
items = [floor5item];
gooditems = [];
otherstuff = [
	health(),
	health(),
	health()
];
goodotherstuff = [
  trade(["Wrecking Ball","Seesaw","Cowbell"],["Momentum","Ballerina Charm","Bramble"]),
  shop(shopstuff,[2,3,2])
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
		