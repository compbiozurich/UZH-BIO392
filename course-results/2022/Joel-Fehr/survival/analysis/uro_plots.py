
#==============================================================================#
# Imports =====================================================================#
import pandas as pd
import numpy as np
import kaplanmeier as km
import matplotlib.pyplot as plt
#==============================================================================#

dataset = pd.read_csv("../uro_data/uro_final.csv")

######### KM plot ########################
# Compute Survival
time = dataset["follow_up"]
event = dataset["death"]
group = [dataset["CDKN2A"], dataset["ERB2"], dataset["myc"], dataset["TP53"]]
results = km.fit(time, event, group)
# Plot
km.plot(results)
plt.show()
