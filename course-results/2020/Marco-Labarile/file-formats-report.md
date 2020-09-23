# File formats and their uses in bioinformatics

* In bioinformatics, the amounts of data that have to be handled are commonly very large. Terminals and command line interfaces are well equipped to deal with large datasets efficiently. Through the use of open source software and scripting the process becomes transparent and easily reproducible and modifiable.

* A plain text file is a file that contains information in the form of text, such as letters, numbers, punctuation, etc. They can be generated and edited by a range of widely available text editors such as notepad, TextEdit or nano.

* Plain text files are widespread in bioinformatics in part due to the fact that they are (relatively) human-readable and easy to parse.

* Listing the contents of the current directory can be done by using `ls` in a terminal:

```{bash}
ls

ls -l	# for a list view

ls -a	# including elements starting with "." which are usually hidden
```

Listing *only* files and not directories can be done by using `find`:

```{bash}
find . -maxdepth 1 -type f	# . is the current directory, "-maxdepth 1" limits the search
				to the current directory, "-type f" limits the search to files.
```

* `|` ("pipe") is used in a terminal to use the output of one command as the input of the following command. For example, the output (using `cat`) of the file SP1.fq can be used as an argument for `wc`, allowing you to count the lines of a text-file in one step and without printing the output of the `cat`-command:

```{bash}
cat SP1.fq | wc -l	# the output is the number of lines in SP1.fq
```

`>` ("redirect") is used to save the output of a command as a file. For example, the output of the above line can be redirected to a file:

```{bash}
cat SP1.fq | wc -l > SP1_lines.txt

cat SP1_lines.txt	# the output is the number of lines in SP1.fq
```

Similarly, files can be downloaded using the redirect:

```{bash}
curl -L http://example.url/file.txt > file.txt
```

* Printing the last 10 lines of the file `/mnt/test/test.txt` can be done using `tail`:

```{bash}
tail /mnt/test/test.txt	# outputs the last 10 lines if no other number specified

tail -n 5 /mnt/test/test.txt	# outputs the last 5 lines
```

* Printing the first column of a tab-separated file named `/mnt/test/test.txt` can be done using `awk`:

```{bash}
awk -v OFS="\t" '{print $1}'	# -v OFS="\t" defines the character that separates the fields as
				a tab ("\t"). '{print $1}' then prints the first field ("$1") of 
				each line. Since no condition is given, this is performed on all lines.
```

* Printing every third line works similarly with `awk`, but this time a condition is needed to filter out the unwanted lines:

```{bash}
awk 'NR % 3 == 1' /mnt/test/test.txt	# this prints all lines with a line number ("NR") that 
					satisfies the condition of NR % 3 == 1, which is the remainder
					of the division of NR by 3.
```

* FASTQ-files are extensions of FASTA-files. Additionally to an identifier-line and a sequence-line, they contain a line that is usually only occupied by a "+" and a line that contains information on the read quality. Converting from FASTQ to FASTA can therefore be done by removing the last two lines of every entry and prepending a ">" to every identifier-line. The latter is done since FASTA-files conventionally mark their identifier-lines with a ">".

```{bash}
awk 'NR % 4 == 1 {print ">"$0};
	 NR % 4 == 2 {print}' example.fasta > example.fastq
```

Since FASTQ-files contain 4 lines per sequence, we have to use `NR % 4 == 1` to extract the first line of every block of 4 lines. The first line is the sequence identifier, to which we simply add a ">" in front of the whole line (`$0`) to comply with the FASTA-standard. similarly, we extract the second line of every block of 4 lines with `NR % 4 == 2`. Since this contains the sequence data, which is unchanged between FASTA and FASTQ, we simply print this line in full. Finally, we redirect the output of this `awk`-command using `>` and save it as a new FASTQ file named example.fastq.
