### Population genetics

This command makes 5 files: .bed, .bim, .fam, .log, .nosex
> ./plink --vcf ALL.chr20.chunk1.vcf.gz --make-bed -out ALL.chr20.chunk1 
>
> head ALL.chr20.chunk1.bim

20	rs527639301	0	60343	A	G
20	rs538242240	0	60419	G	A
...

> head ALL.chr20.chunk1.fam
HG00096 HG00096 0 0 0 -9
HG00097 HG00097 0 0 0 -9
...

> head ALL.chr20.chunk1.nosex
HG00096	HG00096
HG00097	HG00097
...

This command returns 5 files: .bed, .bim, .fam, .log, .nosex
--extract normally accepts a text file with a list of variant IDs and removes all unlisted variants from the current analysis. Usually one ID per line, but it's okay for them to just be separated by spaces).
> ./plink --vcf ALL.chr20.chunk1.vcf.gz --extract mysnps.txt --make-bed -out extracted
>
> head extracted.bim
20	rs1858597	0	147685	C	A
20	rs4816104	0	148084	T	C

> head extracted.fam
HG00096 HG00096 0 0 0 -9
HG00097 HG00097 0 0 0 -9

> head extracted.nosex
HG00096	HG00096
HG00097	HG00097

--maf filters out all variants with minor allele frequency below the provided threshold (default 0.05)
> ./plink --bfile ALL.chr20.chunk1 --maf 0.05 --make-bed -out ALL.maf

--geno filters out all variants with missing call rates exceeding the provided value (default 0.05) to be removed, while --mind does the same for samples.
> ./plink --bfile ALL.chr20.chunk1 --geno 0.05 --make-bed -out ALL.geno

--hwe filters out all variants which have Hardy-Weinberg equilibrium exact test p-value below the provided threshold. 
Genuine SNP-trait are expected to deviate slightly from Hardy-Weinberg equilibrium 
> ./plink --bfile ALL.chr20.chunk1 --hwe 0.0001 --make-bed -out ALL.hwe

--geno filters out all variants with missing call rates exceeding the provided value (default 0.1) to be removed, while --mind does the same for samples.
> ./plink --bfile ALL.chr20.chunk1 --mind 0.1 --make-bed -out ALL.mind

--freq writes a minor allele frequency report to plink.frq.
> ./plink --bfile ALL.chr20.chunk1 --freq -out ALL.chr20

--missing produces sample-based and variant-based missing data reports. If run with --within/--family, the variant-based report is stratified by cluster. 'gz' causes the output files to be gzipped.
> ./plink --bfile ALL.chr20.chunk1 --missing 0.1 -out ALL.chr20
>
> head ALL.chr20.imiss
      FID       IID MISS_PHENO   N_MISS   N_GENO   F_MISS
  HG00096   HG00096          Y       11    95626 0.000115
  HG00097   HG00097          Y       12    95626 0.0001255

> head ALL.chr20.lmiss
 CHR                                               SNP   N_MISS   N_GENO   F_MISS
  20                                       rs527639301        0     2504        0

'BEGIN{FS=" +"}{if ($6>0) print }' ALL.chr20.lmiss
 CHR                                               SNP   N_MISS   N_GENO   F_MISS
  20                                       rs186497980        2     2504 0.0007987
  20                           rs528633005;rs528368427        7     2504 0.002796

--hardy writes a list of genotype counts and Hardy-Weinberg equilibrium exact test statistics to plink.hwe.
> ./plink --bfile ALL.chr20.chunk1 --hardy -out ALL.chr20
>
> head ALL.chr20.hwe
 CHR                             SNP     TEST   A1   A2                 GENO   O(HET)   E(HET)            P 
  20                     rs527639301  ALL(NP)    A    G             0/1/2503 0.0003994 0.0003993            1
  20                     rs538242240  ALL(NP)    G    A             0/1/2503 0.0003994 0.0003993            1

--indep 50 5 2 produce a pruning list of variants based on LD
--indep requires three parameters: a window size in variant count or kb units, a variant count to shift the window at the end of each step, and a variance inflation factor (VIF) threshold. At each step, all variants in the current window with VIF exceeding the threshold are removed.

--r2 calculate linkage/correlation
By default, --r calculates and reports raw inter-variant allele count correlations, while --r2 reports squared correlations.

--blocks no-pheno-req generate LD blocks
--blocks estimates haplotype blocks, via Haploview's interpretation of the block definition. Each block's variant IDs are written to plink.blocks, and a longer report with position information is written to plink.blocks.det. To maintain backwards compatibility, this computation normally does not consider either nonfounders or samples with missing phenotypes. The 'no-pheno-req' modifier lifts the phenotype restriction.

Use --keep-fam from plink and generate new files like HAN and AFR prefixed files
--keep accepts a space/tab-delimited text file with family IDs in the first column and within-family IDs in the second column, and removes all unlisted samples from the current analysis. --remove does the same for all listed samples. Similarly, --keep-fam and --remove-fam accept text files with family IDs in the first column, and keep or remove entire families.

--maf filters out all variants with minor allele frequency below the provided threshold (default 0.01)

