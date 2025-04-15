# BIO392 - Exercise
These questions are designed to test your understanding of the course.

## 🧬 SNP Exploration 
Below is a list of curated SNPs for exploration: 

---

| Number | SNP (rsID)  | Gene / Region | Notable Trait / Use |
|---------|-------------|----------------|----------------------|
| 1       | rs7903146   | *TCF7L2*       | Type 2 Diabetes      |
| 2       | rs1426654   | *SLC24A5*      | Skin Pigmentation    |
| 3       | rs429358    | *APOE*         | Alzheimer's Disease  |
| 4       | rs334       | *HBB*          | Sickle Cell Anemia   |
| 5       | rs12913832  | *HERC2*        | Eye Color            |

---

Please investigate each of SNP using the following databases:

- **GWAS Catalog**: https://www.ebi.ac.uk/gwas  
- **Ensembl Variant Browser**: https://www.ensembl.org
  
## 📌 **Tip**
- Use the LocusZoom in GWAS Catalog and population frequency features in Ensembl to explore regulatory impact and population distribution!
- Refer to this link for guidance on the GWAS Catalog, https://www.ebi.ac.uk/training/online/courses/gwas-catalogue-exploring-snp-trait-associations/

## 🔍 Tasks
For each SNP, answer the following:

1. What chromosome and position is the SNP on?
2. What is the variant type? (e.g., intronic, missense)
3. What are the reference and alternate alleles?
4. What is the minor allele frequency (MAF)?
5. What is the allele frequency of this SNP in different populations (e.g., AFR, EUR, EAS)? What differences do you observe? You may include figures (e.g., allele frequency charts from Ensembl) to illustrate your observations.
6. Choose one GWAS study involving the SNP and describe the associated trait or disease, including the reported p-value, effect size (OR or beta), publication details, predicted functional consequences, and include a link to the study from the GWAS Catalog.

### SNP1
rs7903146, *TCF7L2*, Type 2 Diabetes
1. 10q25.2
2. intronic
3. C -> G/T
4. 0.4
5. The SNP has the highest occurrence in Europe, followed by South Asia.\
![Population variation](image.png) \
[Link](https://www.ensembl.org/Homo_sapiens/Variation/Population?db=core;r=10:112998090-112999090;v=rs7903146;vdb=variation;vf=654566937)
6. associated trait or disease: Schizophrenia, type 2 diabetes\
p-value: 1 x 10^-9\
effect size (OR or beta): - \
publication details: 2018-11-23, Transl Psychiatry, Evidence for genetic contribution to the increased risk of type 2 diabetes in schizophrenia.\ 
predicted functional consequences: schizophrenia, type 2 diabetes mellitus\
link to the study from the GWAS Catalog: https://www.ebi.ac.uk/gwas/studies/GCST007223

### SNP2
rs1426654, *SLC24A5*, Skin Pigmentation
1. 15q21.1
2. missense
3. A -> G/T
4. 0.5
5. Most present in East Asia, followed by Africa and least in Europe.\
![Population variation](image-1.png) \
[Link](https://www.ensembl.org/Homo_sapiens/Variation/Population?db=core;r=15:48133787-48134787;v=rs1426654;vdb=variation;vf=887144584)
6. associated trait or disease: Facial morphology (lip thickness 1) \
p-value: 4 x 10^-6 \
effect size (OR or beta): - \
publication details: 2021-02-05, Sci Adv, A GWAS in Latin Americans identifies novel face shape loci, implicating VPS13B and a Denisovan introgressed region in facial variation.\
predicted functional consequences: lip morphology trait\
link to the study from the GWAS Catalog: https://www.ebi.ac.uk/gwas/studies/GCST90026564

### SNP3
rs429358, *APOE*, Alzheimer's Disease
1. 19q13.32
2. missense
3. T -> C
4. 0.38
5. The SNP is most there in Africa, and least in east and South Asia.\
![Population variation](image-2.png) \
[Link](https://www.ensembl.org/Homo_sapiens/Variation/Population?db=core;r=19:44908184-44909184;v=rs429358;vdb=variation;vf=1024576105)
6. associated trait or disease: Alzheimer’s disease\
p-value: 1 x 10^-62\
effect size (OR or beta): -\
publication details: 2019-08-13, Alzheimers Dement, Genome-wide association analysis of dementia and its clinical endophenotypes reveal novel loci associated with Alzheimer's disease and three causality networks: The GR@ACE project.\
predicted functional consequences: Alzheimer’s disease\
link to the study from the GWAS Catalog: https://www.ebi.ac.uk/gwas/studies/GCST009020

### SNP4
rs334, *HBB*, Sickle Cell Anemia
1. 11p15.4
2. missense
3. T -> A/C/G
4. 0.14
5. The SNP is very rare and most present in Africa, almost absent in all other populations.\
![Population variation](image-3.png) \
[Link](https://www.ensembl.org/Homo_sapiens/Variation/Population?db=core;r=11:5226502-5227502;v=rs334;vdb=variation;vf=706421787)
6. associated trait or disease: Sickle cell disease\
p-value: 6 x 10^-17\
effect size (OR or beta): -\
publication details: 2019-04-26, Front Genet, Complimentary Methods for Multivariate Genome-Wide Association Study Identify New Susceptibility Genes for Blood Cell Traits.\
predicted functional consequences: Red cell distribution width\
link to the study from the GWAS Catalog: https://www.ebi.ac.uk/gwas/studies/GCST008333

### SNP5
rs12913832, *HERC2*, Eye Color
1. 15q13.1
2. intronic
3. G -> A/C (GWAS)\
A -> C/G (ensembl, VCF)
4. 0.43
5. This SNP is mostly found in Europeans, followed by americans. Least in east asia. \
![Population variation](image-4.png) \
[Link](https://www.ensembl.org/Homo_sapiens/Variation/Population?db=core;r=15:28119972-28120972;v=rs12913832;vdb=variation;vf=887367687)
6. associated trait or disease: Eye colour\
p-value: 1 x 10^-300\
effect size (OR or beta): -\
publication details: 2010-05-16, PLoS Genet, Digital quantification of human eye color highlights genetic association of three new loci.\
predicted functional consequences: different eye colour\
link to the study from the GWAS Catalog: https://www.ebi.ac.uk/gwas/studies/GCST000685
