import itemfinder
import os

def mainscript():
	gens = ["robot_youchooseyoulose","jester_finderskeepers","thief_finderskeepers","jester_warrior","inventor_rust","thief_uptick"]
	pref = ["warrior","thief","robot","inventor","witch","jester"]
	for p in pref:
		gens.append(p+"_normal")
	vanilla = []
	PU = []
	BR = []
	for g in gens:
		vanilla+=itemfinder.mainscript(g)
		print("Finished "+g)
	for p in pref:
		PU+=itemfinder.mainscript(p+"_paralleluniverse")
		print("Finished "+p+"_paralleluniverse")
		BR+=itemfinder.mainscript(p+"_remixgenerator")
		print("Finished "+p+"_remixgenerator")
	n = open("file/vanilla_output.txt","w+")
	vanilla = set(vanilla)
	vanilla = list(vanilla)
	vanilla.sort()
	for i in vanilla:
		n.write(i+"\n")
	n.close()
	v = open("file/PU_output.txt","w+")
	PU = set(PU)
	PU = list(PU)
	PU.sort()
	for i in PU:
		v.write(i+"\n")
	v.close()
	b = open("file/BR_output.txt","w+")
	BR = set(BR)
	BR = list(BR)
	BR.sort()
	for i in BR:
		b.write(i+"\n")
	b.close()
	print("")
	print("Finished all "+str(len(gens)+len(pref))+" generators.")
	print("Vanilla items found: "+str(len(vanilla)))
	print("PU items found: "+str(len(PU)))
	print("BR items found: "+str(len(BR)))
	ints = list(set(PU).intersection(vanilla))
	print("Intersections found: "+str(len(ints)))
	print(str(ints))
	print("Press enter to exit. ")
	input()
	
if __name__ == "__main__":
	mainscript();
