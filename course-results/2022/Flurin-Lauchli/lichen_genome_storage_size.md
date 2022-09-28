**this file should answer the following two questions:**
1. Which file format would be suited to store a lichen genome?
2. How much storage wouold that take?
  
  

### prequel: What *is* a lichen genome?

lichen are symbiotic organisms comprised of a main funghus, a photobiont (algae and/or cyanobacterium) and other microbes with less well known function (yeast, bacteria). lichen thalli are "super-structures" of individual funghal, algal and/or bacterial cells. in contrast to us, they do not develop from a single cell (neither the whole organism nor the individual species taking part). some researchers consider them rather as a micro-ecosystem than as an organism, so a "lichen genome" is rather a metagenome of a lichen sample.
i will consider a lichen genome as the genetic material of the main symbionts (funghus + photobiont). More specifically, i will try to answer questions 1 and 2 for *Xanthoria parietina*, the most common lichen in western europe. This lichen mainly consists of *Xanthoria parietina* (the funghus; lichen are named after the funghus) and *Trebouxia arboricola* cells.
 
![IMG_2192](https://user-images.githubusercontent.com/103630748/192593882-01d1f9b1-f6f3-4fae-ac66-a8f59d0aceee.JPG)
*Xanthoria parietina*
 
 



## 1. Which file format would be suited to store a lichen genome?

- **whole exome sequencing (WES) might not be suited to analyze lichen genomes**
  - lichen are poikilohydric, meaning that the water content of lichen cells varies drastically
  - this variation of the water content comes with changes in cellular activity, including big changes in gene activities. followingly, the transctiptome of lichen is unsteady.
    - standard whole exome sequencing uses mRNA as a starting point, but this might not be a good option for lichen as the set of transctibed genes depends on the water content.
      - if standard WES would be performed on lichen, one would want to start with hydrated lichen because of their increased cellular activity
    - I doubt that other types of WES offer a suited solution, as the genomes involved in lichen are not very well understood  

- **whole genome sequencing (WGS) probably is better suited**
  - the employed sequencing method must be resistant to mixtures of DNA (the symbionts)
    - **nanopore sequencing** would probably be best suited, as the long read lengths enable pulling apart the different genomes in the lichen mixture.

- **as no reference genome for *X. parientina* and *T. arboricola* exist, the file format must store the whole sequence**
  - the only discussed file formats doing this are FASTA and FASTQ
    - as the stored genomes come with some uncertainty (nanopore sequencing), quality information should be retained -> **FASTQ**


## 2. How much storage wouold that take?

- genome sizes: 
  - *Xanthoria parietina* genome size is approx. 32Mbp
  > https://mycocosm.jgi.doe.gov/Xanpa2/Xanpa2.info.html
  - *Trebouxia arboricola* genome is approx. 53Mbp
  > https://phycocosm.jgi.doe.gov/TrebA12_1/TrebA12_1.info.html

- FASTQ file size:
  - depends on number of reads & length of reads
    - itself depends on sequencing method used
  - the *Xanthoria parietina* genome stored [here](https://mycocosm.jgi.doe.gov/Xanpa2/Xanpa2.info.html) is about 20GB big
    - this genome draft assembly comes with the raw data (FASTQ) and annotations, but the annotation file sizes are negligible
  - the *Trebouxia* genome stored [here](https://phycocosm.jgi.doe.gov/TrebA12_1/TrebA12_1.info.html) does not include the raw data (only sequence of genes, transcripts,..)
    - file size using the same parameters as for the *Xanthoria* genome would be approx. 53/32 * 20GB ≈ 33GB  
     
**total file size ≈ 50GB**
- storage costs would be negligible. (some 100CHF for hardware + some money for staff&maintenance/year, depends on organization)


