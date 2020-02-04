// Regular and Parallel universe generators, smushed together
usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

//Floor 1:
var chiselorcandle = ["Chisel", "Candle"];
chiselorcandle = shuffle(chiselorcandle);

var commonlist1 = shuffle(["Cloak", chiselorcandle.pop(), "Plaster", "Dramatic Exit", "Blast Chiller", "Square Pair", pick(["Leather Armor","Stony Armor"]), "Bump", "Bandage", "Pickpocket", "Pea Shooter", "Snake Eye Charm", "Lifesteal", "Thistle Tea", "Poison Thread", "Hand Lens", "Starspike","Rockfall",pick(["Rend","Toxify"]),"Shichishito","Secateurs","Chain Dagger","Gem of Healing","Execute","Necrosis","Minigun","Dice Magnet","Headcrack","Juice Box","Ignite","Umbrella","Plague Stave","Asklepios","Starstaff","Draining Crystal","Rock Crusher","Arbitrage","Rift Stabilizer","Push Knife","Diabolo","Jianzi","Starfall","Lava Burst","Inflation","Iron Swan","Flying Venus Traph","Snakelops","Fruit Shooter","Taunting Sword","Wing Bash"]);

var countdowns = shuffle(["Scorch","Gust","Medigun","Metalmorph","Shrapnel","Paintbrush","Pee Shooter","Pea Shooter",pick(["Ballerina Charm", "Square Pair"]), "Cleaver", "Splat","Trianguleight","Coin Flip","Saxophone","Glitter","Karambit"]);

		
items = [commonlist1.pop()];

var tempfloor = addfloor("tiny")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 2:
commonlist1.push("Thick Skin");
commonlist1.push("Healing Crystal");
commonlist1 = shuffle(commonlist1);

items = [commonlist1.pop()];
gooditems = [];

otherstuff = [health(), health()];
goodotherstuff = [shop([countdowns.pop(),rand(["Befuddle", "Counterfeit","Duoplicate"]), commonlist1.pop()])];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 3:
var commonlist2 = [rand(["Paper Lantern", "Lantern"]), "Last Stand", "Kite Shield", "Tetraphobia", "Chisel", "Lucky 7", "First Aid Kit", rand(["Staff", "Gemstone Staff"]), "Lockpick", "Poison Slingshot", pick(["Last Stand","Surfive"]), "Flak Cannon", "Antifreeze", "Scraps", "Metalmorph","Blightmare","Magma Storm","Dodgy Chronometer","Grandfather Clock","Fairy In A Bottle","Blood Blessing"];
var rarelist1 = ["Dramatic Entrance", "Raw Ambition", "Hookshot", "Signal Jammer", "Determination", "Dodge", "Snake Eye Charm", "Midnight Charm", "Scales of Justdice", "Meteor Hammer", "Megaclone", "Curseven","Vampire Blade","Insult to Injury","Caps Lock","Power Creeper","Sawmill","Bottled Dragonbreath","Corrosion","Quarantine"];

commonlist2 = shuffle(commonlist2);
rarelist1 = shuffle(rarelist1);
items = [commonlist2.pop()];
gooditems = [];

otherstuff = [
  health(),
  health()
];
goodotherstuff = [
  shop([commonlist2.pop(), commonlist2.pop(), commonlist1.pop()]),
  upgrade()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:
var commonlist3 = [chiselorcandle.pop(), "Secret Weapon", rand(["Splitula", "Spatula", "Spatuplicate"]), "Broken Mirror", "Iron Armor", "Blight", "Detonator", "Unsettling Dream", "Momentum", "Tesseract", "Envenomate","Imperishability"];
commonlist3 = shuffle(commonlist3);
items = [commonlist3.pop()];
gooditems = [];

var floor5item = commonlist3.pop();

commonlist3.push("Table Slam");
commonlist3.push("Nudgeblade");
commonlist3 = shuffle(commonlist3);

otherstuff = [
	health(),
	health(),
	shop([commonlist2.pop(), rarelist1.pop(), commonlist2.pop()],[2,3,2]),
];


goodotherstuff = [
  shop([rarelist1.pop(), rarelist1.pop(), commonlist2.pop()],[3,3,2]),
  trade(["weapon"], ["Boomstick","Xiphos","Peppergun","Mechanical Leg", "Determination", "Broken Mirror", "Catastrophe", "Glass Cauldron","Blender","Blunderbuss","Aqua Fortis"])
];

addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
 //Floor 5:
items = [floor5item];
gooditems = [];
otherstuff = [health(), health(), health()];
goodotherstuff = [
  trade(["weapon"], ["Tickly Nose","Clerical Error", "Poisoned Axe","Momentum","Ballerina Charm","Bramble","Trebuchet","Three Shooter"]),
  shop([commonlist3.pop(), "health",rarelist1.pop()],[2,1,3]), 
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
		