# import packages
import numpy as np
import pandas as pd
import csv

# initialize empty dataframe
df = pd.DataFrame({})

# read file and create new .csv file
data = 'data.pgxseg'
with open(data, newline='') as f:
    for line in f.readlines(): # read each line in the original file
        if '#' not in line: # skip the first 1006 lines
            with open('table.cvs', 'a+') as new_file:
                new_file.write(line)

# check new file
df = pd.read_csv('table.cvs', sep='\t')
print(df)

# code inspired by your solutions
