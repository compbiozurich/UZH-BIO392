
## Genomic File Formats
To encode a single base, 2 bits are sufficient. (00, 01, 10, 11) -> (A, T, G, C)
To store one genome with no overhead (metadata), approximately 715 MB of storage are needed.
This boils down to an average of approximately 50CHF/Genome storage cost for just raw sequence data.
Since everything works better when organised and structured, there are various file formats that optimize handling genomic sequence data.

## WES vs. WGS
The human genome contains ~3 billion base pairs. When sequencing, one needs to consider if a sequence of the whole genome is needed or if only the exome is needed. Exons are the sequences that remain within the processed RNA after introns have been removed by splicing. They contribute to the final protein product encoded by that gene. In WES only the exome is sequenced where as in WGS the entire genome is sequenced. Depending on what the goal of the sequencing is, one should consider sequencing and data storage costs.



