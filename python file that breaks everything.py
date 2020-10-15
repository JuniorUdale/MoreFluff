import csv
import re

"""
This consists of 2 parts:

* A reader. This part looks through each characters' normal/PU/BR episode
itempool generator files. Then, it extracts all strings from them. It also
cross-references them with equipment.csv to double-check that it's only
returning strings that actually are equipment.

* A writer. This part checks all equipment, then plonks it into
equipment_generators.csv. This is a spreadsheet which will contain information
about where items can be found. It'll be a useful spreadsheet to use since it'll
let me check where equipment are, and make better organizational steps in
including future items in fluff etc etc yadda yadda let's get coding!
"""

def findstrings(file):
    #Returns a list of values between strings in a file.
    output = None
    with open(file,"r") as f:
        string = f.read()
        output = re.findall(r'"(.*?)"', string)
    return output

def findallstrings():
    chars = ["warrior","thief","robot","inventor","witch","jester"]
    epsds = ["normal","paralleluniverse","remixgenerator"]
    l = []
    for c in chars:
        for e in epsds:
            s = c + "_" + e
            l.append(findstrings("data/text/scripts/diceydungeons/itempools/"+s+"/morefluff.hx"))
    return l
    

