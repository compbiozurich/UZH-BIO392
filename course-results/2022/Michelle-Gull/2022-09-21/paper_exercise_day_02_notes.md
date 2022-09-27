# 2022-09-21 paper exercise day_02

* What is CNV/CNA? <br>
  Copy number variants (CNA) refers to (germline) changes in number of gene copies in the genome of an individual. <br>
  Copy number abberations (CNVs) refers to (somatic) changes resulting in deletion or amplification of large contiguous segments of the genome.


* How will you describe or introduce progenetix (scale, data source, cancer types and so on)? <br>
  Largest freely available cancer mutation database with individual sample data from various sources.
  The Progenetix database provides an overview of mutation data in cancer, with a focus on copy number abnormalities (CNV / CNA), for all types of human malignancies. The data is based on individual sample data from currently 142063 samples. It includes data of 834 different cancer tpes, mapped to a variety of technical and medical categories. A possible use of the databank can be the search for local copy number aberrations, involving for example a gene, and the exploration of cancer types with these CNVs. The Search Page provides example use cases for designing queries. The results contain statistics but also visualization and download options.


* Describe NCIt, ICOD, UBERON codes, and their relationships.<br>
  NCIt is the National Cancer Institute Thesaurus. ICDO means International Classification of Diseases in Oncology. It is limited to hierachical concepts and is hard to apply to modern ontologies. NCIt was developed more dynamical and therefore layering data aggregations and transferring to other systems and resources is possible. Connecting the two was done to make use of the hierarchical benefits ICDO has. UBERON allows cross-species anatomical structural ontology. In a resource update, ICDO T codes were mapped to UBERON terms.
  
  
* What are CNV segmentations and CNV frequencies, and how to use them? <br>
  CNV frequency in Progenetix: Divide the genome into 1Mb-size bins and then count the occurrences of gain/loss events for all bins in the      selected samples
  <img width="1640" alt="Screen Shot 2022-09-23 at 09 55 02" src="https://user-images.githubusercontent.com/114056296/191915434-3b12a8e7-e1d2-4f7a-8a29-b561be664737.png">

* What are APIs and how to use APIs in progenetix?<br>
  Application Programming Interfaces = "rules how apllications can communicate with eachother".

* How does progenetix visualise CNA profiles?<br>
  The visualization can be customized via visulization options. For example, one could watch out for selected chromosomal regions or group the data by studies and subset. As an alternative, users can upload their own data for single or even multiple samples to visualize genome-wide CNA.


* What do you think should be improved in progenetix?<br>
  New tools of clinical and diagnostical use could be implemented.
