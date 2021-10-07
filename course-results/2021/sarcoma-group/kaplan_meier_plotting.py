from lifelines import KaplanMeierFitter
from lifelines.datasets import load_waltons
import matplotlib.pyplot as plt

waltons = load_waltons()

kmf = KaplanMeierFitter(label="waltons_data")
kmf.fit(waltons['T'], waltons['E'])
kmf.plot()

plt.show()
