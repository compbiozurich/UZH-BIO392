# Population Genetics 

## PLINK [link](https://www.cog-genomics.org/plink2) 
Plink is a whole genome analysis data toolset allowing the analysis of genotype as well as phenotype data. It presents miscellaneous features such as data mangaement (e.g. files conversion, data extraction), 
statistics (e.g. frequency), population stratification (e.g. Complete linkage hierarchical clustering), etc. 

### 1. Definitions


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
* -maf _threshold.value_ (minor allele frequencies/count, filters out all variants with MAF below the provided threshold)
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


