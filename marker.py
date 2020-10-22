import csv
import os


def getEquipmentList():
	out = []
	
	with open("_append/data/text/equipment.csv","r") as f:
		reader = csv.reader(f)
		for row in reader:
			if "_" not in row[0] and row[0] != "Name":
				out.append(row[0])
	return(out)

def mainscript():
	"""
	aight let's do this:
	* so, take 3 output files: PU, normal, unused
	* open up full_output.txt and PU_output.txt
	* get a "in file" function
	* iterate through getequipmentlist and check if they're in either file	
	"""
	pu_list = []
	vanilla_list = []
	unused_list = []
	
	pu_items = []
	vanilla_items = []
	with open("file/vanilla_output.txt") as v:
		for i in v.read().split("\n"):
			vanilla_items.append(i)
	with open("file/PU_output.txt") as p:
		for i in p.read().split("\n"):
			pu_items.append(i)
	for eq in getEquipmentList():
		if eq in pu_items:
			pu_list.append(eq)
		elif eq in vanilla_items:
			vanilla_list.append(eq)
		else:
			unused_list.append(eq)
	
	with open("file/Vanilla Items.txt","w+") as v:
		for i in vanilla_list:
			v.write(i+"\n")
	with open("file/PU Items.txt","w+") as v:
		for i in pu_list:
			v.write(i+"\n")
	with open("file/Unused Items.txt","w+") as v:
		for i in unused_list:
			v.write(i+"\n")

	print("All done!")
	input()



if __name__ == "__main__":
	mainscript()