usestandardenemies();

var items = [];
var gooditems = [];
var otherstuff = [];
var goodotherstuff = [];

var jester_dice_pool = ["Nudge", "Spatula", "Bump", pick(["Cauldron","Gold Cauldron","Silver Cauldron","Copper Cauldron","Iron Cauldron"]), "Bump", "Bumpblade", "Doppliduplicateinate"];
var jester_damage_pool = ["Juggling Ball", "Shovel", "Lament", "Whip", "Hammer", "Blood Suck", "Swordstave", "Iron Fist", "Blade of JOAT", "Mini Missile", "Divine Blade","Mallet","Trowel","Cat O' Six Tails","Frosted Dirk","Healing Shiv","Venomous Goop","Recoil Recover"];

jester_dice_pool = shuffle(jester_dice_pool);
jester_damage_pool = shuffle(jester_damage_pool);

//Floor 1:
addfloor("tiny")
  .additems([], [])
  .addotherstuff([health()], [])
  .generate();

//Floor 2:
items = ["Pot of Generosity"];
gooditems = [];
otherstuff = [
  health(), 
  health()
];
goodotherstuff = [
  shop(["Delete", jester_dice_pool.pop(), "Delete"], [2, 4, 3])
];

addfloor("small")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 3:
items = [jester_dice_pool.pop()];
gooditems = [];
otherstuff = [
  health(), 
  health()
];
goodotherstuff = [
  shop([jester_dice_pool.pop(), jester_damage_pool.pop(), "Delete"])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();

//Floor 4
items = [];
gooditems = [];

jester_dice_pool.push("Illuminate");
jester_dice_pool.push("Hall of Mirrors");
jester_dice_pool = shuffle(jester_dice_pool);

otherstuff = [
  health(), 
  upgrade()
];
goodotherstuff = [
  shop(["Upgrade", jester_damage_pool.pop(), "Delete"])
];

addfloor("normal")
  .additems(items, gooditems)
  .addotherstuff(otherstuff, goodotherstuff)
  .generate();
  
//Floor 5
items = [];
gooditems = [];
otherstuff = [health(), health(), health()];
goodotherstuff = [rand([upgrade(), copyshop()])];

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