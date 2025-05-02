
# Questions BIO392 day 9
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to <First letter>-<Last name>-questions-day-09.md, and upload it to your folder in the course GitHub. Please submit before 13:00 on 6th May.
These questions will be graded. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

### Q1
**What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?**
- **CHROM**: Means *chromosome*. It indicates the chromosome we are currently on. It is an identifier from the reference genome. 
- **POS**: Means "position". It indicates at what position the variant is.
- **REF**: Mean *reference base(s)*. It indicates the base(s) that are present in the reference genome. A '.' means no variant.
- **ALT**: Means *alternate base(s)*. It indicates the alternate base(s) at the position. A '.' means no variant. 

### Q2
**Using these four columns, how could you determine whether a sequencing sample contains a variant?**
1) Look at the ALT column and check for rows where there is a nucleotide indicated. Meaning there was a variant found. 
2) Compare it to the REF column to confirm the variant.

### Q3
**After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains**
#### Patient tracks
There are the 3 tracks for the 3 patients. We can see the different reads of each patient and by clicking on it, we obtain more information in the specific read (read name, alignment start, mapping quality, read strand, genomic location, etc.). At the top we can see the coverage per base. So e.g. chr5:10'530, in patient 1 has a count of 54, and G was detected 54 times, so 100%. 
#### Gene track
There is a track (in my case) called "APC_canonical_relative_coordinates.gtf.gz" which represents the gene on chromosome 5. When clicking on it, it gives you the type, source, phase and location. In my case, that is Type = gene, Source = HAVANA, Phase = . and Location = chr5:5'000-143'741.
#### Transcript track 
There is one track representing the transcript reference strand. It is the sequence track, which when sufficiently zoomed in, is visible in many colours. These indicate the bases. 
#### Variant track
The fourth track is called "merged_results.vcf" and it contains the variant information for each patient. We can compare it to the merged_results_summary, and find, that there are the sections highlighted that you can find in the POS column.

### Q4
**Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why?**
#### 'aa' variant
This variant most likely has no major impact. It is located in an intron and does not cause a dangerous variation like for example a frameshift mutation. There is also no existing variant indicated and in general no further information on this variant. 
#### 'agagagaga' variant
The 'agagagaga' variant. It is located in an exon and in a protein coding regtion. It can cause a frameshift and can change the amino acid Lysine to either Lysine, Arginine, Glutamic acid or another amino acid. There is also disease data available. e.g. on a large intestine tumour (neoplasm) caused by this mutation. 

### Q5
**What phenotype or disease do you expect this variant to be involved with?** \
*Large intestine tumour* (colorectal neoplasm, neoplasm of the large intestine) and *stomach tumour* (neoplasm of the stomach, stomach neoplasm). 