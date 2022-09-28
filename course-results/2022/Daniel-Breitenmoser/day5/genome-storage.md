### WES and WGS

Whole Exome Sequencing (WES), 1-2% of genome \
Whole Genome Sequencing (WGS) \ 

### Different file formats

Different file formats require different amounts of data to be stored.

### Cost of sequencing 

When the Human Genome Project was finished, the costs summed up to about 3 billion USD   \
Today we are in the "1000$ genome" era. [^1] \
The costs range from 300$ to 1000$ depending on where it is sequenced and on the quality of sequencing.\

###  Storage cost
The storage costs differ much from each other  \

#### WGS [^2], [^3], [^4]

| format        | size          | cost         |
| ------------- | ------------- | ------------ |
| Raw           |   750 GB      | 375 CHF      |
| Sam           | 400'000 GB    | 200'000 CHF  |
| Bam           | 100'000 GB    | 50'000 CHF   |
| FASTA         | 20'000 GB     | 10'000 CHF   |
| VCF           | 125'000 GB    | 62'500 CHF   |

#### WES 

being 1% of the whole genome:

| format        | size          | cost         |
| ------------- | ------------- | ------------ |
| Raw           |   7.5 GB      | 3.75 CHF     |
| Sam           | 4'000 GB      | 2'000 CHF    |
| Bam           | 1'000 GB      | 500 CHF      |
| FASTA         | 200 GB        | 100 CHF      |
| VCF           | 1'250 GB      | 625 CHF      |


### The vcf format

example: [^5]

<img width="756" alt="Screen Shot 2022-09-28 at 11 37 47" src="https://user-images.githubusercontent.com/113686985/192745515-a487bf68-3a7a-406c-8ce5-cbcaa9360b1c.png">

vcf = variant call format \
It contains meta-information lines, a header
line, and then data lines each containing information about a position in the genome.

[^1]: https://sequencing.com/education-center/whole-genome-sequencing/whole-genome-sequencing-cost#:~:text=Whole%20genome%20sequencing%20is%20available,50%2C000%20Rs%20(%24676%20USD)
[^2]: https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2022/2022-09-27___Michael-Baudis__Genomic-Technologies-and-Genome-Editions___BIO392-HS22.pdf
[^3]: https://medium.com/precision-medicine/how-big-is-the-human-genome-e90caa3409b0
[^4]: https://www.genepattern.org/modules/docs/Picard.SortSam/4
[^5]: https://samtools.github.io/hts-specs/VCFv4.2.pdf


