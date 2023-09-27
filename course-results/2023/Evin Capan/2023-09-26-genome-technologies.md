# **Day 5 - Genome Technologies**

## **Storage Requirements for 1000 Genomes - an Estimation**
TCGA can be sufficiently encoded with only 2 bits per base (00, 01, 10, 11).
A typical human genome consists of 3,000,000,000 base pairs.
Bits per human genome: 2 * 3,000,000,000 = 6,000,000,000b
Byte = Bits * 0.125
Megabit (MB) = Bytes / 1,048,576
6,000,000,000 bits = 750,000,000 bytes = 715.64 Megabyte (MB)

So, one genome requires ~715 MB of storage. And **1000 genomes** require 715,000 MB of storage, which is equal to **715 Gigabytes (GB)**.

**- WES:** Whole Exome Sequencing (WES) focuses on sequencing only the protein-coding regions (exons) of genes, which constitute about 1-2% of the human genome: ~30,000,000 bases = **7.15 MB per genome**. WES has a higher depth of coverage for the exonic regions since it concentrates on a smaller portion of the genome and is more cost-effective (cheaper) than WGS. It is used in clinical settings and research studies where the focus is on identifying genetic variations in protein-coding regions related to known genetic diseases and can therefore improve diagnosis and treatment.

**- WGS:** Whole Genome Sequencing (WGS) encompasses sequencing the entire genome, including exons, introns, regulatory regions, and non-coding regions: 3,000,000,000 bases = **715 MB per genome**. WGS has a lower depth of coverage for any specific region compared to WES, but it covers the entire genome, which however makes WGS less cost-effective than WES. It is used for comprehensive analysis, discovery of new variants, understanding complex genetic traits, population genetics, and research involving non-coding regions.

## **File Types**

### SAM
123

### BAM
456

### VCF
789
