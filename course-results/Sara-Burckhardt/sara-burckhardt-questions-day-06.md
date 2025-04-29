# BIO392 - Exercise
These questions are designed to test your understanding of the course. Please change the name of this file to \<First name\>-\<Last name\>-questions-day-06.md, and upload it to your folder in the course GitHub. 

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

## Answers: 
Questions 1-4:
---

| number | SNP (rsID)  | Gene / Region | Notable Trait / Use | Chromosome, Position | variant type | reference, alternate alleles(forward strand) | MAF    | 
|---------|-------------|----------------|----------------------|-------------------|----------------------|----------------|-------------|
| 1       | rs7903146   | *TCF7L2*       | Type 2 Diabetes      |10q25.2            |intron variant   |C/G/T|0.40 |  
| 2       | rs1426654   | *SLC24A5*      | Skin Pigmentation    |15q21.1            |Missense variant |A/G/T     |0.50|
| 3       | rs429358    | *APOE*         | Alzheimer's Disease  |19q13.32           |Missense variant |T/C      |0.38|
| 4       | rs334       | *HBB*          | Sickle Cell Anemia   |11p15.4    | Missense variant  |T/A/C/G                 | 0.14   |
| 5   selected variation: 15:28120472 | rs12913832  | *HERC2*        | Eye Color            |15q13.1    |intron variation     |A/C/G         | 0.43       |

---
Question 5:
* 1. ALL and AMR (C:77%, t:23%), AFR (C:74%, T:26%), EAS (C:98%, T:2%), EUR (C:68%. T:32%), SAS (C:70%, T:30%) 
Figure: ![grafik](https://github.com/user-attachments/assets/e1597d7b-0c84-4c43-9719-819e5cd79d42)
In general the C allel is more frequent than the T, mostly abroung 70%. Expect in the EAS population there the T is much less frequent and mostly only C occures. 

* 2. In EUR only the allel A occures, while in EAS the G is spread. In the other regions is is more mixed. 
Figure: ![grafik](https://github.com/user-attachments/assets/7e25c771-8ec7-4704-8db7-acba90ef6ccd)

* 3. The T allel is more frequent than the C allel (9-16%). In the AFR population the C is a bit more frequent than in the others (29%) 
Figure: ![grafik](https://github.com/user-attachments/assets/7a032df5-ef14-4261-a3a5-9332dd564992)

* 4. Although all types of allels are set, in most regions only the T occurs. In AFR the A allel is also spread by 10%. 
Figure: ![grafik](https://github.com/user-attachments/assets/2cf998eb-ede5-4a0d-8855-4ff48ef1b9e8)

* 5. In EUR the G allel is more spread while in the other region the A is more spread. 
Figure: ![grafik](https://github.com/user-attachments/assets/01a2809e-e45b-427e-a558-c502737f02da)


Question 6: 
|number | traits | p-value | OR/Beta | publication details |link|
|-------|---------|--------|-----------|-------------------|----------------------------------|
|1      |isulin measurement | 2 x 10^-20 | - |Diabetes, 2011-08-26| [link](https://www.ebi.ac.uk/gwas/studies/GCST001212)
|2      |skin pigmentation | 3 x 10^-7|0.259952 unit increase|BMC Genet, 2019-07-17 | [link](https://www.ebi.ac.uk/gwas/studies/GCST008518)|
|3      |Cerebral amyloid deposition positivity (PET imaging)| 5 x 10^-20| 4.72 |PLoS One| [link](https://www.ebi.ac.uk/gwas/variants/rs429358)
|4      |malaria | 9 x 10^-13| 7.633588| PLoS Genet, 2018-01-30| [link](https://www.ebi.ac.uk/gwas/studies/GCST005356)|
|5    | asthma, response to diisocyanate | 7 x 10^-14| 3.48| Toxicol Sci, 2015-04-26| [link](https://www.ebi.ac.uk/gwas/studies/GCST002875)|

