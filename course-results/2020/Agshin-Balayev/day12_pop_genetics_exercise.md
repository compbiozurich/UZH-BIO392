# Exercise 1

* Convert vcf file to .ped and .map files

./plink_mac_20200921/plink --vcf ALL.chr20.chunk1.vcf.gz --recode -out ALL.chr20.chunk1 
(vcf file can be compressed)

* Convert vcf file to .bed, .bim and .fam files

./plink_mac_20200921/plink -vcf ALL.chr20.chunk1.vcf.gz -make-bed -out ALL.chr20.chunk1 

* Convert .ped and .map files to vcf file

./plink_mac_20200921/plink --file ALL.chr20.chunk1  --recode vcf -out ALL.chr20.chunk1

* Convert .bed, .bim and .fam files to vcf file

./plink_mac_20200921/plink --bfile ALL.chr20.chunk1  --recode vcf -out ALL.chr20.chunk1

# Exercise 2

* Filter out undesired variants or individuals:

- Remove variants from individuals with less than 5% allele frequency 

./plink_mac_20200921/plink --vcf ALL.chr20.chunk1.vcf.gz --make-bed -out ALL.chr20.chunk1 --extract mysnps.txt --mind 0.1 > ALL.chr20.chunk1_mind.bed

- Remove variants if less than 5% of individuals have it

./plink_mac_20200921/plink --vcf ALL.chr20.chunk1.vcf.gz --make-bed -out ALL.chr20.chunk1 --extract mysnps.txt -maf 0.05 > ALL.chr20.chunk1_maf.bed

-Remove variants with p-value threshold > 0.001

./plink_mac_20200921/plink --vcf ALL.chr20.chunk1.vcf.gz --make-bed -out ALL.chr20.chunk1 --extract mysnps.txt -geno 0.05 > ALL.chr20.chunk1_geno.bed

-Remove individuals with more than 10% of variants missing

./plink_mac_20200921/plink --vcf ALL.chr20.chunk1.vcf.gz --make-bed -out ALL.chr20.chunk1 --extract mysnps.txt -hwe 0.001 > ALL.chr20.chunk1_hwe.bed

# Exercise 3

* Basic statistics

-Get frequency report

./plink_mac_20200921/plink -bfile ALL.chr20.chunk1 --freq -out freq_stat
```
head freq_stat.frq
 CHR          SNP   A1   A2          MAF  NCHROBS
  20   rs10485818    C    A       0.1991     5008
  20    rs8124344    T    C       0.1989     5008
  20   rs10485819    G    T       0.1987     5008
  20    rs6082267    C    T       0.3602     5008
  20     rs926617    T    C       0.3596     5008
  20   rs11087339    A    C       0.1593     5008
  20    rs6082985    G    C      0.05531     5008
  20    rs7345645    C    T       0.1894     4890
  20    rs6051642    C    T       0.4179     4570
  ```
  
  Frequency report: probes
  
  -Get missing data report
  
  ./plink_mac_20200921/plink -bfile ALL.chr20.chunk1 --missing -out missing_stat
  ```
  head missing_stat.lmiss
   CHR          SNP   N_MISS   N_GENO   F_MISS
  20   rs10485818        0     2504        0
  20    rs8124344        0     2504        0
  20   rs10485819        0     2504        0
  20    rs6082267        0     2504        0
  20     rs926617        0     2504        0
  20   rs11087339        0     2504        0
  20    rs6082985        0     2504        0
  20    rs7345645       59     2504  0.02356
  20    rs6051642      219     2504  0.08746
  ```
  
  frequency of missing variant
  
  -Get Hardy-Weinberg report: deviation from equilibrium, first two homozygous
  
  ./plink_mac_20200921/plink -bfile ALL.chr20.chunk1 --hardy -out hardy_stat
  ```
  head hardy_stat.hwe
   CHR          SNP     TEST   A1   A2                 GENO   O(HET)   E(HET)            P 
  20   rs10485818  ALL(NP)    C    A         117/763/1624   0.3047   0.3189      0.02816
  20    rs8124344  ALL(NP)    T    C         117/762/1625   0.3043   0.3187      0.02796
  20   rs10485819  ALL(NP)    G    T         116/763/1625   0.3047   0.3184      0.03281
  20    rs6082267  ALL(NP)    C    T        322/1160/1022   0.4633   0.4609       0.8284
  20     rs926617  ALL(NP)    T    C        321/1159/1024   0.4629   0.4606       0.8283
  20   rs11087339  ALL(NP)    A    C          56/686/1762    0.274   0.2679        0.296
  20    rs6082985  ALL(NP)    G    C           9/259/2236   0.1034   0.1045       0.5649
  20    rs7345645  ALL(NP)    C    T         302/322/1821   0.1317    0.307   5.622e-145
  20    rs6051642  ALL(NP)    C    T         755/400/1130   0.1751   0.4865   4.209e-219
```
# Exercise 4

