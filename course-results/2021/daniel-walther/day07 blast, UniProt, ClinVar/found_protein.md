_daniel walther_

# day07 lecture exercises: BLAST _protein_ scavenger hunt

go to [uniprot](https://www.uniprot.org)

enter the sequence from 'unknown_protein.fa'

[search result page](https://www.uniprot.org/blast/uniprot/B202109306320BA52A5CE8FCD097CB85A53697A35014F21P)

## 2. Use blast in Uniprot to search the unknown protein sequence
• Select the most possible manually reviewed entry. What is its Uniprot ID?
  * Uniprot ID [P01116 (GTPase KRas, Homo sapiens)](https://www.uniprot.org/uniprot/P01116)
• What protein does this sequence come from?
  * GTPase KRas
• Which organism does this sequence belong to?
  * Homo sapiens
• What is the function of this protein?
  * (de-)phosphorylation of GTA or GDP, usually as a means of releasing or storing energy. Used for many, many processes in cells.
• What is the _variant_ associated with acute leukemia in this protein? (Hint: see Pathology & Biotech Section)
  * VAR_034601, mutation is at position 10, from G to GG. 1 citation is attached to that record, which reports about the sampling & sequencing of the bone marrow of an individual with leukemia [Biochemical Characterization of a Novel KRAS Insertion Mutation from a Human Leukemia](https://www.sciencedirect.com/science/article/pii/S002192581978733X?via%3Dihub).

## 3. Extra: explore (other) blast services
If you have more time, play around to feel the difference of blast service from different databases.
For example,
• Use Blast in NCIT to query the protein sequence
• Use Blast in Uniprot to query the nucleotide sequence

Currently most interesting to me would a BLAST service which allows __sorting search results by (submission / measurement) date__, then could more easily track publication histories, for instance (hint: relevant to SARS-CoV-2 origin(s)).
