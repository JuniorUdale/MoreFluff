//To do: document this properly, complete this guide.
//
//When this script starts, an empty Dungeon is created with zero floors.
//
//  addfloor(template) 
//    Creates a new floor - this becomes the new "top floor" of the dungeon. returns a "floor" object.
//    Layout is based on the template, loaded from the data/text/levels/ folder.
//    Matches any level file that contains the string "template", so "tiny" will match "graph_tiny1", "graph_tiny2", etc
//
//  floor.additems(normallist, goodlist)
//    Items that can be found on this floor, as an array of strings.
//    (In general, the normal list is close to where the player starts, and the good list is near the staircase.)
//
//  floor.addenemies(normallist, hardlist)
//    Enemies that can be found on this floor, as an array of strings. If you set usestandardenemies(true), then
//    you shouldn't need to do this - the game will automatically distribute enemies throughout a normal dungeon layout.
//    (In general, the normal list is close to where the player starts, and the good list is near the staircase.)

usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var jester_dice_pool = ["Nudge", "Spatula", "Bump", "Cauldron", pick(["Gold Cauldron","Silver Cauldron","Iron Cauldron","Copper Cauldron"]), "Bumpblade", "Doppliduplicateinate","Binding Spell"];
var jester_damage_pool = ["Juggling Ball", "Shovel", "Lament", "Whip", "Hammer", "Blood Suck", "Swordstave", "Iron Fist", "Blade of JOAT", "Mini Missile","Mallet","Trowel","Frosted Dirk","Healing Shiv","Venomous Goop", "Poisonous Apple"];


jester_dice_pool = shuffle(jester_dice_pool);
jester_damage_pool = shuffle(jester_damage_pool);

//Floor 1:
addfloor("tiny")
  .additems(["Juggling Ball"], [])
  .generate();
  
//Floor 2:
var finale = shuffle(["Dice Cannon", "Punchline", "Grand Finale", "Standing Ovation", "Inspiring Tune","Have a Ball","Cauldron Crafter","Battle Sax"]);
var chosen = finale.pop();
items = [chosen];
gooditems = [];
otherstuff = [
  health()
];
goodotherstuff = [
  shop(["Delete", "Two Handed Sword", "Delete"], [2, 3, 2]),
  upgrade()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 3:
items = [jester_dice_pool.pop()];
gooditems = [];
otherstuff = [
  trade([chosen],finale), 
  health()
];
goodotherstuff = [
  shop([jester_dice_pool.pop(), "Delete", jester_damage_pool.pop()],[2,2,2])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 4
items = [jester_dice_pool.pop()];
gooditems = ["Bop,Bop,Bop"];

jester_dice_pool.push("Illuminate");
jester_dice_pool.push("Quicklime");
jester_dice_pool.push("Hall of Mirrors");
jester_dice_pool = shuffle(jester_dice_pool);

otherstuff = [
  health(),
  upgrade()
];
goodotherstuff = [
  shop([jester_dice_pool.pop(), jester_damage_pool.pop(), jester_dice_pool.pop()],[3,2,3]),
  copyshop()
];

addfloor("big")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5
items = [];
gooditems = [];
otherstuff = [
	health(),
	shop([jester_dice_pool.pop(),"health", jester_damage_pool.pop()],[2,1,2])
];
goodotherstuff = [
	upgrade(),
	copyshop()
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

// Floor 6:			
items = [];
gooditems = [];
otherstuff = [];
goodotherstuff = [];

usestandardenemies(false);
var finalboss:String = level6enemies.pop();
if (finalboss == "Drake"){
  items.push("Wooden Stake,Wooden Stake");
}

addfloor("boss")
  .addenemies([], [finalboss])
  .additems(items, gooditems)
  .setlocation('BOSS')
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();