import csv
import pandas as pd

file = open("data.pgxseg", "r")
data = file.read()

#lines = data.split("\n")
#print(type(lines))
#for line in lines:
    #print(line)




df = pd.read_csv("data.pgxseg", sep = "\t", skiprows = 1006,)




#data = file.read()


#csvreader = csv.reader(file)

#print(type(df))



#header = []
#header = next(csvreader)



#header = next(csvreader)




