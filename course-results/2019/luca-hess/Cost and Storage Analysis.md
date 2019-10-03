# Cost and File Size Analysis
### With Estimates provided in the Lecture

In this short essay we make some calculations and estimations regarding the cost and
size of different data formats. The initial calculations for cost are always made
with the estimations (0.5 CHF/GB) provided to us by Prof. Baudis. They already consider some of the
additional costs involved in storing such data. Among those would
be costs for facilities, staff and electricity.

## WGS BAM

100 GB/Genome 30x BAM
30/7=4.054 => 100/4.054=24.7

=> 24.7 GB/Genome 7.4x BAM
2504 Genomes => 61766.16 GB
0.5 CHF/GB   => 30883.08 CHF
Raw Storage: 33.65 CHF/TB => 0.034 CHF/GB => 2100 CHF

## WES BAM

1% of WGS => 617.67 GB and 308.83 CHF (Raw: 20.80 CHF)

## WGS SAM

500 GB/Genome (1). As 30x coverage seems to be the standard in most publications,
we assume that the same is true here.

Hence:
500 GB/Genome 30x SAM
500/4.054=123.33

=> 123.33 GB/Genome 7.4x SAM
2504 Genomes => 308818.32 GB
0.5 CHF/GB   => 154409.16 CHF
Raw: 10499.82 CHF

## WES SAM

1% of WGS => 3088.18 GB and 1544.09 CHF (Raw: 105 CHF)

## WGS VCF

According to the medium.com website, a normal genome in VCF format (so only variations),
is about 125 MB (2).

2504 Genomes => 313 GB
0.5CHF/GB    => 156.5 CHF
Raw: 10.64 CHF

## WES VCF

1% if WGS => 31.3 GB and 15.65 CHF (Raw: 0.11 CHF) 


Source:
1. [Warwick University](https://warwick.ac.uk/fac/sci/statistics/staff/academic-research/nichols/presentations/ohbm2014/imggen/Nho-ImgGen-WGSeqPractical.pdf)
2. [Medium Corporation](https://medium.com/precision-medicine/how-big-is-the-human-genome-e90caa3409b0)
