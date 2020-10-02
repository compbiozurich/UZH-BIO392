# plink commands

```
$ ./plink -vcf ALL.chr20.chunk1.vcf -recode -out ALL.chr20.chunk1
$ ./plink -vcf ALL.chr20.chunk1.vcf -make-bed -out ALL.chr20.chunk1
```

```
$ ./plink -vcf ALL.chr20.chunk1.vcf.gz -extract mysnps.txt -make-bed -out extracted
$ rm extracted*
$ ./plink -bfile ALL.chr20.chunk1 -maf 0.05 -make-bed -out ALL.maf
$ rm ALL.maf*
$ ./plink -bfile ALL.chr20.chunk1 -geno 0.05 -make-bed -out ALL.geno
$ rm ALL.geno*
$ ./plink -bfile ALL.chr20.chunk1 -hwe 0.05 -make-bed -out ALL.geno
$ rm ALL.hwe*

```

```
$ ./plink -bfile ALL.chr20.chunk1 -freq -out All.chr.20
$ ./plink -bfile ALL.chr20.chunk1 -missing -out All.chr.20
$awk 'BEGIN{fs=" +"}{if ($0>0) print}' All.chr20.lmiss |head
$ ./plink -bfile ALL.chr20.chunk1 -indep 50 5 2 -out ld.indep
$ ./plink -bfile ALL.chr20.chunk1 -r2 -out r2_cal
$ ./plink -bfile ALL.chr20.chunk1 -blocks no-phno-req -out All.chr

```

```
$./plink -vcf ALL.chr20.chunk1.vcf.gz -extract mysnps.txt -make-bed -out newid
$ ./plink -bfile ALL.chr20.chunk1 -keep-fam -out All.chr.20
$ ./plink -bfile ALL.chr20.chunk1 -missing -out All.chr.20
$awk 'BEGIN{fs=" +"}{if ($0>0) print}' All.chr20.lmiss |head
$ ./plink -bfile ALL.chr20.chunk1 -indep 50 5 2 -out ld.indep
$ ./plink -bfile ALL.chr20.chunk1 -r2 -out r2_cal
$ ./plink -bfile ALL.chr20.chunk1 -blocks no-phno-req -out All.chr

```
