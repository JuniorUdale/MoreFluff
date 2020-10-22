import re
import os

def mainscript(gen = ""):
	drive = os.path.splitdrive(os.getcwd())[0]
	flag = True
	f = open("data/text/episodes.csv","r")

	x = []
	for i in f:
		for j in re.findall("~[^~]*~",i):
			x.append(j.replace("Equipment:",""))
	
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
