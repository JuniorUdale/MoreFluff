import csv
import os
import itemfinder


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
        writes out a list of equipment, and the episodes it appears in
        
        """
        gens = ["robot_youchooseyoulose","jester_finderskeepers","thief_finderskeepers","jester_warrior","inventor_rust","thief_uptick"]
        pref = ["warrior","thief","robot","inventor","witch","jester"]
        for p in pref:
                gens.append(p+"_normal")
        eqs = {}
        for g in gens:
                eqs[g] = itemfinder.mainscript(g)
        for p in pref:
                pu = p + "_paralleluniverse"
                br = p + "_remixgenerator"
                eqs[pu] = itemfinder.mainscript(pu)
                eqs[br] = itemfinder.mainscript(br)
        outfile = open("file/equipment_list.txt","w+")
        for eq in getEquipmentList():
                outfile.write(eq+"\n")
                for e in eqs:
                        if eq in eqs[e]:
                                outfile.write("* "+e+"\n")                        
                outfile.write("------\n")
                
if __name__ == "__main__":
        mainscript()
