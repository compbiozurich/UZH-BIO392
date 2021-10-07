### Functions to get gene data
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

    # print(len(ids),len(gene_data))

    return cancer, gene_data

