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

### **SNP 1**   
rs7903146, *TCF7L2*, Type 2 Diabetes

| Attribute                   | Value                                                                 |
|----------------------------|------------------------------------------------------------------------|
| **Cytogenetic Region**     | 10q25.2                                                                |
| **Location**               | 10:112998590                                                           |
| **Variant Type**           | Intronic                                                               |
| **Alleles**                | C -> G/T                                                               |
| **Minor Allele Frequency** | 0.40                                                                   |
| **Population Notes**       | The SNP has the highest occurrence in Europe, followed by South Asia.    |
|                            | ![image](https://github.com/user-attachments/assets/95e3210d-7263-4bfe-89a8-ff0665caed2a) |
| **Study Info**             |Evidence for genetic contribution to the increased risk of type 2 diabetes in schizophrenia         |
| **Associated traits or disease** | Schizophrenia, type 2 diabetes                                    |
| **p-value**                | 1 × 10^-9                                                              |
| **Odds Ratio (OR)**        | 1.53                                                                   |
| **Journal**                | *Transl Psychiatry*                                                |
| **Publication Date**       | 2018-11-23                                                             |
| **Study Link on GWAS catalog**             | [Link](https://www.ebi.ac.uk/gwas/studies/GCST007223)   |


### **SNP 2** 
rs1426654, *SLC24A5*, Skin Pigmentation

| Attribute                   | Value                                                                 |
|----------------------------|------------------------------------------------------------------------|
| **Cytogenetic Region**     | 15q21.1                                                                |
| **Location**               | 15:48134287                                                            |
| **Variant Type**           | Missense                                                               |
| **Alleles**                | A -> G/T                                                                  |
| **Minor Allele Frequency** | 0.50                                                                   |
| **Population Notes**       | Most present in East Asia, followed by Africa and least in Europe.                        |
|                            | ![image](https://github.com/user-attachments/assets/85b1e314-bfb3-4071-a4d4-d638387f51a2) |
| **Study Info**             | Latin Americans identifies novel face shape loci, implicating VPS13B and a Denisovan introgressed region in facial variation.                                  |
| **p-value**                | 4 × 10^-6                                                              |
| **Reported Trait**         | Facial morphology                                                      |
| **Journal**                | *Sci Adv*                                                                 |
| **Publication Date**       | 2021-02-05                                                             |
| **Study Link**             | [Link](https://www.ebi.ac.uk/gwas/studies/GCST90026564)


### **SNP 3** 
rs429358, *APOE*, Alzheimer's Disease

| Attribute                   | Value                                                                 |
|----------------------------|------------------------------------------------------------------------|
| **Cytogenetic Region**     | 19q13.32                                                               |
| **Location**               | 19:44908684                                                            |
| **Variant Type**           | Missense                                                               |
| **Alleles**                | T -> C                                                                    |
| **Minor Allele Frequency** | 0.38                                                                   |
| **Population Notes**       | The SNP is most there in Africa, and least in east and South Asia.               |
|                            | ![image](https://github.com/user-attachments/assets/52bb3424-b597-4307-acdf-783a854b1009) |
| **Study Info**             |Genome-wide association analysis of dementia and its clinical endophenotypes reveal novel loci associated with Alzheimer's disease and three causality networks: The GR@ACE project.                    |
| **p-value**                | 1 × 10^-62                                                              |
| **Odds Ratio (OR)**        | 2.27                                                                   |
| **Reported Trait**         | Alzheimer’s disease                                                    |
| **Journal**                | *Alzheimer's Dement*                                                    |
| **Publication Date**       | 2019-08-13                                                             |
| **Study Link**             | [Link](https://www.ebi.ac.uk/gwas/studies/GCST009020)                  |


### **SNP 4** 
rs334, *HBB*, Sickle Cell Anemia

| Attribute                   | Value                                                                 |
|----------------------------|------------------------------------------------------------------------|
| **Cytogenetic Region**     | 11p15.4                                                                |
| **Location**               | 11:5227002                                                             |
| **Variant Type**           | Missense                                                               |
| **Alleles**                | T -> A/C/G                                                                |
| **Minor Allele Frequency** | 0.14                                                                   |
| **Population Notes**       | The SNP is very rare and most present in Africa, almost absent in all other populations.                       |
|                            | ![image](https://github.com/user-attachments/assets/79b2f39a-b951-4f88-8a93-1b1ad98c568e) |
| **Study Info**             | Complimentary Methods for Multivariate Genome-Wide Association Study Identify New Susceptibility Genes for Blood Cell Traits.                   |
| **p-value**                | 6 × 10^-17                                                              |
| **Reported Trait**         | Red cell distribution width                                                             |
| **Journal**                | *Front Genet*                                                           |
| **Publication Date**       | 2019-04-26                                                             |
| **Study Link**             | [Link](https://www.ebi.ac.uk/gwas/studies/GCST008333)                  |



### **SNP 5** 
rs12913832, *HERC2*, Eye Color

| Attribute                   | Value                                                                 |
|----------------------------|------------------------------------------------------------------------|
| **Cytogenetic Region**     | 15q13.1                                                                |
| **Location**               | 15:28120472                                                            |
| **Variant Type**           | Intronic                                                               |
| **Alleles**                | G -> A/C (GWAS), A -> C/G (ensembl, VCF)|
| **Minor Allele Frequency** | 0.43                                                                   |
| **Population Notes**       | This SNP is mostly found in Europeans, followed by americans. Least in east asia.                      |
|                            |![image](https://github.com/user-attachments/assets/290b4722-4238-45b3-806e-4f91ea13eec4) |
| **Study Info**             | Digital quantification of human eye color highlights genetic association of three new loci.                             |
| **p-value**                | 1 × 10^-300                                                             |
| **Reported Trait**         | Eye color traits                                                       |
| **Journal**                | *PLoS Genet*                                                           |
| **Publication Date**       | 2010-05-16                                                             |
| **Study Link**             | [Link](https://www.ebi.ac.uk/gwas/studies/GCST000685)                  |
