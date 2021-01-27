var floor1countdowns = ["Blade of Null","Mysterious Blade","Super Duper Sword","Bureaucratic Blade","Lucky Sword","Exit"];

var floor1crap = ["Knitting Needle", "Mosquito Bite","Starshine", "Bramble", "Starshine","Jianzi","Gemstone","Burning Stick","Surprisingly Warm Rock","Dainsleif", "Thorium Hammer", "Binding Spell", "Backlash", "One Weird Tip","Extremely Unwieldy Sword"];

var commonlist1 = ["Chain Mail", "Regen", "Blood Regen",  "Shotgun", "Peppergun", "Boomstick", "Sonic Blast", pick(["Pavise","Mace"]), "Focus Beam", "Solar Beam", "Terra Beam","Lunar Beam", "Scorch", "Hailstorm","Quicklime","Quicksilver","Leech Seed", "Mystic Stave", "Steamball", "Gust",  "Trishula", "Labrys", "Pee Shooter", "Medigun","Hi Vis Jacket",  "Elastic Heart", "Berlin Key", "Kalis", "Surfive", "Illumineight", "Threeken", "Nanobots","Caltrops", "Blutsauger","Star Shooter","Magma Storm", "Berserker Rage","Lifesteal", "Preparation","Defibrilator", "Pandora's Box", "Primal Slash", "Primal Punch", "Shadow Stick", "Spiked Hilt", "Sticky Sword", "Lancestave", "Sundew", "Baseball Bat", "Helmet Headbutt","Generous Sword","Ravage","Glowstick",pick(["Frostfire","Firefrost"]),"Maul","Shield Toss","Chronoblade","Come On And Slam","Diamond Wall","Recoil Recover","Diffraction Spike","Popcount","Explosive Shield","Diabolo","Karambit","Spear Of Justfire","War Axe","Swordbroad","Molten Staff","Molten Blast","Offering","Flying Venus Trap","Paw Claw","Warcry","Nice Sword","Differing Thorns","Cup of Tea","Dark Matter","Tail Bap","Flip Me Right Round","Steamstaff","Sunshine Ray","Blood Breath","Swipe","Revolver","Stop Sign","Solar Flair","Red Skies","Twin Slam","Doot","Induction Blade","Positivity","Spear Strike","Plaster Blaster","Spelksword","Dropkick","Woozy Whack","Eye Beam","Differblade","Virial Blade","Sneksword","Malevolence","Oil Barrel","Frost Shield","Aftershock","Box of Nails"];

var shoplist1 = ["Pry Bar", "Demote", "Pockets","Six Shooter", "Focus Beam", "Solar Beam", "Terra Beam","Lunar Beam","Resonator", "Kaboomerang", "Mallet","Trowel","Cat O' Six Tails","Frosted Dirk","Healing Shiv","Venomous Goop","Screwdriver",  pick(["Gold Dagger", "Silver Dagger"]), "Lunar Beam", "Terra Beam", "Firey Firesword of Fire", "Lamppost", "Flourish", "Chromatic Cutlass", pick(["Hexatomb","Blind Rage"]), "Magma Storm", "Flamecrower", "Kerfuffle", "Blunt Dagger", "Blunt Sword", "Slice and Dice", rand(["Blutsauger","Syringe Gun"]), "Fire Siphon", "Electrolysis", "Doppelice", "King Rat", "Spade","Starpocalypse","Blood Transfer","Ornamental Shield","Mirrorblade","Snail Bat","Furious Spell","Stony Armour","Channel Rage","Blood Blessing","Indicetructable","Arbitrage","Fortnight","Joke Answer","Wildcard","Sawmill","Inflation","Juggernaut","Mirror Coating","Healing Boomerang","Dice Synthesis","Little Prick","Energy Drink","Message in a Bottle","Sunday Sundae","Overtime","Spire Shield","Solder","Tin Snips","Crescent Pendant","Bowsaw","Belt Sander","Velcro", "Sprinkler", "Ballerina Charm", "Triplicate", "Radical Wrench", "Snippers","Natural Charm", "Pockets","Ratula","Budge","Spirit Level","Tape Measure", "Cable Tie", "Rake Pick", "Hand Lens","Flashlight","Twinkle","Bite","Nether Portal","Booster Pack","Trianguleight","Coin Flip","Saxophone","Nitro Bump","Electrophoresis","Glueplicate","Rift Stabilizer","Janky Spanner","Doppeldagger","Pinball Machine","Popcorn","Sour Note","Metal Crusher","Mirror Madness"];

var scrapitems = ["Scrap Cauldron"];
var uselessitem = rand(["Swedge","Plurale Tantrum", "Super Spatula", "Scraptula","Scrap Cauldron","Scrap Turret","Scrap Key"]);
scrapitems.push(uselessitem);

var midtierdrops = ["Polymorph","Petrification Spell","Fifteen Squirrels","Elemental Blast"];

if(uselessitem == "Swedge" || uselessitem == "Scrap Key"){
	var luckitems = ["Lucky Sword","Lucky Lock","Good Feeling Crystal"];
	midtierdrops.push(pick(luckitems));
};

var floor3items = [];

var commonlist2 = ["Deep Freeze","Snapshot","Rend","Leech Soul","Cauterize", "Booplicate", "Clerical Error","Befuddle", "Mosquito Bite", "Lighter", "Triskaidekaphobia","Swizzle","Auto Turret","Zap Cannon","Glaive","Sarissa","Hoplon","Clipeus"];

var floor5items = ["Talons", "Blade of September", "Lightning Rod", "Shammer", "Primal Punch","Daydream"];

var vampireitem = [];


var myitempools = [floor1countdowns,scrapitems,floor1crap,commonlist1,shoplist1,midtierdrops,floor3items,commonlist2,floor5items,vampireitem];
return myitempools;