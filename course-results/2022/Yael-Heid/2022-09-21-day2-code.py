import pandas as pd
with open('data.pgxseg') as file_in:
    lines=[]
    for line in file_in:
        lines.append(line)
data=lines[1007:-1]
data_new=[]
for c in data:
    data_new.append(c.split('\t'))

biosample_id=[]
reference_name=[]
start=[]
end=[]
log2=[]
variant_type=[]
reference_bases=[]
alternate_bases=[]

for single_line in data_new:
    biosample_id.append(single_line[0])
    reference_name.append(single_line[1])
    start.append(single_line[2])
    end.append(single_line[3])
    log2.append(single_line[4])
    variant_type.append(single_line[5])
    reference_bases.append(single_line[6])
    alternate_bases.append(single_line[7][:-1])

zip_list=list(zip(biosample_id,reference_name,start, end, log2, variant_type,reference_bases,alternate_bases))
dataframe = pd.DataFrame(zip_list,columns=['biosample_id','reference_name','start', 'end', 'log2', 'variant_type','reference_bases', 'alternate_bases'])
print(dataframe.loc[5:10])