var commonlist_basic = ["Regen", "Dodge Roll", "Cache Stash", "Trishula", "Tomahawk", "Hand Lens","Magic Armor","Tin Snips","Critical Hit", "Electric Fence", "Meteor Hammer", "Auto Turret","Segfault","Ornamental Shield","CPU Shooter","Minigun","Maul","Draining Crystal","Nitro Bump","Starfall","Hosepipe","Iron Swan","Fruit Loot","Vine Whip","Speedometer","Metal Slam","Spearslinger","Reverberate","Reinforce","Chitin Helmet"];

var commonlist_advanced = ["Recharge", "Cable Tie", "Promote", "Superbolt", "Scraps","Antifreeze", "Chain Whip","Belt Sander","Fulcrum Blade", "Cleaver", "Heat Vent", "Mechanical Charm","Star Shooter","Virtual Machine", "Amplify","Reboot","Backup Drive","Overconfidence","Duplihate","One With Everything","Rosary","Plug Socket","Electrophoresis","Rift Stabilizer","Adaptaxe","Petal to the Metal"];

var floor2basic = ["Bayonet", "Junkblaster", "Intended Gameplay", "Captured Flag", "Shieldsplosion", "Solar Flair", "Freegen", "Sp4tula","Virtual Memory",];

var floor2advanced = ["Medigun", "Crystal Skull", "Helium Balloon", "Boost Panel", "Floppy Disk", "Regedit", "Convergence", "Twin Slam", "Thunder Buster", "First Sit"];

var floor2items = [chance(50)?(chance(80)?"Overclock":"Virus"):rand(["Memory Leak","Mechanical Arm"])];

var floor3basic = ["Spirit Level","Coolant Shooter","Pliers","Custard Cream","Hairpin"];

var floor3advanced = ["Metallicize","Electroplating","Overheat","Underclock","Limited Moon","Conformer","Graphics Card"];

var tradeoffer = [];

var traderesult = ["Powerfield","Phaser","Marvellous Cheer","Death Penalty","Princess Guard", "Premium Heart", "Venus Gospel"];

var vampireitem = [];

var myitempools = [commonlist_basic,commonlist_advanced,floor2basic,floor2advanced,floor2items,floor3basic,floor3advanced,tradeoffer,traderesult,vampireitem];
return myitempools;