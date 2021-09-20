# Genome Resources and databases

## 1. ClinVar [link](https://www.ncbi.nlm.nih.gov/clinvar/)
ClinVar focuses on the variants and their link to clinical phenotype. See Day-02. 

Disease | Gene | Variant(s) 
:-------|:-----|:----------
beta-thalassemia | HBB | NC_000011.10:g.5225158_5227199delinsCTTAT		\ NC_000011.9:g.5246388_5248429delinsCTTAT		\ NG_000007.3:g.70417_72458delinsATAAG \ NG_042296.1:g.3_730delinsTAT		\ NG_046672.1:g.3093_5134delinsCTTAT		\ NG_053049.1:g.1479_3011delinsCTTAT		\ NG_059281.1:g.4873_6914delinsATAAG |
MYH-associated polyposis (or APF) | MUTYH | NC_000001.11:g.45329096_45333380del4285insTA		\ NM_001128425.1:c.348+33_*210delinsTA		\ LRG_220t1:c.348+33_*210delinsTA		\ LRG_220:g.12091_16375delinsTA | 
Marfan Syndrome | TGFb2 | NM_003238.6:c.622delinsGG MANE SELECT (frameshift) \ NM_001135599.4:c.706delinsGG (frameshift) |
Addison's disease | PTPN | NM_015967.7(PTPN22):c.1858C>T (p.Arg620Trp) (missense) | 
Von Hippel Lindau Syndrome | VHL | NC_000003.11:g.(?_10094061)_(10191659_?)del \ NC_000003.11:g.(?_10094061)_(10191659_?)dup \ NM_000551.3(VHL):c.-195G>A \ NM_000551.3(VHL):c.-75_-55del| 



## 2. ClinGen [link](https://clinicalgenome.org)
Clinical genome resource specially focuses on the gene and its possible variant(s) and associated phenotype(s). 

 Gene name | HGNC ID | chr location (hg38) | Gene product (protein function) |  disease | Calculated classification
:----------|:--------|:--------------------|:--------------------------------|:---------|:--------------------------
NOX1 | HGNC:7889 | chrX:100,843,324-100,874,359 | NADPH Oxidase 1 | not found | not found
APC | HGNC:583 | chr5:112,737,885-112,846,239 | APC | APC-related attenuated familial adenomatous polyposis  | Definitive 
TP53 | HGNC:11998 | chr17:7,668,402-7,687,538 | TP53 | Li-Fraumeni syndrome 1 | Definitive
CDKN2A | HGNC:1787 | chr9:21,967,753-21,975,098 | CDKN2A | melanoma-pancreatic cancer syndrome | Definitive 
KRAS | HGNC:6407 | chr12:25,205,246-25,250,929 | KRAS | Noonan Syndrome | 3C (high evidence)


As Nox1, a lot of genes, that I lokked for, were not curated (CD146, EGLN1/2/3, EPAS1, BCL2, OLFM3, ERBB2). 

## 3. Progenetix [link](https://www.progenetix.org) 
Progenetix is a database collecting and commenting CNVs/CNAs for all types of human malignancies. Through the platform, we can search either by cancer types or CNVs in gene(s) of interest. Beside that, it lists the attached publications as well as data visualization. The data were acquired by the following techniques: CGH and  Whole Genome or Whole Exome Sequecing. 542 cancer types!  


**Definition**: 
* **Beacon**: "is a federated, web-accessible service that can be queried for information about a specific genomic variant, e.g. a single nucleotide polymorphism (SNP/SNV) or a copy number variation (CNV), and reports about its existence in the queried resources". 
