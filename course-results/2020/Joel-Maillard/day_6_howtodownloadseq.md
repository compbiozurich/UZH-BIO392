# How do I obtain the sequence and/or annotation data for a release?

Sequence and annotation data downloads are usually made available within the first week of the release of a new assembly. The download directories are automatically updated nightly to incorporate additions and modifications to the data.

You can download sequence and annotation data using our FTP server, but we recommend using rsync, which has the advantage of starting up where it left off after a failure, when run again. Please see the previous link for examples.

You can also download data from our Downloads page or our DAS server. To download a specific subset of the data or to configure the output format of the data, use the Table Browser. For information on extracting a large set of sequences from an assembly, see Extracting sequence in batch from an assembly.

For more information on using the UCSC DAS server, see Downloading data from the UCSC DAS server.

Another option for querying sequence and annotation data is the REST API. This interface allows for extraction of sequence and annotations from both UCSC assemblies and from hubs.

To quickly download large volumes of data you can use UDR (UDT Enabled Rysnc): UDR provides users much faster download rates. Here is an example using UDR, once installed, to download all the mouse mm9 ENCODE information that amounts to several terabytes:

$ udr rsync -avP hgdownload.soe.ucsc.edu::goldenPath/mm9/encodeDCC/ /my/local/mm9/
$ udr rsync -avP hgdownload-euro.soe.ucsc.edu::goldenPath/mm9/encodeDCC/ /my/local/mm9/
