# BIO392 - Exercise

These questions are designed to test your understanding of the course. Please change the name of this file to \<First name\>-\<Last name\>-questions-day-06.md, and upload it to your folder in the course GitHub.

## 🧬 SNP Exploration

Below is a list of curated SNPs for exploration:

------------------------------------------------------------------------

| number | SNP (rsID) | Gene / Region | Notable Trait / Use |
|--------|------------|---------------|---------------------|
| 1      | rs7903146  | *TCF7L2*      | Type 2 Diabetes     |
| 2      | rs1426654  | *SLC24A5*     | Skin Pigmentation   |
| 3      | rs429358   | *APOE*        | Alzheimer's Disease |
| 4      | rs334      | *HBB*         | Sickle Cell Anemia  |
| 5      | rs12913832 | *HERC2*       | Eye Color           |

------------------------------------------------------------------------

Please investigate each of SNP using the following databases:

-   **GWAS Catalog**: <https://www.ebi.ac.uk/gwas>\
-   **Ensembl Variant Browser**: <https://www.ensembl.org>

## 📌 **Tip**

-   Use the LocusZoom in GWAS Catalog and population frequency features in Ensembl to explore regulatory impact and population distribution!
-   Refer to this link for guidance on the GWAS Catalog, <https://www.ebi.ac.uk/training/online/courses/gwas-catalogue-exploring-snp-trait-associations/>

## 🔍 Tasks
1.  What chromosome and position is the SNP on?
2.  What is the variant type? (e.g., intronic, missense)
3.  What are the reference and alternate alleles?
4.  What is the minor allele frequency (MAF)?
5.  What is the allele frequency of this SNP in different populations (e.g., AFR, EUR, EAS)? What differences do you observe? You may include figures (e.g., allele frequency charts from Ensembl) to illustrate your observations.
6.  Choose one GWAS study involving the SNP and describe the associated trait or disease, including the reported p-value, effect size (OR or beta), publication details, predicted functional consequences, and include a link to the study from the GWAS Catalog.



# 1. rrs7903146
| number | SNP (rsID) | Gene / Region | Notable Trait / Use | Chromosome and Position | variant type     | reference & alternate alleles|MAF |
|--------|------------|---------------|---------------------|-------------------------|------------------|------------------------------|----|
| 1      | rs7903146  | *TCF7L2*      | Type 2 Diabetes     |  10:112998590 |intron variant |C/G/T Ancestral: T|0.40|

![Allele frequency in different populations](image-1.png)

*GWAS study:* <https://pmc.ncbi.nlm.nih.gov/articles/PMC3442244/>

*Description of the trait/disease:* The study focuses on Type 2 Diabetes Mellitus (T2DM), a chronic metabolic disorder characterized by insulin resistance and impaired insulin secretion, leading to elevated blood glucose levels.​

*reported p-value:* 4 x 10-73.​

*effect size (OR or beta):* 1.39

*publication details:* The paper was published in Nature Genetics on August 12, 2012.​

*predicted functional consequences:* The study suggests that many of the associated variants are located in non-coding regions of the genome, potentially affecting gene regulation. For example, rs7903146 is located in an intronic region of TCF7L2 and is thought to influence gene expression, thereby impacting insulin secretion and glucose metabolism.​

# 2. rs1426654
| number | SNP (rsID) | Gene / Region | Notable Trait / Use | Chromosome and Position | variant type     | reference & alternate alleles|MAF |
|--------|------------|---------------|---------------------|-------------------------|------------------|------------------------------|----|
| 2      | rs1426654  | *SLC24A5*     | Skin Pigmentation   |  15:48120990-48142672   |  missense variant|  A/G/T Ancestral: G          |0.50|

![Allele frequency in different populations](image.png)

*GWAS study:* <https://www.sciencedirect.com/science/article/pii/S0092867417313247?via%3Dihub>

*Description of the trait/disease:* The study investigates skin pigmentation, a highly variable human trait influenced by multiple genetic factors. Specifically, it examines the role of the rs1426654 SNP in the SLC24A5 gene, which has been associated with lighter skin pigmentation in various populations.​

*reported p-value:* 9.8E-09

*effect size (OR or beta):* 3.58 unit decrease

*publication details:* The study was published in the journal Cell on November 9, 2017.​

*predicted functional consequences:* The rs1426654 SNP results in a non-synonymous amino acid change (Ala111Thr) in the SLC24A5 gene, which encodes a cation exchanger involved in melanin production. This amino acid substitution is believed to affect the protein's function, leading to reduced melanin synthesis and, consequently, lighter skin pigmentation.

# 3. rs429358
| number | SNP (rsID) | Gene / Region | Notable Trait / Use | Chromosome and Position | variant type     | reference & alternate alleles|MAF |
|--------|------------|---------------|---------------------|-------------------------|------------------|------------------------------|----|
| 3      | rs429358  | *APOE*     | Alzheimer's Disease   | 19:44908684   | Missense variant | T/C Ancestral: C   |0.38|

![Allele frequency in different populations](image-2.png)

*GWAS study:* <https://www.sciencedirect.com/science/article/pii/S1552526019351179?via%3Dihub>

*Description of the trait/disease:* 

*reported p-value:* 2 x 10-303

*effect size (OR or beta):* 3.21

*publication details:* The study was published in the journal Alzheimer’s & Dementia on August 28, 2019.

*predicted functional consequences:* The SNP rs429358 results in a missense mutation in the APOE gene, leading to an amino acid substitution that helps define the APOE ε4 allele. This variant alters the structure and function of the ApoE protein, influencing its binding to lipids and receptors. Functionally, this change is associated with increased accumulation of amyloid-β plaques in the brain, a pathological hallmark of Alzheimer’s disease.

# 4. rs334
| number | SNP (rsID) | Gene / Region | Notable Trait / Use | Chromosome and Position | variant type     | reference & alternate alleles|MAF |
|--------|------------|---------------|---------------------|-------------------------|------------------|------------------------------|----|
| 4      | rs334  | *HBB*     | Sickle Cell Anemia    |  11:5227002  |Missense variant| T/A/C/G  |0.14|


![Allele frequency in different populations](image-3.png)

# 5. rs12913832
| number | SNP (rsID) | Gene / Region | Notable Trait / Use | Chromosome and Position | variant type     | reference & alternate alleles|MAF |
|--------|------------|---------------|---------------------|-------------------------|------------------|------------------------------|----|
| 5      | rs12913832  | *HERC2*     | Eye Color       |  15:28120472  |Intron variant| A/C/G |NA|

![Allele frequency in different populations](image-4.png)



