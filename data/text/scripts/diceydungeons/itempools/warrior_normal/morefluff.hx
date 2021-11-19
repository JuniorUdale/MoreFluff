var database = loaddata("morefluff/generators/maingenerator.csv");
var warriorshops = [];
var strangeshop = [];
var awesomelist = [];
var floor2gooditem = [];
var floor3item = [];
var floor5item = [];
var vampireitem = [];

for(item in database){
	if(item.warrior == "YES" && item.vanilla == "YES"){
		var tags = item.vanillatags.split(",");
		if(tags.indexOf("warriorshops") > -1){
			warriorshops.push(item.name);
		}
		if(tags.indexOf("strangeshop") > -1){
			strangeshop.push(item.name);
		};
		if(tags.indexOf("awesomelist") > -1){
			awesomelist.push(item.name);
		};
		if(tags.indexOf("floor2gooditem") > -1){
			floor2gooditem.push(item.name);
		};
		if(tags.indexOf("floor3item") > -1){
			floor3item.push(item.name);
		};
		if(tags.indexOf("floor5item") > -1){
			floor5item.push(item.name);
		}
	}
}

var myitempools = [warriorshops, strangeshop, awesomelist, floor2gooditem, floor3item, floor5item, vampireitem];
return myitempools


/*var warriorshops = ["Pike", "Zweihander", "Halberd", "Chakram", "Paintbrush", "Mace", "Pavise", "Natural Charm", "Loaded Dice", "Shotgun","Boomstick", "Blooplicate", "Trowel", "Mallet", "Frosted Dirk", "Spiked Sword", "Electroplating", "Trishula", "Tomahawk","Cat O' Six Tails", "Divine Blade", "Healing Shiv", "Venomous Goop", "Really Spiky Shield", "Nether Portal", "Ornamental Shield", "Execute", "Spikemail", "Hairdryer", "Shielding Potion", "Field Dressing", "Staff", "Plague Stave", "Asklepios","Shield Toss","Draining Crystal","Saxophone","Evocation","Revoke","Explosive Shield","Karambit","Molten Staff","Lockdown","Bloodclaw","Fruit Shooter","Juggernaut","Taunting Sword","Vine Whip","Differing Thorns","Mirror Coating","Shrug","Metal Slam","Solar Panel","Wooden Mallet","Holy Fire","Spearslinger","Sludge","Icicle Fall","Reinforce","Chitin Helmet","Sneksword","Freegen","Spire Shield"];

var strangeshop = ["Power Through", "drowS", "Expose Weakness", "Budge", "Metallicize", "Resonator",  "Leech Seed", "Panic Button", "Jade Blade", "Malediction", "Evil Eye", "Incapacitate","Chronoblade","Diamond Wall","Convergence","Shieldsplosion","Exoskeleton","First Sit","Hyena Siren"];

var awesomelist = ["Talons", "Labrys", "Targe Charge", "Canesword", "Urumi", "Crass Knuckles","Metronome"];

var floor2gooditem = ["Promote"];

var floor3item = ["Bolster", "Finisher"];

var floor5item = ["Shammer", "Doppliduplicateinate","Shield Scrap"];

var vampireitem = [];

var myitempools = [warriorshops, strangeshop, awesomelist, floor2gooditem, floor3item, floor5item, vampireitem];

return myitempools;*/