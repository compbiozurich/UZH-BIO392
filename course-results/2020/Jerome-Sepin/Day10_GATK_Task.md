# GATK Questions:
=============

### *1.	We see a C→T variant light up in red for the tumor but not the normal.* 
### *What do you think is happening in 2_tumor_normal_m2.bam?*

Whole exome sequencing has been made for a mixture of normal cells and breast cancer cells. At this position (chr17: 7’674’220) the coverage track reveals that there is a disagreement between the two cell types regarding the base that should be at this position.

| chr17: 7’674’22 |
| ------------- |
| Total count: 131    | 
| A : 0    | 
| C : 53 (40%, 36+, 17-)    | 
| G : 0   | 
| T : 78 (60%, 52+, 26-)  | 
| N : 0   | 

Because we have another track with only the exome of the tumour cell which says that at this position should be a Thymine and a track for normal cells which tells that there should be a Cytosine (which is also the case for the reference genome), one can conclude that at this position (chr17: 7’674’220) happened a point mutation in the breast tumour cell.

### *What are the three grouped tracks for the bamout?*
* Track 1: Shows what kind of haplotypes are possible
* Track 2: Reads of the Normal Cells
* Track3: Reads of the Tumor Cells
What do the colors indicate? 
Assigns the reads to the haplotype that matches the best
What differentiates the pastel versus gray reads?
The pastel one seems to correspond to the haplotype called HC = 1514625493 whereas the grey one has no HC number. Since the colour is grey, and everything in grey seems like it belongs tot he reference genome, I assume this colour also stands fort he haplotype oft he reference genome. But I am not sure.

