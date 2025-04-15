# BIO392 - Exercise
## 🧬 SNP Exploration 
Below is a list of curated SNPs for exploration: 

---

| number | SNP (rsID)  | Gene / Region | Notable Trait / Use |
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

### **SNP 1** | 1       | rs7903146   | *TCF7L2*       | Type 2 Diabetes      |

| Attribute                   | Value                                                                 |
|----------------------------|------------------------------------------------------------------------|
| **Cytogenetic Region**     | 10q25.2                                                                |
| **Location**               | 10:112998590                                                           |
| **Variant Type**           | Intronic                                                               |
| **Alleles**                | C/G/T                                                                  |
| **Minor Allele Frequency** | 0.40                                                                   |
| **Population Notes**       | C is most frequent. T ~30% in European and South Asian populations.    |
|                            | ![image](https://github.com/user-attachments/assets/95e3210d-7263-4bfe-89a8-ff0665caed2a) |
| **Study Info**             | Study on EMRs for Type 2 Diabetes detection using rs7903146-T          |
| **p-value**                | 2 × 10⁻¹⁵                                                              |
| **Odds Ratio (OR)**        | 1.46                                                                   |
| **Predictive Value**       | 98% / 100% PPV                                                         |
| **Journal**                | *J AM Med Inform Assoc*                                                |
| **Publication Date**       | 2011-11-19                                                             |
| **Study Link on GWAS catalog**             | [Link](https://www.ebi.ac.uk/gwas/studies/GCST001326)   |


### **SNP 2**

| Attribute                   | Value                                                                 |
|----------------------------|------------------------------------------------------------------------|
| **Cytogenetic Region**     | 15q21.1                                                                |
| **Location**               | 15:48134287                                                            |
| **Variant Type**           | Missense                                                               |
| **Alleles**                | A/G/T                                                                  |
| **Minor Allele Frequency** | 0.50                                                                   |
| **Population Notes**       | Africa: 93% G, Europe: 100% A, East Asia: 99% G                        |
|                            | ![image](https://github.com/user-attachments/assets/85b1e314-bfb3-4071-a4d4-d638387f51a2) |
| **Study Info**             | GWAS in KhoeSan for skin pigmentation                                  |
| **p-value**                | 1 × 10⁻⁸                                                              |
| **Beta**                   | -3.58                                                                  |
| **Reported Trait**         | Skin pigmentation                                                      |
| **Journal**                | *Cell*                                                                 |
| **Publication Date**       | 2017-11-30                                                             |
| **Study Link**             | [Link](https://www.ebi.ac.uk/gwas/studies/GCST005188)


### **SNP 3**

| Attribute                   | Value                                                                 |
|----------------------------|------------------------------------------------------------------------|
| **Cytogenetic Region**     | 19q13.32                                                               |
| **Location**               | 19:44908684                                                            |
| **Variant Type**           | Missense                                                               |
| **Alleles**                | T/C                                                                    |
| **Minor Allele Frequency** | 0.38                                                                   |
| **Population Notes**       | T is the most common allele variant among all populations               |
|                            | ![image](https://github.com/user-attachments/assets/52bb3424-b597-4307-acdf-783a854b1009) |
| **Study Info**             | GWAS on dementia/Alzheimer’s loci (C = risk allele)                    |
| **p-value**                | 1 × 10⁻⁶²                                                              |
| **Odds Ratio (OR)**        | 2.27                                                                   |
| **Confidence Interval**    | [2.06 - 2.5]                                                           |
| **Reported Trait**         | Alzheimer’s disease                                                    |
| **Journal**                | *Alzheimers Dement*                                                    |
| **Publication Date**       | 2019-08-13                                                             |
| **Study Link**             | [Link](https://www.ebi.ac.uk/gwas/studies/GCST009020)                  |


### **SNP 4**

| Attribute                   | Value                                                                 |
|----------------------------|------------------------------------------------------------------------|
| **Cytogenetic Region**     | 11p15.4                                                                |
| **Location**               | 11:5227002                                                             |
| **Variant Type**           | Missense                                                               |
| **Alleles**                | T/A/C/G                                                                |
| **Minor Allele Frequency** | 0.14                                                                   |
| **Population Notes**       | T is most common; A = 10% in African populations                       |
|                            | ![image](https://github.com/user-attachments/assets/79b2f39a-b951-4f88-8a93-1b1ad98c568e) |
| **Study Info**             | Hispanic/Latino loci study for red blood cell traits                   |
| **p-value**                | 1 × 10⁻¹⁰                                                              |
| **Beta**                   | +1.32                                                                  |
| **Reported Trait**         | Hematocrit                                                             |
| **Journal**                | *PLoS Genet*                                                           |
| **Publication Date**       | 2017-04-28                                                             |
| **Study Link**             | [Link](https://www.ebi.ac.uk/gwas/studies/GCST004330)                  |



### **SNP 5**

| Attribute                   | Value                                                                 |
|----------------------------|------------------------------------------------------------------------|
| **Cytogenetic Region**     | 15q13.1                                                                |
| **Location**               | 15:28120472                                                            |
| **Variant Type**           | Intronic                                                               |
| **Alleles**                | G/A/C                                                                  |
| **Minor Allele Frequency** | 0.43                                                                   |
| **Population Notes**       | A is most common; G = 64% in European populations                      |
|                            |![image](https://github.com/user-attachments/assets/290b4722-4238-45b3-806e-4f91ea13eec4) |
| **Study Info**             | Eye color variation (hue/saturation) study                             |
| **p-value**                | 1 × 10⁻³⁰⁰                                                             |
| **Reported Trait**         | Eye color traits                                                       |
| **Journal**                | *PLoS Genet*                                                           |
| **Publication Date**       | 2010-05-16                                                             |
| **Study Link**             | [Link](https://www.ebi.ac.uk/gwas/studies/GCST000685)                  |




