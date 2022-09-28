from collections import Counter

# numpy and pandas are libraries to work with structured data
import numpy as np
import pandas as pd
# matplotlib and seaborn are used for making plots
import matplotlib.pyplot as plt
import seaborn as sns
sns.set_context("poster")

# we also need some classes from TRAL, to work with repeats
from tral.repeat.repeat import Repeat
from tral.repeat_list.repeat_list import RepeatList


def sort_repeatlist(repeat_list: RepeatList) -> RepeatList:
    return RepeatList(repeats = sorted(repeat_list.repeats, key=lambda x: x.begin))

def repeat_list_to_df(repeat_list: RepeatList) -> pd.DataFrame:
    df = {
        "chr": [], 
        "start": [],
        "end": [],
        "unit_len": [],
        "unit": []
    }
    
    for repeat in repeat_list.repeats:
        df["chr"].append("chr5")
        df["start"].append(repeat.begin)
        df["end"].append(repeat.begin + repeat.repeat_region_length - 1)
        df["unit_len"].append(repeat.l_effective)
        df["unit"].append(get_most_common_unit(repeat))
        
    return pd.DataFrame(df).dropna()
        
def get_most_common_unit(repeat: Repeat) -> str:
    if any("-" in unit for unit in repeat.msa):
        return np.nan
    counter = Counter(repeat.msa)
    return counter.most_common(1)[0][0]

def plot_repeatlist(to_plot):
    if isinstance(to_plot, RepeatList):
        to_plot = repeat_list_to_df(to_plot)
    fig = plt.figure(figsize=(15, 10))
    ax = sns.histplot(
        data = (to_plot
                    .assign(
                        repeat_len = lambda x: (x.end - x.start + 1), 
                        unit_len = lambda x: pd.Categorical(x.unit_len, ordered=True))),
        x="repeat_len",
        hue = "unit_len",
        multiple="stack",
        discrete=True
    )
    
    ax.set(xlabel="Repeat region length (nt)")
    ax.legend_.set_title("Repeat unit size (nt)")
    
    plt.show()
    
def low_quality_repeat(repeat: Repeat, max_pval: float, max_div: float, min_repeat_copies: dict) -> bool:
    try:
        if repeat.n < min_repeat_copies[repeat.l_effective]:
            return True
    except KeyError:
        return True
    
    if repeat.d_pvalue["phylo_gap01"] > max_pval:
        return True
    if repeat.d_divergence["phylo_gap01"] > max_div:
        return True
    
    return False

