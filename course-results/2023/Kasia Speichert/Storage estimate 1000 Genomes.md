We need two bits per base to encode the whole genome ($00$, $01$, $10$, $11$)

$8$ bits = $1$ byte
<br> $1$ kilobyte = $1024$ bits
<br> $1$ GB = $1024$ MB = $1048576$ kb = $1073741824$ bytes[^1].

*WGS:* $2 \times 3 \times 10^9 = 6000000000$ bits (genome size: $3 \times 10^9$ bp)

*WES:* $2 \times 3 \times 10^7 = 60000000$ bits (30 mln bp of coding region)

*WGS:* 6 000 000 000 bits/ 8/ 1024/ 1024 = 715 Megabytes

*WES:* 60 000 000 bits = 7.15 Megabytes

For $1000$ genomes: 

*WGS:* $1000 \times 715 = 715$ Gigabytes

*WES:* $1000 \times 7.15 = 7.15$ Gigabytes

We know from the lecture that the costs to store 1 PB is 500’000CHF which sum up to 0.5 CHF per 1 GB.

Thus the cost to store 715 GB is 357.5 CHF and to store 7.15 GB -> 3.575 CHF.


## For different file formats 
### FASTA file[^1]

With a 3 billion letters human genome length and an average depth of coverage of 30x => 90 billion letters => 90 gigabytes
COnsidering short-reads and quality scores we cn round up to 200 GB per genome. 
Multipling by 1000 genomes => 200 000 GB = 100 000 CHF (WGS)

### VCF file[^1]

WIth around 45 bytes per line and 3 mln variants in average human genome this results in 135 Megabytes which is 135 Gigabytes per 1000 genomes resulting in the total cost of 67.5 CHF (WGS)


### SAM file (Sequence alignment map)

* Header
* Alignment section

#### Costs
* WEG: 500TB cost: ~250000CHF
* WES: 7.5TB cost: ~3750CHF


### BAM file (binary version of sequence alignment map)
Is the compressed binary version of a SAM file that is used to represent aligned sequences up to 128 Mb. They consist of a:
* Header
* Alignment section
Costs
* WEG: 100TB cost: ~50000CHF
* WES: 1.5TB cost: ~750CHF



[^1]: https://medium.com/precision-medicine/how-big-is-the-human-genome-e90caa3409b0
