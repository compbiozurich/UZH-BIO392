#exercise day 2: my attempt
import numpy as np
import pandas as pd


dat = open("data.pgxseg", 'r')     #open data frame
d = dat.readlines()
print(d)

col= ['sample', 'ref', 'start', 'end', 'log2', 'var.type', 'ref.base', 'alt.base']  #create column names
df= pd.DataFrame( columns= col)
print(df)       # i was not able to finish the exercise



#example solution script
df = pd.DataFrame({})
with open('datapgxseq', newline='') as segfile:
    for line in segfile.readlines():
        if "#" not in line:
            with open('data.csv', 'a+') as f:
                f.write(line)
df = pd.read_csv('data.csv',sep='\t')
Footer