pruning list of variants: independence of variants
./plink_mac_20200921/plink -bfile ALL.chr20.chunk1 -indep 50 5 2
-Shows SNPs which are independent variants.
```
./plink_mac_20200921/plink -bfile ALL.chr20.chunk1 -out ALL.chr20.chunk1 -r2
head ALL.chr20.chunk1.ld
 CHR_A         BP_A                                             SNP_A  CHR_B         BP_B                                             SNP_B           R2 
    20        61098                                         rs6078030     20        65900                                         rs6053810     0.975654 
    20        61098                                         rs6078030     20        66370                                         rs6054257     0.747068 
    20        61098                                         rs6078030     20        67500                                       rs112142516     0.390816 
    20        61795                                         rs4814683     20        63231                                         rs6076506     0.203338 
    20        61795                                         rs4814683     20        63799                                         rs1418258      0.92529 
    20        63231                                         rs6076506     20        63799                                         rs1418258     0.219354 
    20        63231                                         rs6076506     20        64150                                         rs7274499     0.435329 
    20        63733                                        rs75670495     20        63808                                        rs76004960            1 
    20        63733                                        rs75670495     20        68264                                        rs60878529      0.48818
```
-Shows position of two variants and their correlation coefficient. 

./plink_mac_20200921/plink -bfile ALL.chr20.chunk1 --blocks 'no-pheno-req'
-Shows blocks of the linked SNPs



#Plotting exercise

## Create two subset files including sample ID with "AFR" and "HAN" population supercodes.

``` 
grep "AFR" igsr_samples.tsv | awk '{print $1}' > AFR
grep "HAN" igsr_samples.tsv | awk '{print $1}' > HAN
```

Select variants from original VCF file with maf < 0.05 or which are in AFR and HAN files. Acquire frequency reports of both.

```
./plink_mac_20200921/plink --vcf ALL.chr20.chunk1.vcf  --make-bed -out AFR.maf -maf 0.05
./plink_mac_20200921/plink --vcf ALL.chr20.chunk1.vcf  --make-bed -out HAN.maf -maf 0.05

./plink_mac_20200921/plink --vcf ALL.chr20.chunk1.vcf  --make-bed -out AFR --keep-fam AFR
./plink_mac_20200921/plink --vcf ALL.chr20.chunk1.vcf  --make-bed -out HAN.maf --keep-fam HAN

./plink_mac_20200921/plink -bfile AFR --freq -out AFR_freq_stat
./plink_mac_20200921/plink -bfile HAN --freq -out HAN_freq_stat
```

* African population seem to have less rare variants relative to Han Chinese population which indicates high diversity. 

For the histogram and plots, go to R script.

* PlotDecayLD: correlation coefficient vs linked SNP distance (high decay rate --> low linkage disequilibrium --> more diversity) 
* Plot Pairwise LD: correlation coefficient vs chromosome position (triangles mark high correlation)



