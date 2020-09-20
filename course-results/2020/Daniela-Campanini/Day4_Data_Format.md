# Data Formats and store costs (not finished. I like to add some info to SAM and BAM storage costs)

## Sequence Alignment Map (SAM)
The SAM is a text-based format. This format is used to storage information of sequence alignment after a next generation sequence methodology.
Each line correspond to a read sequence. There can be a header, which starts with the symbol @. The alignment section consists of a 11 columns line with information to each read sequence.
The SAMtools programs are used to edit SAM files. I didn't findet yet information about the storage place and so cost for a whole human genome (haploid). I suppose it depends from the reads obtained (number, lenght and informations of alignment).

## Binary Alignment Map (BAM)
The BAM is the binary equivalent of SAM. It consist of a compressed file in whiche the four nucleotides are represented each by two bits (00, 01, 10, 11) and therefore is used for long-term storage.

???have a little question about SAM and BAM. Did I understood correctly that both are a kinde of table containing informations about all read sequances used in an alignment?
How can I calculate the amount of data storage they need? If all times there is a different number of reads and informations, is it correct that storage space depends and varies between each genome sequecnsing?

## Variant Call Format (VCF)
This data format is tabular. Each line gives the information of ONE variant. A variant is a single nucleotide polymorphism (SNP), a delation, an insertion or another kinde of DNA variation. 
For each variant is given the Chromosome ID, the position ID, the reference nucleotide/sequence, the observed variations and more.
In avarage 0.1% variance is present between humans. In base pairs this would mean, 3 million variants. One VSF line neads about 45bytes. This means that in avarage the variants for a whole human genome needs 45bytes x 3million nucleotides = 129 megabytes (=0.000123TB) without coverance and header.
On amazone I found an [8TB Hard Disc](https://www.amazon.it/Seagate-Barracuda-8000GB-Serial-internal/dp/B075WYBQXJ/ref=sr_1_1?c=ts&dchild=1&keywords=Hard+Disk+interni&qid=1600562633&refinements=p_n_size_browse-bin%3A10864729031&rnid=517987031&s=pc&sr=1-1&ts_id=460102031) for the cost of 185 Euros. This would mean that the storage of a VCF file for mean variants of one human genome would cost: 0.000123TB*185Euros/8TB = 0.003Euro.

## Fasta
The FASTA format is a nice to see and to read format. It can be easely printed on A4, because each FASTA line is 80 characters long, which is the usual length of an A4 sheet. 
The files contains a Header (starts with an >) with Identifiers, which gives Identity to the content of the sequence, a.g. the specie name. 
The following lines contains each 80 characters and consists of a single letter sequence of nucleotides or amino acids.
This format is easy to manipulate and analise with text processing tools and script languages a.g. R, Python, Perl.
Ignoring the header and the coverings, the storage cost for one human genome, using the hard disc from named above, would be 0.07Euros. (Each letter = 1byte --> 3billion nucleotides/human genome = 3 billion bytes = 3GB)

In all my calculations the storage cost is very low. I aspected much more. Maybe I calculated somthing wrong(?)
