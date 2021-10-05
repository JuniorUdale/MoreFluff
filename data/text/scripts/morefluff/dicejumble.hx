Rules.resetreplacementgfx();
var dicevals = [1,2,3,4,5,6];
dicevals = shuffle(dicevals);
for(x in 1...7){
	Rules.replacegfx("ui/dice/dice"+x, "ui/dice/dice"+dicevals[x-1]);
}