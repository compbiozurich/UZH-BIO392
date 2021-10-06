## Exercises
>Most species have more than one versions of the reference genome. Please find out:
>1. The name and time of the latest version for Human, Mouse and E Coli. 
>2. The name and time of the first version for Human, Mouse and E Coli. 
>3. How many reference genomes were released in total for Human, Mouse, 
>and E Coli.

1. 
|Species|time|genome name|
|-------|----|-----------|
|Human|01.03.2019|GRCh38p13|
|Mouse|24.06.2020 |GRCm39 |
|_E. coli_| 26.09.2013| ASM584v2|

2.
|Species|time|genome name|
|-------|----|-----------|
|Human|May 2000 | hg1|
|Mouse|November 2001|mm1|
|_E. coli_|2013| ASM584v2|

3.
Human: 18    
Mouse: 11    
_E. coli_: 2    

> What do you think of the difference between genome versions?
> 1. Find out the difference in chromosome length between the latest patch of 
> hg38 and the last patch of hg19. The name and time of the first version for 
> Human, Mouse and E Coli. 
> 2. With your favorite gene, find out its position in hg38 and hg18.

1. .


| Chr | Chr length hg38 | Chr length hg19 | Difference  |
|-----|-----------------|-----------------|-------------|
| 1   | 248956422.00    | 249250621.00    | -294199.00  |
| 2   | 242193529.00    | 243199373.00    | -1005844.00 |
| 3   | 198295559.00    | 198022430.00    | 273129.00   |
| 4   | 190214555.00    | 191154276.00    | -939721.00  |
| 5   | 181538259.00    | 180915260.00    | 622999.00   |
| 6   | 170805979.00    | 171115067.00    | -309088.00  |
| 7   | 159345973.00    | 159138663.00    | 207310.00   |
| 8   | 145138636.00    | 146364022.00    | -1225386.00 |
| 9   | 138394717.00    | 141213431.00    | -2818714.00 |
| 10  | 133797422.00    | 135534747.00    | -1737325.00 |
| 11  | 135086622.00    | 135006516.00    | 80106.00    |
| 12  | 133275309.00    | 133851895.00    | -576586.00  |
| 13  | 114364328.00    | 115169878.00    | -805550.00  |
| 14  | 107043718.00    | 107349540.00    | -305822.00  |
| 15  | 101991189.00    | 102531392.00    | -540203.00  |
| 16  | 90338345.00     | 90354753.00     | -16408.00   |
| 17  | 83257441.00     | 81195210.00     | 2062231.00  |
| 18  | 80373285.00     | 78077248.00     | 2296037.00  |
| 19  | 58617616.00     | 59128983.00     | -511367.00  |
| 20  | 64444167.00     | 63025520.00     | 1418647.00  |
| 21  | 46709983.00     | 48129895.00     | -1419912.00 |
| 22  | 50818468.00     | 51304566.00     | -486098.00  |
| X   | 156040895.00    | 155270560.00    | 770335.00   |
| Y   | 57227415.00     | 59373566.00     | -2146151.00 |

2.
Huntingtin position:
hg38: Chr4: 3,074,681 - 3,243,960
hg19: Chr4: 3,076,408 - 3,245,687


> 1. Show gene TP53 in the genome browser. 
> 2. Where is this gene? (chromosome, cytoband, and exact start and end 
> positions) 
> 3. How many isoforms does it have? 
> 4. How many exons does it have? 
> 5. What the size of its longest exon? (roughly) 
> 6. Find the three closest genes in upstream and downstream, respectively.

2. TP53 is on Chr 17 on 17p13.1, which is quite central on the p-arm. exact: chr17:7,668,421-7,687,490
3. 11?
4. 10 / coding: 10
5. maybe around 1.25 kb
6. upstream: ATP1B2, SHBG, SAT2
   downstream: WRAP53, EFNB3, DNH2
   
> 1. Switch to hg19 and find TP53. 
> 2. What is the start and end positions?  
> 3. Switch to zebrafish, can you find TP53? 
> 4. Switch to Fruitfy, can you find TP53?

2. chr17:7,571,720-7,590,868
3. I guess its on chr5:24,086,227-24,097,799 in zebrafish in the GRCz11/danRer11
4. I don't think so. The only result will give a ribonucleotide reductase M2 B (TP53 inducible) S-homolog at chr2R:11,983,429-11,984,899


> 1. Down-lift: TP53 from hg38 to hg19 
> 2. Up-lift: TP53 from hg19 to hg38 
> 3. Cross-species-lift: TP53 from human to mouse 
> 4. Multi-step-lift: TP53 from hg38 to hg 18

1. it worked. "Successfully converted 1 record
2. Same here :-)
3. I am converting it from hg38 to GRCm38/mm10): It worked too :-)
4. I opened in atom and copied it back in and it worked


> Liftover with UCSC Genome Browser
> 1. Liftover multiple positions with a BED file. 
> 2. Lift a larger range and interpret the result. 
> 3. Limitations of the liftover.

1. I copied the example.bed into the browser assuming its hg38. Clifting it to hg19. It succcessfully converted 74 records and failed at 24 records.

Error-message
```  
Deleted in new:
    Sequence intersects no chains
Partially deleted in new:
    Sequence insufficiently intersects one chain
Split in new:
    Sequence insufficiently intersects multiple chains
Duplicated in new:
    Sequence sufficiently intersects multiple chains
Boundary problem:
    Missing start or end base in an exon
```  

2. try to lift chr17:7,000,000-13,000,000. That worked. Output: chr17:6903319-12903317. The region seem to be similarly big
3. Limitations: there seem to be a problem when there are insufficient intersects. See error message.
