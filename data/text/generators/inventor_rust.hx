usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var elemweps = shuffle(["Spark","Snowflake","Buzzer","Whisper"]);
var sticks =shuffle(["Scorch","Hailstorm","Gust","Reverb"]);
var crapstuff = shuffle(["Spark","Snowflake","Life Rip","Slime Ball","Stealth","Mini Missile","Blade of JOAT", "Fireflash", "Frostbitten", "Frozen Flute","Oven Gloves"]);

//Floor 1:
items = [pick(["Staff", "Crossbow","Broadsword","Plague Stave","Asklepios"])];
gooditems = [pick(elemweps),pick(crapstuff)];
otherstuff = [];
goodotherstuff = [];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 2:
var commonlist1 = ["Chain Mail", "Bump", "Snippers", "Spike", "Keyblade", "Shotgun", "Peppergun", "Boomstick", "Sonic Blast", "Natural Charm", "Pockets", "Mace", "Focus Beam", "Solar Beam", "Scorch", "Hailstorm", "Gust", "Reverb" ,"Quicklime","Quicksilver", "Mystic Stave", "Steamball", "Pavise", "Trishula", "Labrys", "Pee Shooter", "Medigun","Ratula","Canesword", rand(["Blutsauger","Syringe Gun"]), "Fire Siphon", "Breakthrough", "Helmet Headbutt","Generous Sword","Ornamental Shield","Ravage","Glowstick","Plague Stave","Asklepios", "Pry Bar", "Demote", "Pockets","Budge","Spirit Level","Tape Measure", "Cable Tie","Chronoblade","Saxophone","Nitro Bump","Glueplicate","Molten Staff","Lockdown","Juggernaut"];
var shoplist1 = ["Dagger", "Boomerang", "Crystal Sword", "Venus Fly Trap","Six Shooter", "Focus Beam","Resonator", "Rake Pick", "Kaboomerang", "Hand Lens", "Mallet","Trowel","Cat O' Six Tails","Frosted Dirk","Healing Shiv","Venomous Goop", "Shadow Stick", "King Rat", "Really Spiky Shield","Shield Toss","Diamond Wall","Recoil Recover","Taunting Sword","Mirror Coating","Little Prick","Energy Drink"]; //moved a lot of dice manip out of here into commonlist so there's more stuff to buy
commonlist1 = shuffle(commonlist1);
shoplist1 = shuffle(shoplist1);

items = [commonlist1.pop()];
gooditems = [commonlist1.pop()];

otherstuff = [
  shop([shoplist1.pop(),"health", shoplist1.pop()], [1, 2, 1]), 
  health()
];
goodotherstuff = [
  shop([shoplist1.pop(),"upgrade", shoplist1.pop()], [1, 2, 1]),
  health()
];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 3:
var midtierdrops = shuffle(["Deep Freeze","Snapshot","Rend","Leech Soul","Cauterize", "Booplicate", "Clerical Error","Furious Spell","Channel Rage","Indicetructable","Explosive Shield","Diabolo"]);
var s = shuffle(crapstuff.concat(sticks));
items = [s.pop()];
commonlist1 = shuffle(commonlist1.concat(["Broadsword", "Bump", "Chocolate Cookie", "Custard Cream", "Hall of Mirrors", "Midnight Charm", "Heckfire", "Nine Iron", "Zap Cannon", "Glaive", "Hoplon","Karambit"]));
gooditems = [];
	
otherstuff = [
	health(),
	shop([sticks.pop(),"Grindstone",sticks.pop()],[1,3,1])
];
goodotherstuff = [
  shop([shoplist1.pop(), midtierdrops.pop(), shoplist1.pop()], [1, 2, 1]),
  shop([commonlist1.pop(), "upgrade", commonlist1.pop()],[1,2,1])
];
	
addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 4:

commonlist1 = shuffle(commonlist1.concat(["Electroplating", "Metalmorph","Quicksilver","Power Through","drowS","Turtle","Decay", "Steel Bulwark"]));

items = [pick(elemweps),commonlist1.pop()];
gooditems = [midtierdrops.pop()];
		
otherstuff = [
	health(),
	health()
];
goodotherstuff = [
	shop([commonlist1.pop(),shoplist1.pop(),commonlist1.pop()],[1,2,1]),
	shop([commonlist1.pop(),shoplist1.pop(),commonlist1.pop()],[1,2,1])
];
		
addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5:
items = [pick(["Talons", "Hookshot", "Lightning Rod", "Shammer", "Primal Punch","Daydream"])];
gooditems = [midtierdrops.pop()];
otherstuff = [
	shop(["health","health","health"],[1,2,1]),
	shop([commonlist1.pop(), "upgrade", commonlist1.pop()],[1,2,1]),
];
goodotherstuff = [
  shop([commonlist1.pop(), "health", commonlist1.pop()],[1,2,1]),
  shop([commonlist1.pop(), "upgrade", commonlist1.pop()],[1,2,1]),
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
		
		