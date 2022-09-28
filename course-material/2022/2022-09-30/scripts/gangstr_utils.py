import numpy as np
import pandas as pd

def load_gangstr_output(df_str_loci: pd.DataFrame, gangstr_file: str) -> pd.DataFrame:
    df_gangstr = {
        "chr": [],
        "start": [],
        "ref": [],
        "alt": []
    }
    with open(gangstr_file, "r") as f:
        for line in f:
            if line.startswith("#"):
                continue
            line_split = line.strip().split("\t")
            df_gangstr["chr"].append(line_split[0])
            df_gangstr["start"].append(int(line_split[1]))
            ref_len = len(line_split[3])
            df_gangstr["ref"].append(ref_len)
            df_gangstr["alt"].append(ref_len if line_split[4] == "." else len(line_split[4]))
    df_gangstr = pd.DataFrame(df_gangstr)
    df_gangstr = (df_str_loci
                    .merge(
                        df_gangstr, 
                        on=["chr", "start"], 
                        how="left")
                    .assign(
                        ref = lambda x: x.ref / x.unit_len,
                        alt = lambda x: x.alt / x.unit_len)
                    .astype({"ref": int, "alt": int}))

    return df_gangstr

def merge_samples(sample1: pd.DataFrame, sample2: pd.DataFrame) -> pd.DataFrame:
    df_combined = (sample1.rename(columns={"alt": "alt_s1"})
                        .merge(sample2.rename(columns={"alt": "alt_s2"}))
                        .assign(sample_difference = lambda x: x.alt_s2 - x.alt_s1))
    return df_combined
