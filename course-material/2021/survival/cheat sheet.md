### Functions to get gene data

###

def transform_to_df(data):
    data = pd.DataFrame(data)
    data.columns = data.iloc[0]
    data = data[1:]
    return data

def get_gene_data(cancer_type,gene_name):
    with open(‘/folder/BIO392/'+ cancer_type + '.csv', 'r') as read_obj:
        csv_reader = csv.reader(read_obj)
        cancer = list(csv_reader)
        # header = cancer[0]

    ids = []
    for id in cancer:
        ids.append(id[14])

    with open('/folder/BIO392/'+ cancer_type+ '_' + gene_name + '.csv', 'r') as read_obj:
        csv_reader = csv.reader(read_obj)
        gene_all = list(csv_reader)
        # header2 = gene_all[0]

    gene_data = []
    for line in gene_all:
        if line[14] in ids:
            gene_data.append(line)

    cancerdf = transform_to_df(cancer)
    genedf = transform_to_df(gene_data)

    # print(len(ids),len(gene_data))

    return cancerdf, genedf

sarcoma, tp53 =  get_gene_data('sarcoma','tp53del')
sarcomanum = sarcoma.apply(pd.to_numeric, errors='coerce').fillna(sarcoma)
    
## boxplot
NCIT = sarcomanum['histologicalDiagnosis.label'].unique()
i=0
while i < len(NCIT):
    mean = sarcomanum.groupby("histologicalDiagnosis.label").get_group(NCIT[i])

    ax=plt.subplot(2, 4, i+1)
    mean.boxplot(fontsize=5)
    ax.set_xticklabels(['cnvcoverage','delcoverage','dupcoverage','death'],rotation=90)
    ax.set_title(NCIT[i],fontsize=7)


    i=i+1
    
## KM analysis

while i < len(NCIT):
    group = sarcomanum.groupby("histologicalDiagnosis.label").get_group(NCIT[i])
    kmf = KaplanMeierFitter()
    durations = group['info.cnvstatistics.cnvcoverage']
    event_observed = group['info.death']
    kmf.fit(durations, event_observed, label=NCIT[i], xlael='cnvcoverage')
    kmf.plot(ci_show=False)



    i=i+1
    
plt.show()

