/* Script for the item "Archmage's Rune". */

var total = args[0];

var l = getequipmentlist(null,["small"],["witchonly","robotonly","inventoronly","thiefonly","warrioronly","jesteronly","excludefromrandomlists","alternateversion"]);


/* make a random item with countdown <= total
activate that item
then re-call archmage with the remaining
if it gets too low, call a fluff item (Junk Spell)


*/