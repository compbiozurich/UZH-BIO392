import pandas as pd

file_path = "data.pgxseg"
start_string = "biosample_id\treference_name\tstart\tend\tlog2\tvariant_type\treference_bases\talternate_bases"

def create_dataframe(file_path, start_string):
    data = open(file_path)
    data_string = data.read()
    lines = data_string.split("\n")
    data.close()

    start = 0
    for line in range(0, len(lines)):
        if lines[line] == start_string:
            start = line
    curated_lines = lines[start + 1:]

    new=[]
    for line in curated_lines:
        new.append(line.split("\t"))

    names=lines[start].split("\t")

    df = pd.DataFrame(new, columns=names)
    return df

df = create_dataframe(file_path, start_string)
print(df)
