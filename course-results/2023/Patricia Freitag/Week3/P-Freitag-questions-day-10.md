

# Questions BIO392 day 10


### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**

CHROM: identifier from reference genome, lets us know on which chromosome the genetic variant is located, usually in string format

POS: reference position, first base gets position 1 (not 0), position of the base on the chromosome we stated in first column

REF: reference base, can be more than just one base, tells us which base(s) is on the reference allele at the given position,

ALT: alternate base, tells us which bases are on the non-reference alleles

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**

You could compare the REF and ALT columns. If they are different, this could possibly be a variant. 

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**

+ Reference genome: In a FASTA file, contains the reference genome 

+ VCF: track highlights variances and distinctions within the APC gene and other regions of significance when compared to the reference genome

+ Gene Annotation: in GTF file, provides information about the locations of genes and their structural features (exons, introns, coding regions, etc.) 

+ Alignment: in BAM files, the sequences we wanna compare to the reference 



### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**

The GA expansion probably has more impact than the A insertion, since the GA leads to a frameshift variant while the A leads to an intron variant. Since introns are spliced, 
a mutation in this region does not have a considerable impact, while a frameshift mutation can have drastic effects, such as completely different amino acid codons or early stop codons which will result in an impaired gene product. 

### Q5
**What phenotype or disease do you expect this variant to be involved with?**

When clicking on phenotype data, it tells us that this variant is involved with stomach tumors and large intestine tumors. This makes sense since the APC gene product acts as a tumor suppressor, thus a mutation in this gene can result in uncontrolled cell proliferation  
