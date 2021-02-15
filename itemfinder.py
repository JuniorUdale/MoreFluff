import re
import os

def mainscript(gen = ""):
	flag = True
	if gen == "":
		gen=input("Which generator? ")
	else:
		flag = False
	f = open("data/text/scripts/diceydungeons/itempools/" + gen + "/morefluff.hx","r")
	excluded = ["tiny","normal","small","upgrade", "health", "big", "boss","Drake","weapon","shield","Wooden Stake,Wooden Stake","Wooden Stake","top floor", "template", "graph_tiny1","graph_tiny2","Delete","floor","Health"]

	x = []
	for i in f:
		for j in re.findall("\"[^\"]*\"",i):
				if(j[1:-1] not in excluded and j[1:-1] not in x):
						x.append(j[1:-1])
	
	n = open("file/"+gen+"_output.txt","w+")
	if(flag):
		for i in x:
			print(i)
			n.write(i+"\n")
	else:
		for i in x:
			n.write(i+"\n")
	n.close()
	if(flag):
		print("")
		print("Done!")
		print(str(len(x))+" items found.")
		input("Press enter to quit. ")
	return(x)
	
if __name__ == "__main__":
	mainscript()
