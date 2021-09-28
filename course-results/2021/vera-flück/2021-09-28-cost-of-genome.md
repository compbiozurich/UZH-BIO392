In this file, I tried to calculate the storage cost of the GWS for different storage formats.
From the slides of Prof. Baudis lecture, I took the estimations for the raw storage cost and the estimations
for the storag cost with additional costs involved (facilities, service...).
--> storage cost: 0.50 CHF/GB

From the GWS-paper, we can take the informations we need for our calculations:
--> 2503 Genomes
--> 88 million variants
--> mean depth = 7.4x

##BAM file format:
30x BAM file = 100 GB --> 7.4x BAM file = (7.4*100)/30 = 24.76 GB/Genome
We now have 2504 genomes --> 2504*24.76= 61'999.04 GB for the whole GWS
One GB costs abou 0.50CHF to store --> 30'999.52 CHF for the whole GWS.

##SAM file format:
(Internet research)= 1 30x Genome needs about 500GB.
GWS used 7.4x --> (7.4*500)/30 = 123.33 GB/Genome 7.4x SAM
For 2504 genomes --> 2504*123.34 GB = 308'818.32 GB.
One GB= 0.50CHF --> 0.50*308'818.32 = 154'409.16CHF for the whole GWS.

##VCF file format:
VCF only contains variants as BAM files contain all reads aligments --> VCF are therefore much smaller than BAMS.
(Internet research)=all variations of a human genome need ~125 MG
For our 2504 genomes --> 2504*125MG = 313 GB for the whole GWS required.
This costst ~0.50CHF*313GB = 156.50 CH (cheapest format!)
