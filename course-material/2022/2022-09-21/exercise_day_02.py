import pandas as pd
import csv
import requests
# df=pd.DataFrame({})
# with open('data.pgxseg', newline='') as segfile:
#     for line in segfile.readlines():
#         if '#' not in line:
#             with open('data.csv','a+') as f:
#                 f.write(line)
#
#
# df = pd.read_csv('data.csv',sep='\t')

url = 'https://progenetix.org/beacon/variants/?output=pgxseg&filters=NCIT:C3030'
request = requests.get(url)
line = request.text.splitlines()
seg_list = []


for items in line:

    if '#' not in items:
        seg_list.append(items.split('\t'))

columns = seg_list[0]
del (seg_list[0])
del (seg_list[len(seg_list)-1])
df = pd.DataFrame(seg_list, columns=columns)

print(1)
