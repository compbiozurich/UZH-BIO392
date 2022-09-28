
raw:

 1 genome (WGS) = 6 * 10^9 bits = 750000000 bytes = 750 MB --> 1000 WGS = 750 GB
 1 Exom (WES) = 2 bits * 3 * 10^7 bp = 7.5 MB ---> 1000 WES = 7.5 GB

 Petabyte = 10^15 Byte


 BAM:

Costs to store $1$ PB --> 500'000 CHF (see in slides[^1])

Costs to store $1$ GB --> 0.5 CHF

## For the different file formats:


### WGS

format | size (1000 genomes) | cost (100 genomes) |
----------- | ----------- | ------------ 
Raw | 750 GB | 375 CHF | 
SAM[^2] | 400'000 GB | 200'000 CHF | 
BAM[^1] | 100'000 GB | 50'000 CHF | 
VCF[^3] | 125'000 GB | 62'500 CHF | 
FASTA[^3] | 20'000 GB | 10'000 CHF |

### WES

format | size | cost |
----------- | ----------- | ------------ 
Raw | 7.5 GB | 3.75 CHF | 
SAM[^2] | 4'000 GB | 2000 CHF |
BAM[^1] | 1'000 GB | 500 CHF |
VCF[^3] | 1'250 GB | 625 CHF |
FASTA[^3] | 200 GB | 100 CHF |


[^1]:https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2022/2022-09-27___Michael-Baudis__Genomic-Technologies-and-Genome-Editions___BIO392-HS22.pdf
[^2]:https://warwick.ac.uk/fac/sci/statistics/staff/academic-research/nichols/presentations/ohbm2014/imggen/Nho-ImgGen-WGSeqPractical.pdf
[^3]:https://medium.com/precision-medicine/how-big-is-the-human-genome-e90caa3409b0
