# plink commands

```
##makes .bed .bim .fam
$ ./plink -vcf ALL.chr20.chunk1.vcf -recode -out ALL.chr20.chunk1  
##makes .ped .map
$ ./plink -vcf ALL.chr20.chunk1.vcf -make-bed -out ALL.chr20.chunk1
##makes .vcf
$ ./plink -vcf ALL.chr20.chunk1.bed -recode vcf -out ALL.chr20.chunk1
```

```
$ ./plink -vcf ALL.chr20.chunk1.vcf.gz -extract mysnps.txt -make-bed -out extracted
$ rm extracted*
$ ./plink -bfile ALL.chr20.chunk1 -maf 0.05 -make-bed -out ALL.maf
$ rm ALL.maf*
$ ./plink -bfile ALL.chr20.chunk1 -geno 0.05 -make-bed -out ALL.geno
$ rm ALL.geno*
$ ./plink -bfile ALL.chr20.chunk1 -hwe 0.05 -make-bed -out ALL.hwe
$ rm ALL.hwe*
$ ./plink -bfile ALL.chr20.chunk1 -mind 0.01 -make-bed -out ALL.mind
$ rm ALL.mind*
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
$ ./plink --bfile ALL.chr20.chunk1 -keep-fam afr_list.txt -make-bed -out AFR
$ ./plink --bfile ALL.chr20.chunk1 -keep-fam han_list.txt -make-bed -out HAN

$./plink --bfile HAN -maf 0.05 -make-bed -out HAN.maf
$./plink --bfile AFR -maf 0.05 -make-bed -out AFR.maf

```




* LD decay
- cli
`plink --vcf xxx --r2 --ld-window-r2 0 --out xxx`

 * LD plots
 -cli
 `plink --vcf xxx --r2 --ld-window-r2 0 ---ld-window 300 -out xxx`
 
