import csv

def hastag(string):
	return(string == "YES")
	
counter = 0

with open("equipment.csv","r") as f:
	r = csv.DictReader(f)
	records = []
	for row in r:
		records.append(row)
		
	with open("Equipment - converted.csv","w",newline='') as writefile:
		newheaders = list(list(records)[0].keys())
		deletes = ["Parallel Universe","Special?","Error Immune","Show Gold","Appears For Parts","Hide Reuseable"]
		for d in deletes:
			 newheaders.remove(d)
		newheaders.insert(16,"Tags")

		writefile = csv.DictWriter(writefile, newheaders)
		
		writefile.writeheader()
		for record in records:
			tags = []
			tagreplaces = [
				["Special?","excludefromrandomlists"],
				["Error Immune","errorimmune"],
				["Show Gold","showgold"],
				["Appears For Parts","appearsforparts"],
				["Hide Reuseable","hidereuseable"]
			]
			for tagpair in tagreplaces:
				if(hastag(record[tagpair[0]])):
					tags.append(tagpair[1])
			record["Tags"] = "|".join(tags)
			for d in deletes:
				del record[d]
			writefile.writerow(record)
			counter+=1
			


print("done!")
input()



















