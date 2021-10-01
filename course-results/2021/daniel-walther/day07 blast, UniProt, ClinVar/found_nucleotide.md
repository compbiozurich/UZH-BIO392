_daniel walther_

# day07 lecture exercises: BLAST _nucleotide_ scavenger hunt

see 'unknown_nucleotide.fa' for sequence.

[blast ncbi search (start)](https://blast.ncbi.nlm.nih.gov/Blast.cgi)
  - [blast nucleotide search](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastn&PAGE_TYPE=BlastSearch&LINK_LOC=blasthome)

A 101 results popped up, a 100 of them have an E-value of 0.0, meaning they match 100% the query sequence. All the results are sequences from the SARS-CoV-2 RNA nuc. seq., with varying place of origin (among them is USA, Finland, Switzerland, Thailand, probably more).

I chose the entry with the shortest sequence, which was submitted from Thailand (following section).

## [GenBank: OK084522.1](https://www.ncbi.nlm.nih.gov/nucleotide/OK084522.1?report=genbank&log$=nucltop&blast_rank=1&RID=NAUJ4KEM01N) result:

```
LOCUS       OK084522                4123 bp    RNA     linear   VRL 10-SEP-2021
DEFINITION  Severe acute respiratory syndrome coronavirus 2 isolate
            SARS-CoV-2/human/THA/CU166/2020 ORF1ab polyprotein, 2'-O-ribose
            methyltransferase region, (ORF1ab) gene, partial cds; surface
            glycoprotein (S) gene, complete cds; and ORF3a protein (ORF3a)
            gene, partial cds.
ACCESSION   OK084522
VERSION     OK084522.1
KEYWORDS    .
SOURCE      Severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2)
  ORGANISM  Severe acute respiratory syndrome coronavirus 2
            Viruses; Riboviria; Orthornavirae; Pisuviricota; Pisoniviricetes;
            Nidovirales; Cornidovirineae; Coronaviridae; Orthocoronavirinae;
            Betacoronavirus; Sarbecovirus.
REFERENCE   1  (bases 1 to 4123)
  AUTHORS   Puenpa,J., Chansaenroj,J., Yorsaeng,R., Kitphati,R.,
            Mungaomklang,A., Kongklieng,A., Suwannakarn,K. and Poovorawan,Y.
  TITLE     Molecular characterization and tracking of the severe acute
            respiratory syndrome coronavirus 2 in the first, during state
            quarantine and second wave outbreaks in Thailand
  JOURNAL   Unpublished
REFERENCE   2  (bases 1 to 4123)
  AUTHORS   Puenpa,J., Chansaenroj,J., Yorsaeng,R., Kitphati,R.,
            Mungaomklang,A., Kongklieng,A., Suwannakarn,K. and Poovorawan,Y.
  TITLE     Direct Submission
  JOURNAL   Submitted (10-SEP-2021) Pediatric, Center of Excellence in Clinical
            Virology, Faculty of Medicine, Chulalongkorn University, Phayathai,
            Bangkok 10330, Thailand
COMMENT     ##Assembly-Data-START##
            Sequencing Technology :: Sanger dideoxy sequencing
            ##Assembly-Data-END##
FEATURES             Location/Qualifiers
     source          1..4123
                     /organism="Severe acute respiratory syndrome coronavirus
                     2"
                     /mol_type="genomic RNA"
                     /isolate="SARS-CoV-2/human/THA/CU166/2020"
                     /host="Homo sapiens"
                     /db_xref="taxon:2697049"
                     /country="Thailand"
                     /collection_date="2020-05-05"
     gene            <1..210
                     /gene="ORF1ab"
     CDS             <1..210
                     /gene="ORF1ab"
                     /codon_start=1
                     /product="ORF1ab polyprotein"
                     /protein_id="UAJ56557.1"
                     /translation="FWRNTNPIQLSSYSLFDMSKFPLKLRGTAVMSLKEGQINDMILS
                     LLSKGRLIIRENNRVVISSDVLVNN"
     mat_peptide     <1..207
                     /gene="ORF1ab"
                     /product="2'-O-ribose methyltransferase"
     gene            218..4039
                     /gene="S"
     CDS             218..4039
                     /gene="S"
                     /codon_start=1
                     /product="surface glycoprotein"
                     /protein_id="UAJ56558.1"
                     /translation="MFVFLVLLPLVSSQCVNLTTRTQLPPAYTNSFTRGVYYPDKVFR
                     SSVLHSTQDLFLPFFSNVTWFHAIHVSGTNGTKRFDNPVLPFNDGVYFASTEKSNIIR
                     GWIFGTTLDSKTQSLLIVNNATNVVIKVCEFQFCNDPFLGVYYHKNNKSWMESEFRVY
                     SSANNCTFEYVSQPFLMDLEGKQGNFKNLREFVFKNIDGYFKIYSKHTPINLVRDLPQ
                     GFSALEPLVDLPIGINITRFQTLLALHRSYLTPGDSSSGWTAGAAAYYVGYLQPRTFL
                     LKYNENGTITDAVDCALDPLSETKCTLKSFTVEKGIYQTSNFRVQPTESIVRFPNITN
                     LCPFGEVFNATRFASVYAWNRKRISNCVADYSVLYNSASFSTFKCYGVSPTKLNDLCF
                     TNVYADSFVIRGDEVRQIAPGQTGKIADYNYKLPDDFTGCVIAWNSNNLDSKVGGNYN
                     YLYRLFRKSNLKPFERDISTEIYQAGSTPCNGVEGFNCYFPLQSYGFQPTNGVGYQPY
                     RVVVLSFELLHAPATVCGPKKSTNLVKNKCVNFNFNGLTGTGVLTESNKKFLPFQQFG
                     RDIADTTDAVRDPQTLEILDITPCSFGGVSVITPGTNTSNQVAVLYQDVNCTEVPVAI
                     HADQLTPTWRVYSTGSNVFQTRAGCLIGAEHVNNSYECDIPIGAGICASYQTQTNSPR
                     RARSVASQSIIAYTMSLGAENSVAYSNNSIAIPTNFTISVTTEILPVSMTKTSVDCTM
                     YICGDSTECSNLLLQYGSFCTQLNRALTGIAVEQDKNTQEVFAQVKQIYKTPPIKDFG
                     GFNFSQILPDPSKPSKRSFIEDLLFNKVTLADAGFIKQYGDCLGDIAARDLICAQKFN
                     GLTVLPPLLTDEMIAQYTSALLAGTITSGWTFGAGAALQIPFAMQMAYRFNGIGVTQN
                     VLYENQKLIANQFNSAIGKIQDSLSSTASALGKLQDVVNQNAQALNTLVKQLSSNFGA
                     ISSVLNDILSRLDKVEAEVQIDRLITGRLQSLQTYVTQQLIRAAEIRASANLAATKMS
                     ECVLGQSKRVDFCGKGYHLMSFPQSAPHGVVFLHVTYVPAQEKNFTTAPAICHDGKAH
                     FPREGVFVSNGTHWFVTQRNFYEPQIITTDNTFVSGNCDVVIGIVNNTVYDPLQPELD
                     SFKEELDKYFKNHTSPDVDLGDISGINASVVNIQKEIDRLNEVAKNLNESLIDLQELG
                     KYEQYIKWPWYIWLGFIAGLIAIVMVTIMLCCMTSCCSCLKGCCSCGSCCKFDEDDSE
                     PVLKGVKLHYT"
     gene            4048..>4123
                     /gene="ORF3a"
     CDS             4048..>4123
                     /gene="ORF3a"
                     /codon_start=1
                     /product="ORF3a protein"
                     /protein_id="UAJ56559.1"
                     /translation="MDLFMRIFTIGTVTLKQGEIKDATP"
ORIGIN      
        1 ttttggagga atacaaatcc aattcagttg tcttcctatt ctttatttga catgagtaaa
       61 tttcccctta aattaagggg tactgctgtt atgtctttaa aagaaggtca aatcaatgat
      121 atgattttat ctcttcttag taaaggtaga cttataatta gagaaaacaa cagagttgtt
      181 atttctagtg atgttcttgt taacaactaa acgaacaatg tttgtttttc ttgttttatt
      241 gccactagtc tctagtcagt gtgttaatct tacaaccaga actcaattac cccctgcata
      301 cactaattct ttcacacgtg gtgtttatta ccctgacaaa gttttcagat cctcagtttt
      361 acattcaact caggacttgt tcttaccttt cttttccaat gttacttggt tccatgctat
      421 acatgtctct gggaccaatg gtactaagag gtttgataac cctgtcctac catttaatga
      481 tggtgtttat tttgcttcca ctgagaagtc taacataata agaggctgga tttttggtac
      541 tactttagat tcgaagaccc agtccctact tattgttaat aacgctacta atgttgttat
      601 taaagtctgt gaatttcaat tttgtaatga tccatttttg ggtgtttatt accacaaaaa
      661 caacaaaagt tggatggaaa gtgagttcag agtttattct agtgcgaata attgcacttt
      721 tgaatatgtc tctcagcctt ttcttatgga ccttgaagga aaacagggta atttcaaaaa
      781 tcttagggaa tttgtgttta agaatattga tggttatttt aaaatatatt ctaagcacac
      841 gcctattaat ttagtgcgtg atctccctca gggtttttcg gctttagaac cattggtaga
      901 tttgccaata ggtattaaca tcactaggtt tcaaacttta cttgctttac atagaagtta
      961 tttgactcct ggtgattctt cttcaggttg gacagctggt gctgcagctt attatgtggg
     1021 ttatcttcaa cctaggactt ttctattaaa atataatgaa aatggaacca ttacagatgc
     1081 tgtagactgt gcacttgacc ctctctcaga aacaaagtgt acgttgaaat ccttcactgt
     1141 agaaaaagga atctatcaaa cttctaactt tagagtccaa ccaacagaat ctattgttag
     1201 atttcctaat attacaaact tgtgcccttt tggtgaagtt tttaacgcca ccagatttgc
     1261 atctgtttat gcttggaaca ggaagagaat cagcaactgt gttgctgatt attctgtcct
     1321 atataattcc gcatcatttt ccacttttaa gtgttatgga gtgtctccta ctaaattaaa
     1381 tgatctctgc tttactaatg tctatgcaga ttcatttgta attagaggtg atgaagtcag
     1441 acaaatcgct ccagggcaaa ctggaaagat tgctgattat aattataaat taccagatga
     1501 ttttacaggc tgcgttatag cttggaattc taacaatctt gattctaagg ttggtggtaa
     1561 ttataattac ctgtatagat tgtttaggaa gtctaatctc aaaccttttg agagagatat
     1621 ttcaactgaa atctatcagg ccggtagcac accttgtaat ggtgttgaag gttttaattg
     1681 ttactttcct ttacaatcat atggtttcca acccactaat ggtgttggtt accaaccata
     1741 cagagtagta gtactttctt ttgaacttct acatgcacca gcaactgttt gtggacctaa
     1801 aaagtctact aatttggtta aaaacaaatg tgtcaatttc aacttcaatg gtttaacagg
     1861 cacaggtgtt cttactgagt ctaacaaaaa gtttctgcct ttccaacaat ttggcagaga
     1921 cattgctgac actactgatg ctgtccgtga tccacagaca cttgagattc ttgacattac
     1981 accatgttct tttggtggtg tcagtgttat aacaccagga acaaatactt ctaaccaggt
     2041 tgctgttctt tatcaggatg ttaactgcac agaagtccct gttgctattc atgcagatca
     2101 acttactcct acttggcgtg tttattctac aggttctaat gtttttcaaa cacgtgcagg
     2161 ctgtttaata ggggctgaac atgtcaacaa ctcatatgag tgtgacatac ccattggtgc
     2221 aggtatatgc gctagttatc agactcagac taattctcct cggcgggcac gtagtgtagc
     2281 tagtcaatcc atcattgcct acactatgtc acttggtgca gaaaattcag ttgcttactc
     2341 taataactct attgccatac ccacaaattt tactattagt gttaccacag aaattctacc
     2401 agtgtctatg accaagacat cagtagattg tacaatgtac atttgtggtg attcaactga
     2461 atgcagcaat cttttgttgc aatatggcag tttttgtaca caattaaacc gtgctttaac
     2521 tggaatagct gttgaacaag acaaaaacac ccaagaagtt tttgcacaag tcaaacaaat
     2581 ttacaaaaca ccaccaatta aagattttgg tggttttaat ttttcacaaa tattaccaga
     2641 tccatcaaaa ccaagcaaga ggtcatttat tgaagatcta cttttcaaca aagtgacact
     2701 tgcagatgct ggcttcatca aacaatatgg tgattgcctt ggtgatattg ctgctagaga
     2761 cctcatttgt gcacaaaagt ttaacggcct tactgttttg ccacctttgc tcacagatga
     2821 aatgattgct caatacactt ctgcactgtt agcgggtaca atcacttctg gttggacctt
     2881 tggtgcaggt gctgcattac aaataccatt tgctatgcaa atggcttata ggtttaatgg
     2941 tattggagtt acacagaatg ttctctatga gaaccaaaaa ttgattgcca accaatttaa
     3001 tagtgctatt ggcaaaattc aagactcact ttcttccaca gcaagtgcac ttggaaaact
     3061 tcaagatgtg gtcaaccaaa atgcacaagc tttaaacacg cttgttaaac aacttagctc
     3121 caattttggt gcaatttcaa gtgttttaaa tgatatcctt tcacgtcttg acaaagttga
     3181 ggctgaagtg caaattgata ggttgatcac aggcagactt caaagtttgc agacatatgt
     3241 gactcaacaa ttaattagag ctgcagaaat cagagcttct gctaatcttg ctgctactaa
     3301 aatgtcagag tgtgtacttg gacaatcaaa aagagttgat ttttgtggaa agggctatca
     3361 tcttatgtcc ttccctcagt cagcacctca tggtgtagtc ttcttgcatg tgacttatgt
     3421 ccctgcacaa gaaaagaact tcacaactgc tcctgccatt tgtcatgatg gaaaagcaca
     3481 ctttcctcgt gaaggtgtct ttgtttcaaa tggcacacac tggtttgtaa cacaaaggaa
     3541 tttttatgaa ccacaaatca ttactacaga caacacattt gtgtctggta actgtgatgt
     3601 tgtaatagga attgtcaaca acacagttta tgatcctttg caacctgaat tagactcatt
     3661 caaggaggag ttagataaat attttaagaa tcatacatca ccagatgttg atttaggtga
     3721 catctctggc attaatgctt cagttgtaaa cattcaaaaa gaaattgacc gcctcaatga
     3781 ggttgccaag aatttaaatg aatctctcat cgatctccaa gaacttggaa agtatgagca
     3841 gtatataaaa tggccatggt acatttggct aggttttata gctggcttga ttgccatagt
     3901 aatggtgaca attatgcttt gctgtatgac cagttgctgt agttgtctca agggctgttg
     3961 ttcttgtgga tcctgctgca aatttgatga agacgactct gagccagtgc tcaaaggagt
     4021 caaattacat tacacataaa cgaacttatg gatttgttta tgagaatctt cacaattgga
     4081 actgtaactt tgaagcaagg tgaaatcaag gatgctactc ctt
//
```

## from the slides:

1. Use blast in NCIT to search the unknown nucleotide sequence
• Which organism does this sequence belong to?
  * SARS-CoV-2
• Pick one blast result. What is the accession number, max score, query cover and E value?
  * acc. [OK084522.1](https://www.ncbi.nlm.nih.gov/nucleotide/OK084522.1?report=genbank&log$=nucltop&blast_rank=1&RID=NAUJ4KEM01N)
  * max. score is 6929
  * query cover 100%
  * e value 0.0
  * (acc. length is 4123, which is the shortest of the results)
• Which region does this sequence cover [on] the subject sequence? (The answer could be different [depending] on the accession that you choose)
  * 288 to 4039, see [my result](https://blast.ncbi.nlm.nih.gov/Blast.cgi#alnHdr_2091995964)
• Is it DNA or RNA sequence?
  * RNA (SARS-viruses are RNA viruses). This information can also be seen in the first line ('LOCUS') of the GenBank page (didn't find a download link
• Does it encode a (part of [a]) protein? If yes, which protein? (Hint: use different blast type)
  * from this file: "surface glycoprotein"
  * Aha, using a different blast type will show details relating to the encoded protein
    * [blastx search (translated nucleotide > protein)](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastx&PAGE_TYPE=BlastSearch&LINK_LOC=blasthome), be patient, it might take a while (a minute or so, maybe)
	* [shortest acc. QWU02530.1](https://www.ncbi.nlm.nih.gov/protein/QWU02530.1?report=genbank&log$=prottop&blast_rank=1&RID=NAYZ3C5301N) which confirms the above information that the sequence encodes a surface glycoprotein. One of the many results shows [Chain A, spike glycoprotein](https://www.ncbi.nlm.nih.gov/protein/6XR8_A?report=genbank&log$=protalign&blast_rank=1&RID=NAYZ3C5301N), all other say 'surface glycoprotein', just fyi / btw.

QU: What does 'accession' mean in BLAST context? ... in bioinformatics context in general?