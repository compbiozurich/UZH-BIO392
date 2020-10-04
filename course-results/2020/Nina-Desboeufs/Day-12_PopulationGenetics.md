# Population Genetics 

## PLINK [link](https://www.cog-genomics.org/plink2) 
Plink is a whole genome analysis data toolset allowing the analysis of genotype as well as phenotype data. It presents miscellaneous features such as data mangaement (e.g. files conversion, data extraction), 
statistics (e.g. frequency), population stratification (e.g. Complete linkage hierarchical clustering), etc. 

### 1. Definitions
The population genetics study focuses on the genetic variations encountered in a population, i.e. changes in genes/alleles frequencies over generations. Developping of models to predict the evolution of genomic evolution as well as associate genetic variant to phenotypic diversity. 

* **Linkage**: "genetic markers are inherited together rather than being broken apart by recombination events".
* **Linkage Disequilibrium**: association (by recombination point) of alleles at two or more loci. LDs depend on several factors such as local recombination rate, genetic drift, non- random mating, mutation rate and population structure. 
* **Linkage Disequilibrium Decay**: seuquential reduction of the linked blocks over generations (move from LD to linkage equilibrium). 

### 2. Commands 
**Input file**:
* -vcf 
* -bfile (.bed, .bim and .fam)
* -file (.ped and .map)

**Convert file format**: 
* -make-bed (convert to .bed, .bim and .fam format) 
* -recode (convert to .ped and .map)
* -recode vcf (convert to vcf) 

e.g.  `./plink -vcf my.file.vcf -make-bed -out new.name`

**Filtering**: 
* -extract (removes all unlisted variants from the current analysis)
* -maf _threshold.value_ (minor allele frequencies/count, filters out all variants with MAF below the provided threshold, defined as common or rare (<1%))
* -geno _treshold_value_ (missing genotype rates, filters out all variants with missing call rates exceeding the provided value)
* -mind _threshol.value_ (same but for samples)
* -prune (filters out all samples with missing phenotypes) 
* -hwe _p.value_ (filters out all variants which have Hardy-Weinberg equilibrium exact test p-value below the provided threshold)
* -snps-only ['just-acgt'] (excludes all variants with one or more multi-character allele codes)

e.g. `./plink -bfile myfile.bed.bim.fam -maf 0.05 -make-bed -out filtered.maf`

**Statistics**: 
* -freq (writes a minor allele frequency report -> .frq)
* -missing (produces sample-based and variant-based missing data reports)
* -hardy (writes a list of genotype counts and Hardy-Weinberg equilibrium exact test statistics)
* -mendel (scans the dataset for Mendel errors)

**Population genetics metrics**: 
* -indep _window.size variant.count variance.inflation.factor_ (produces a pruned subset of markers that are in approximate linkage equilibrium with each other)
* -r2 (calculates linkage/correlation)
* -blocks no-pheno-req (generate LD blocks = identifies the genetic markers that are linked to each other)

### 3. Exercises (Commands)

**Files conversion**: 

```
# .vcf -> .bed .bim .fam
$ ./plink -vcf my.file.vcf -recode -out new.name  
# .vcf -> .ped .map
$ ./plink -vcf my.file.vcf -make-bed -out new.name
# .bed -> .vcf 
$ ./plink -vcf my.file.bed -recode vcf -out new.name
```

**Filtering**: 

```
# extract all the SNPs listed in mysnps 
$ ./plink -vcf my.file.vcf.gz -extract mysnps.txt -make-bed -out extracted
# remove all the maf below 0.05 
$ ./plink -bfile my.file -maf 0.05 -make-bed -out ALL.maf
# removes all the variants with missing calls aboce 0.05 
$ ./plink -bfile my.file -geno 0.05 -make-bed -out ALL.geno
# removes all variants with a Hardy-Weinberg equilibrium p.value below 1e-3
$ ./plink -bfile my.file -hwe 1e-3 -make-bed -out ALL.hwe
# removes all the samples with missing calls below 0.01
$ ./plink -bfile my.file -mind 0.01 -make-bed -out ALL.mind
```

**Statistics**: 

```
# report a minor allele frequency
$ ./plink -bfile my.file -freq -out All.frq
# report missing variants 
$ ./plink -bfile my.file  -missing -out All.lmiss
$ awk 'BEGIN{fs=" +"}{if ($0>0) print}' All.lmiss |head
```

**Population genetics metrics**: 

```
# report subset of markers that are in approximate linkage equilibrium
$ ./plink -bfile my.file -indep 50 5 2 -out ld.indep
# calculate linkage/correlation
$ ./plink -bfile my.file -r2 -out r2_cal
# Genetic markers identification, that are correlated together 
$ ./plink -bfile ALL.chr20.chunk1 -blocks no-phno-req -out All.chr
```

**Subset population**: 

```
# Select only the family listed in my_list
$ ./plink --bfile my.file -keep-fam my_list.txt -make-bed -out fam.name
# Same as previously 
$ ./plink --bfile my.file -maf 0.05 -make-bed -out filtered.maf
$ ./plink -bfile my.file -freq -out name.frq
```

**Linkage disequilibrium decay**: 

```
# LD decay
$ ./plink --vcf my.file.vcf --r2 --ld-window-r2 0 --ld-window 300 -out name.LDd
# LD plots
$ ./plink --vcf my.file.vcf --r2 --ld-window-r2 0 -out name.pLd
```
### 4. Literature 
**Human genetic variation and its contribution to complex traits** ([Frazer, K.A. et al, 2009](https://www.nature.com/articles/nrg2554)): \
Association of genetic variants in a population with phenotypic diversity (Definitions, challenges, methods). \
Classes of human genetic variants: 
* **SNPs**: the most prevalent, base substitution. 
* **Indels**: Insertion - deletions variants 
* **Block substitution**
* **Inversion variant**
* **CNVs**

**From Lecture 01**: 

At the level transcription: 
* **Silent**: no change in aa seq
* **Nonsense**: stop codon 
* **Missense**: chnage in aa seq 

These mentionned changes might affect the protein structure (folding, stability, binding sites, etc), which then alter the proteins function(s). 
> _Structure is better conserved than sequence._
The protein structure can be determined by: 
* X-ray Crystallography 
* Nuclear Magnetic Resonance (NMR) spectroscopy
* Electron Microscopy/Diffraction

**Sickle cell anemia:** Glu -> Val (hydrophobic residue), hb agglutination. 







