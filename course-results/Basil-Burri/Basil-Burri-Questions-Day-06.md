# Exercise by Basil Burri

## 🧬 SNP Exploration 
Below is a list of curated SNPs for exploration: 

| number  | SNP (rsID)  | Gene / Region  | Notable Trait / Use  |
|---------|-------------|----------------|----------------------|
| 1       | rs7903146   | *TCF7L2*       | Type 2 Diabetes      |
| 2       | rs1426654   | *SLC24A5*      | Skin Pigmentation    |
| 3       | rs429358    | *APOE*         | Alzheimer's Disease  |
| 4       | rs334       | *HBB*          | Sickle Cell Anemia   |
| 5       | rs12913832  | *HERC2*        | Eye Color            |

Please investigate each SNP using the following databases:

- **GWAS Catalog**: https://www.ebi.ac.uk/gwas  
- **Ensembl Variant Browser**: https://www.ensembl.org
  
## 📌 **Tip**
- Use the LocusZoom in GWAS Catalog and population frequency features in Ensembl to explore regulatory impact and population distribution!
- Refer to this link for guidance on the GWAS Catalog, https://www.ebi.ac.uk/training/online/courses/gwas-catalogue-exploring-snp-trait-associations/

## 🔍 Tasks

1. What chromosome and position is the SNP on?
2. What is the variant type?
3. What are the reference and alternate alleles?

| number  | SNP (rsID)  | Gene        | Notable Trait        | Location | Variant  | Reference allele / Alternative allele(s) |
|---------|-------------|-------------|----------------------|----------|----------|------------------------------------------|
| 1       | rs7903146   | *TCF7L2*    | Type 2 Diabetes      | 10q25.2  | Intron   | C/G/T (forward strand)                   |
| 2       | rs1426654   | *SLC24A5*   | Skin Pigmentation    | 15q21.1  | Missense | A/G/T (forward strand)                   |
| 3       | rs429358    | *APOE*      | Alzheimer's Disease  | 19q13.32 | Missense | T/C (forward strand)                     |
| 4       | rs334       | *HBB*       | Sickle Cell Anemia   | 11p15.4  | Missense | T/A/C/G (forward strand)                 |
| 5       | rs12913832  | *HERC2*     | Eye Color            | 15q13.1  | Intron   | A/C/G (forward strand)                   |
---

4. What is the minor allele frequency (MAF)?
5. What is the allele frequency of this SNP in different populations (e.g., AFR, EUR, EAS)? What differences do you observe? You may include figures (e.g., allele frequency charts from Ensembl) to illustrate your observations.

| number  | SNP (rsID)  | Gene        | Notable Trait        |  MAF     | Freq. AFR  | Freq. EAS  | Freq. EUR |
|---------|-------------|-------------|----------------------|----------|------------|------------|-----------|
| 1       | rs7903146   | *TCF7L2*    | Type 2 Diabetes      |  0.40    | 26%        | 2%         | 32%       |
| 2       | rs1426654   | *SLC24A5*   | Skin Pigmentation    |  0.50    | 93%        | 99%        | 0%        |
| 3       | rs429358    | *APOE*      | Alzheimer's Disease  |  0.38    | 27%        | 9%         | 16%       |
| 4       | rs334       | *HBB*       | Sickle Cell Anemia   |  0.14    | 10%        | 0%         | 0%        |
| 5       | rs12913832  | *HERC2*     | Eye Color            |  0.43    |  3%        | %G:        | 64%       |
---

6. Choose one GWAS study involving the SNP and describe the associated trait or disease, including the reported p-value, effect size (OR or beta), publication details, predicted functional consequences, and include a link to the study from the GWAS Catalog.

|                             |                                                                                                 |
|-----------------------------|-------------------------------------------------------------------------------------------------|
| **SNP**                     | rs7903146                                                                                       |
| **Gene**                    | _TCF7L2_                                                                                        |
| **Biotype**                 | protein_coding                                                                                  | 
| **Function**                | Transcription factor 7 like 2                                                                   | 
| **Variant and risk allele** | rs7903146-T                                                                                     | 
| **Disease**                 | Type 2 diabetes mellitus                                                                        |
| *Diseace description**      | Isulin does not work properly or there is not enough of it. This causes the level of blood glucose to become too high. It affects adults and sometimes children. [Source](https://www.nhs.uk/conditions/type-2-diabetes/)  | 
| **p-value**                 | 4x10-73 (female)                                                                                |
| **Effect size (OR)**        | 1.39                                                                                            |
| **Study**                   | [Large-scale association analysis provides insights into the genetic architecture and pathophysiology of type 2 diabetes (2012)](https://www.nature.com/articles/ng.2383)                                             |
---

