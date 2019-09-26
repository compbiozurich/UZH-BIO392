## tutorial commands cheat sheet
### population genetics
* minor allele frequency
- cli
```
plink --vcf xxx --make-bed -out xxx
plink --bfile xxx -maf
```
- R
```
hist(your_maf)
```

* LD decay and LD plots
- cli
`plink --vcf xxx --r2 --ld-window-r2 0 --out xxx`

- R
```
plotDecayLD(your_ld_data,xlim = c(0,100), ylim = c(0,1), avgwin = 80, title = your_title) ## make 80 averaging windows

plotPairwiseLD(your_ld_data ,ylim=c(0,300), xbreaks = 10, title = your_title)  ## make 10 axis breaks
```
