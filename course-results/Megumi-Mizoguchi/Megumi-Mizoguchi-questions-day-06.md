# BIO392 - Exercise
## 🔍 Tasks
For each SNP, answer the following:

1. What chromosome and position is the SNP on?
2. What is the variant type? (e.g., intronic, missense)
3. What are the reference and alternate alleles?
4. What is the minor allele frequency (MAF)?
5. What is the allele frequency of this SNP in different populations (e.g., AFR, EUR, EAS)? What differences do you observe? You may include figures (e.g., allele frequency charts from Ensembl) to illustrate your observations.
6. Choose one GWAS study involving the SNP and describe the associated trait or disease, including the reported p-value, effect size (OR or beta), publication details, predicted functional consequences, and include a link to the study from the GWAS Catalog.

---

| number | SNP (rsID)  | Gene / Region | Notable Trait / Use |Chromosome and position |Variant type |Reference and alternate allele |MAF |
|---------|-------------|----------------|----------------------|-------------|----------------|-----|----|
| 1       | rs7903146   | *TCF7L2*       | Type 2 Diabetes      |10:112998590 |Intron vaariant |C G/T |NA | 
| 2       | rs1426654   | *SLC24A5*      | Skin Pigmentation    |15:48134287 |Missense variant |A G/T |NA |
| 3       | rs429358    | *APOE*         | Alzheimer's Disease  |19:44908684 |Missense variant |T C |NA |
| 4       | rs334       | *HBB*          | Sickle Cell Anemia   |11:5227002 |Missense variant |T A/C/G |NA |
| 5       | rs12913832  | *HERC2*        | Eye Color            |15:28120472 |Intron variant |G A/C |NA |

5. What is the allele frequency of this SNP in different populations (e.g., AFR, EUR, EAS)? What differences do you observe? You may include figures (e.g., allele frequency charts from Ensembl) to illustrate your observations.
    1. rs7903146
        ~70% has C allele and ~30% has T allele, and among EAS (East Asian), 98% of the population has C allele and only 2% has T allele. [Population genetics of rs7903146](https://www.ensembl.org/Homo_sapiens/Variation/Population?db=core;r=10:112998090-112999090;v=rs7903146;vdb=variation;vf=654566937)
    
    2. rs1426654 
        Allele frequency of this SNP is quite different among different populations. Overall, A is 44% and G is 56% due to averaging. In AFR and EAS, the majority (>95%) has allele G, in AMR and SAS the majority (30-40%) has A allale and in EUR 100% is A allele. [Population genetics of rs1426654](https://oct2024.archive.ensembl.org/Homo_sapiens/Variation/Population?db=core;r=15:48133787-48134787;v=rs1426654;vdb=variation;vf=887144584)

    3. rs429358
        ~70-90% of the all populations has the allele T and the mainority has C. In AFR population, the frequency of the allele T is a litttle lower than the other population. [Population genetics of rs429358](https://oct2024.archive.ensembl.org/Homo_sapiens/Variation/Population?db=core;r=19:44908184-44909184;v=rs429358;vdb=variation;vf=1024576105)

    4. rs334
        Nearly 100% of the entire population has the allele T, and in AFR population, 10% has the allele A. [Population genetics of rs334](https://oct2024.archive.ensembl.org/Homo_sapiens/Variation/Population?db=core;r=11:5226502-5227502;v=rs334;vdb=variation;vf=706421787)

    5. rs12913832
        ~80% of the all populations has the allele A and the mainority (~20%) has G. In AFR and EAS population, the majority (>95%) has allele A, in AMR and SAS the majority (80 and 93% respectively) has A allale and in EUR 100% is A allele. [Population genetics of rs12913832](https://oct2024.archive.ensembl.org/Homo_sapiens/Variation/Population?db=core;v=rs12913832;vdb=variation)


6. Choose one GWAS study involving the SNP and describe the associated trait or disease, including the reported p-value, effect size (OR or beta), publication details, predicted functional consequences, and include a link to the study from the GWAS Catalog.
   
    SNP in CYP2C19 gene (cytochrome P450 family 2 subfamily C member 19) [Gene: CYP2C19](https://www.ebi.ac.uk/gwas/genes/CYP2C19)

   Reported traits: Clopidogrel active metabolite levels, Acenocoumarol maintenance dosage, etc.
   Here I focus on Clopidogrel active metabolite levels because it is well known the relation of SNPs in CYP2C19 to Clopidogrel effectiveness.
   |Variant and risk allele |p-value |Effect size (beta)|
   |--------|---------|---------|
   |rs7915414-A |3 × 10⁻¹⁴|6.01 unit decrease|
    

    [Study: GCST004264](https://www.ebi.ac.uk/gwas/studies/GCST004264)
   
   [Backman, et al. **Genome-wide analysis of clopidogrel active metabolite levels identifies novel variants that influence antiplatelet response.** *Pharmacogenet Genomics.* 2017](https://journals.lww.com/jpharmacogenetics/fulltext/2017/04000/genome_wide_analysis_of_clopidogrel_active.5.aspx)

   The study is on clopidogrel, a drug used to reduce atherothrombotic events in patients with acute coronary syndromes. It highlights that up to 40% of patients do not benefit adequately from clopidogrel therapy, and a GWAS was conducted to identify genetic variants affecting clopidogrel metabolism, focusing on circulating active metabolite levels in 513 individuals, finding significant associations with variants on chromosomes 3p25 and 17q11, and a locus near the CYP2C9-CYP2C18-CYP2C19 gene cluster was notably associated with active metabolite concentration.
