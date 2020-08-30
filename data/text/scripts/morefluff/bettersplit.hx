//bettersplit.hx
//Support for splitting larger numbers than 6. Reluctantly also supports returning more 1s than you started with.

//Arguments:
/* 
 * diceval:Int. The number to split.
 * splitamt:Int. The amount of dice to split it into.
 * generateOnes:Bool. Whether or not to generate ones out of thin air in the case that splitAmt > diceval. Defaults to false.
 */
 
if(args.length < 2){
	if(args.length == 0){
		trace("Error: no arguments supplied. Run this script with the value to split, as well as how many dice to split it into.");
	}else{
		args.push(2);
	}
}
var diceval = args[0];
var splitamt = args[1];
var generateOnes = (args.length >= 2 && args[2]);

if(splitamt >= diceval){
	var retval = [];
	if(generateOnes){
		for(i in 0...splitamt){
			retval.push(1);
		};
	}else{
		for(i in 0...diceval){
			retval.push(1);
		};
	};
	return retval;
}

function newsplit(total, amount) {
    if (amount <= 1) {
        return [total];
    };
    if (total == amount) {
        return [1].concat(newsplit(total- 1 , amount- 1));
    };
    if (amount * 6 == total) {
        return [6].concat(newsplit(total- 6 , amount- 1));
    };
    var retval = [];
    var lowbound = 1;
    var upbound = 6;
    if (amount * 6 - total < 6) {
        lowbound = 7 - (amount * 6 - total);
    } else if (total - amount < 6) {
        upbound = total - amount;
    };
    while (lowbound <= upbound) {
        retval.push(lowbound);
        lowbound += 1;
    };
    var r = rand(retval);
    return ([r].concat(newsplit(total - r , amount - 1)));
};

return newsplit(diceval,splitamt);












