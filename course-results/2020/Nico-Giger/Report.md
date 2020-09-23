 :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal:

## Day 3

1. Why do we use the terminal in bioinformatics?

Scipts --> reproducability
    
2. What is a plain text file?

data containing only characters of readable material (no graphical representation/other objects)
 
3. In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?
   
no need for other; easy to use/transform/access
    
4. How can we list files are in a directory? Please provide the command(s).
   
`ls` 

5. What | and > do in a terminal?

`|` piping e.g. 'left|right' --> do left and then right (chronologially)
`>` e.g. 'left>right' put output of 'left' in 'right
    
6. How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).

`tail /mnt/test/test.txt`

7. How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).

`awk '{print $1}' /mnt/test/test.txt`

9. How can we print every third line of a text file? Please provide the command(s), and discuss what they do.

`awk 'NR%3==0' file_name.txt` print line if the mod of line number (NR)/3 == 0

10. How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.

``awk 'NR % 4 == 1 {print ">"$1}; NR % 4 == 2 {print}' SP1.fq`` add '>' to the first line (sequence identifier) of each group of 4 and print the first two lines of all groups

11. Which are the advantages of BED/coordinate files as compared to storing just sequences?

storage efficieny

    
12. Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?
read depth, base sequence quality scores, GC content information, sequence duplication levels, overrepresented sequences


:metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal: :metal:

