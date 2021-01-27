import csv

def count():
        finallist = []
        with open("equipment.csv",newline="",mode="r") as csvfile:
                csv_reader = csv.reader(csvfile, delimiter=",")
                line_count = 0
                for row in csv_reader:
                        if line_count == 0:
                            print()
                            line_count += 1
                        else:
                            if len(row[0].split("_")) == 1 and row[0].split("@")[0] not in finallist and len(row[0].split("?")) == 1:
                                    finallist.append(row[0].split("@")[0])
                                    print(str(len(finallist))+": "+row[0])
                            line_count += 1
        return finallist
                
if __name__ == "__main__":
        listy = count()
        print("")
        print("Total number of items: "+str(len(listy)))
        input()
