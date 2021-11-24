/* Script for the item "Mycophoresis". */

/* How this works:
* Choose 2 items; ideally one with 1 line of text and another with 1-2 lines of text
* Combine them together, use a flashy animation for this
* Replace the equipment (args[0]) with a blank piece of equipment that's getting pimped out to be both of the original items
* Consider using boxtech to execute, but I think that good old-fashioned script injection is going to work wonders here
* Use the more restrictive item as the basis for which slots to use

*/

/* Items to exclude:
* Reusable
* Uses "actualdice" or "dicehistory" anywhere in any of their scripts (slots are going to get WEIRD.)
* Too high of a countdown (you use the more restrictive argument, so e.g. 40 is a good cutoff point)
* Has giveequipment or e.create or "elements" anywhere in its script (those end up being too complicated, mostly)
* Look at Inventor Reunion for some tips and tricks on how to do this (like, just in general)



*/