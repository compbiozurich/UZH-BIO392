
# get the data

fyle = open("data.pgxseg")
header = fyle.readlines()[1006]
f = fyle.readlines()[1007:-1]

header = [header]

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

df = pd.DataFrame(f, columns = header)
#table = table(df.values, df.columns)

#plt.show()

from tabulate import tabulate

table = f
print(tabulate(table))


counter = 0
new = []
for line in f:
    counter += 1
    print(counter, line)

    x = counter, line
    new.append(x)

#%%
import pada as pd

df = pd.DataFrame({})
with open("data.gpxseg", newline = "") as segile:
    for line in segfile.readlines():
        if "#" not in line:
            with open("data.csv", "a+") as f:
                f.write(line)

df = pd.read_csv("data.csv", seq = "\t")
print(df)





