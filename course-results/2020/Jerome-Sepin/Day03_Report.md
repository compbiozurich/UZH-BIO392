


### Why do we use the terminal in bioinformatics?
Users can interact with the operating system of the computer through a terminal. Working with a terminal generally substitutes the graphical interface like choosing a directory with the mouse. However by working with a terminal has many advantages like being able to give more complex commands.
Also important in bioinformatics for the sake of reproducibility we need to keep track of our analysis. This can be achieved with a bash scripts, which is a plain text file that contains a series of commands we would type into the terminal.

### What is a plain text file?
A plain text file is a document that contains only text which is human readable. It means also that there is no for instance bold text, fonts (graphical representation of text) or any other special text formatting.

### In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq files we have discussed them today, but also SAM, BED, GTF, VCF and others (to be discussed next week). Why is that?



### How can we list files in a directory? Please provide the command(s).

```
cd /home/userB/project/docs/  # goes to choosen directory
ls -l # lists the content of the directory
````

### What | and > do in a terminal?
the '|' symbol is called 'pipe' in UNIX. It allows to directly pass the output from one program to the input of another without creating intermediate or temporary files.
The symbol ">" redirects everything before to the "thing" afterwards. For example the output of a code can be saved to a file.

### How do we print the last 10 lines of the file named /mnt/test/test.txt? Please provide the command(s).

```
tail -10 /mnt/test/test.txt    # -10 is not needed because printing 10 lines is the default
````

### How do we print the first column of the file named /mnt/test/test.txt whose columns are separatedby tabs? Please provide the command(s).

```
cut -f 1 /mnt/test/test.txt
```

### How can we print every third line of a text file? Please provide the command(s), and discuss what they do.

```
awk '{print NR % 3 == 0}' /mnt/test/test.txt    # if the floor fivision of the line number (NR) trough 3 is equal to zero, then it gets printed
```

### How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.

```
awk 'NR % 4 == 1 {print ">"$1};  # take the line whose number when divided by 4 leaves a rest equals 1, then print ">" and make sure the data is one row
     NR % 4 == 2 {print}' SP1.fq \ # take the line whose number when divided by 4 leaves a rest equals 2
```
