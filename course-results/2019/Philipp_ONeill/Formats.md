By using the information given on the slides and searched on google it is possible to calculate the following values:

BAM:
                    genome        exome
Storage:            62600 GB      5509 GB
Price Storage:      2184 CHF      188 CHF
Price Total:        31300 CHF     2754 CHF


VCF:
                    genome        exome
Storage:            75 GB         6.6 GB
Price Storage:      2.55 CHF      0.2 CHF
Price Total:        37.5 CHF      3.3 CHF


SAM:
                    genome        exome
Storage:            307992 GB     27344 GB
Price Storage:      10471 CHF     929 CHF
Price Total:        153996 CHF    13672 CHF

These are estimated values for the 2504 genomes of the 1000 genome project. Exomes are calculated for 65.7 read depth and the genomes
are calculated for 7.4 read depth. The size of the exome was estimated as about 1% of the whole genome size. For files such as VCS, in
which only variable sequences are given it is possible that this estimation is wrong because there might be more or less than 1%
of the whole variation in the genome contained in the exons, but this was ignored for this conversion. For VCF and SAM the standard size of
one human genome comes from a google search, and I just assumed that it related to read depth 30. Therefore converison to 7-4/65.7 was done
accordingly.


VCF is the best format for storing the variations in the genome, because it only gives you the actual variations compared to a reference genome.

The BAM format is probably the best format for archiving whole genomes, because the whole sequence is stored in binary code.

FASTA is useful for presenting a sequence, because it's easy to read. It is also useful for working with genome, because it is fairly easy to
manipulate the data using R, Python or other programs.
