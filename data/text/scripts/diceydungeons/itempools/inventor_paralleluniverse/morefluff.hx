var floor1countdowns = ["Rosebud", "Pursuit", "Lucky Sword"];

var floor1spanner = [];

var floor1crap = ["Bramble","Dainsleif","Thorium Hammer","Backlash","Joke Answer","Overtime","Cauldron Cauldron","Drill Bit"];

var commonlist1 = ["Fulcrum Blade", "Jail Bat", "Crystal Skull","Starsword", "Blunt Sword", "Blunt Dagger", "Slice and Dice", "Starspike","Primal Slash", "Spiked Hilt", "Sticky Sword", "Lancestave", "Sundew", "Baseball Bat","Heavy Gatling","Blood Transfer","Mirrorblade","Snail Bat",pick(["Frostfire","Firefrost"]),"Bureaucratic Blade","Starstaff","Maul","Come On And Slam","Diffraction Spike","Fortnight","Popcount","Jianzi","Spear of Justfire","War Axe","Swordbroad","Offering","Flying Venus Trap","Paw Claw","Warcry","Burst Laser","Nice Sword","Molten Blast","Iron Swan","Dark Matter","Tail Bap","Flip Me Right Round","Steamstaff","Sunshine Ray","Blood Breath","Swipe","Revolver","Stop Sign","Solar Flair","Red Skies","Twin Slam","Doot","Induction Blade","Positivity","Spear Strike","Plaster Blaster","Spelksword","Dropkick","Woozy Whack","Eye Beam","Differblade","Virial Blade"];

var shoplist1 = ["Square Wave","Triangle Wave", "Solder","Tin Snips","Crescent Pendant","Bowsaw","Belt Sander","Velcro", "Sprinkler", "Ballerina Charm", "Triplicate", "Radical Wrench", "Berserker Rage","Trianguleight","Min Night Charm","Staple Gun","Stock Up","Electrophoresis","Arbitrage","Rift Stabilizer","Sawmill","Inflation","Overcharge","Janky Spanner","Doppeldagger","Pinball Machine","Popcorn","Sour Note","Metal Crusher","Mirror Madness","Discombobulate","Kalis", "Surfive", "Illumineight", "Threeken", "Nanobots","Caltrops","Lifesteal", "Preparation", "Defibrilator", "Pandora's Box","Stony Armour","Cup of Tea","Message in a Bottle","Sunday Sundae","Lunar Beam", "Terra Beam", "Firey Firesword of Fire", "Lamppost", "Flourish", "Chromatic Cutlass", pick(["Hexatomb","Blind Rage"]),"Sledgehammer", "Magma Storm", "Flamecrower", "Kerfuffle", "Electrolysis", "Doppelice", "Gavel","Spade","Dice Synthesis"];

var scrapitems = ["Scrap Cauldron"];
var uselessitem = rand(["Swedge","Plurale Tantrum", "Super Spatula", "Scraptula","Scrap Cauldron","Scrap Turret","Scrap Key"]);
scrapitems.push(uselessitem);

var midtierdrops = ["Fifteen Squirrels", "Polymorph"];
if(uselessitem == "Swedge" || uselessitem == "Scrap Key"){
	var luckitems = ["Lucky Sword","Lucky Lock","Good Feeling Crystal"];
	midtierdrops.push(pick(luckitems));
};

var floor3items = ["Calculator", "Spannersword", "Rubber Mallet", "Encyclopedia", "Broken Mirror", "Lucky Star"];

var commonlist2 = ["Belated Delivery", "Preparation", "Rope Dart", "Calculator", "Spannersword", "Rubber Mallet", "Encyclopedia", "Broken Mirror", "Lucky Star", "Swizzle","Auto Turret", "Sarissa","Clipeus"];

var floor4items = ["Petrification Spell","Polymorph"];

var floor5items = ["Triskaidekaphobia",shoplist1.pop(),midtierdrops.pop()];

var vampireitem = [];

var myitempools = [floor1countdowns,floor1spanner,floor1crap,commonlist1,shoplist1,scrapitems,midtierdrops,floor3items,commonlist2,floor4items,floor5items,vampireitem];
return myitempools;