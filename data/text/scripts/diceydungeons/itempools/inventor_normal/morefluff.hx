var floor1countdowns = ["Plague Stave","Asklepios"];

var floor1sword = ["Super Duper Sword","Blade of Null","Exit"];

var floor1crap = ["Gemstone","Burning Stick","Life Rip","Stealth","Blade of JOAT", pick(["Fireflash", "Frostbitten", "Frozen Flute"]), "Oven Gloves",pick(["Box of Nails","Oil Barrel","Aftershock","Frost Shield"]),"Portavortex","Flame Lance"];


var commonlist1 = ["Chain Mail", "Regen", "Blood Regen", "Snippers", "Shotgun", "Peppergun", "Boomstick", "Sonic Blast", "Natural Charm", "Pockets", "Mace", "Focus Beam [dynamo]", "Solar Beam [dynamo]", "Scorch", "Hailstorm","Quicklime","Quicksilver","Leech Seed", "Mystic Stave", "Steamball", "Gust", "Reverb", "Pavise", "Trishula", "Labrys", "Pee Shooter", "Medigun","Ratula","Canesword", rand(["Blutsauger","Syringe Gun"]), "Fire Siphon", "Breakthrough", "Helmet Headbutt","Generous Sword","Ornamental Shield","Ravage","Glowstick","Plague Stave","Asklepios","Chronoblade","Saxophone","Nitro Bump","Glueplicate","Molten Staff","Precious Pendant","Lockdown","Juggernaut","Differing Thorns","Extremely Unwieldy Sword","Sweep the Legs","Blastdice Potion","Solar Panel","Convergence","Wooden Mallet","Holy Fire","Shieldsplosion","Spearslinger","Sludge","Reverberate","Metronome","Icicle Fall","Lavateinn"];

var shoplist1 = ["Pry Bar", "Demote", "Pockets","Budge","Spirit Level","Tape Measure", "Cable Tie", "Focus Beam [dynamo]","Resonator", "Rake Pick", "Kaboomerang", "Hand Lens", "Mallet","Trowel","Cat O' Six Tails","Frosted Dirk","Healing Shiv","Venomous Goop", "Shadow Stick", "King Rat", "Really Spiky Shield","Nether Portal","Starpocalypse","Shield Toss","Diamond Wall","Recoil Recover","Taunting Sword","Mirror Coating","Little Prick","Energy Drink","Harmonica","Focusing Lens","Entangle","Toxins","Paper Mask","Turnip","Follow Up","Orb of Discord","Prescience","Penance of Frost","Exoskeleton","Petal to the Metal","Blood Eagle","Chitin Helmet"];

var scrapitems = [];

var midtierdrops = ["Deep Freeze","Snapshot","Rend","Leech Soul","Cauterize", "Booplicate", "Clerical Error","Furious Spell","Channel Rage","Indicetructable","Explosive Shield","Diabolo"];
var forms = ["Angry Form","Void Form","Loud Form","Infinite Form"];
midtierdrops.push(rand(forms));

var floor3items = ["Broadsword", "Bump", "Chocolate Cookie", "Custard Cream", "Hall of Mirrors", "Midnight Charm", "Heckfire", "Nine Iron", "Zap Cannon", "Glaive", "Hoplon","Karambit"];

var commonlist2 = ["Electroplating", "Metalmorph","Quicksilver","Power Through","drowS","Turtle","Decay", "Steel Bulwark"];

var floor5items = ["Blade of September", "Shammer", "Primal Punch","Daydream"];

var vampireitem = [];

var myitempools = [floor1countdowns,floor1sword,floor1crap,commonlist1,shoplist1,scrapitems,midtierdrops,floor3items,commonlist2,floor5items,vampireitem];
return myitempools;