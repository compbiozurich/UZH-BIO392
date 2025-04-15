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

### SNP 1
1. Cytogenetic Region: 10q25.2, Location: 10:112998590 
2. Intronic
3. C/G/T
4. 0.40
5. C is the most frequent allele. However, in European and Southasian populations the T occurs in ~30% of the sub-population ![image](https://github.com/user-attachments/assets/95e3210d-7263-4bfe-89a8-ff0665caed2a)
6. This study is about trying different electronic medical record systems to genetically identify Type 2 Diabetes. The variant in this study was rs7903146-T, with a p-value of 2 *10^-15 and OR of 1.46. The algorithm was able to identify the variant, achieving 98% and 100% positive predictive values for the diabetes identification. Journal: J AM Med Inform Assoc, Publication date: 2011-11-19 <https://www.ebi.ac.uk/gwas/studies/GCST001326>

### SNP 2
1. Cytogenetic region 15q21.1, Location 15:48134287
2. Missense
3. A/G/T
4. 0.50
5. There is a big diffrerence between populations. Africa has 93% G allele variant, European populations have 100% A allele variant, East Asian populations have 99% G variant![image](https://github.com/user-attachments/assets/85b1e314-bfb3-4071-a4d4-d638387f51a2)
6.This study identified different skin loci using GWAS by target sequencing on KhoeSan population that is indigenous to southern Africa. For our SNP there is a p-value of 1 * 10^-8, and a beta -3.58. Reported Trait: Skin pigmentation . Journal Cell, Publication date: 2017-11-30. <https://www.ebi.ac.uk/gwas/studies/GCST005188>

### SNP 3
1. Cytogenetic region: 19q13.32, Location: 19:44908684
2. Missense
3. T/C
4. 0.38
5. T is the most common allele variant among all the populations![image](https://github.com/user-attachments/assets/52bb3424-b597-4307-acdf-783a854b1009)
6. This GWAS analyzed dementia and found new loci associated with Alzheimer's disease. For the C risk allele the p value is 1 x 10^-62 and OR is 2.27, with a CI  of [2.5 -2.06]. Reported trait: Alzheimer's disease Journal: Alzheimers Dement, Publication date: 2019-08-13  <https://www.ebi.ac.uk/gwas/studies/GCST009020>

### SNP 4
1. Cytogenetic Region: 11p15.4, Location: 11:5227002
2. Missense
3. T/A/C/G
4. 0.14
5. T is the most common allele. In African populations A is in 10% of the population![image](https://github.com/user-attachments/assets/79b2f39a-b951-4f88-8a93-1b1ad98c568e)
6. This study looked at the loci of Hispanics/Latinos regarding red blood cell traits. The p value is 1 x 10^-10 and Beta is +1.32. Reported Trait: Hematocrit. Journal: PLoS Genet, Publication date: 2017-04-28 <https://www.ebi.ac.uk/gwas/studies/GCST004330>

### SNP 5
1. Cytogenetic Region: 15q13.1, Location: 15:28120472
2. Intronic
3. G/A/C
4. 0.43
5. A allele is the most common in almost all populations. However in European populations the G allele is 64%.![image](https://github.com/user-attachments/assets/290b4722-4238-45b3-806e-4f91ea13eec4)
6. This study quantified eye color variation into hue and saturation values. The p-value is 1 x 10^-300. Reported trait: Eye color traits. Journl: PLoS Genet, Publication date: 2010-05-16
<https://www.ebi.ac.uk/gwas/studies/GCST000685>




