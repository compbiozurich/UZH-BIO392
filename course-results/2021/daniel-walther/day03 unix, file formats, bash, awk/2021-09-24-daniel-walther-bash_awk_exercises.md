_daniel walther_

# day03 [UNIX, bash & awk fundamentals](https://edu.sib.swiss/pluginfile.php/2878/mod_resource/content/4/couselab-html/content.html)

UNIX is a (family of) computer Operating Systems. MacOS and GNU/Linux are UNIX OS's, both run bash shell by default. Both OS's bundled their shells with the 'awk' programming language useful for file handling and other more abstract/complex operations.

## bash cheatsheet

```
cd [dir] # change working dir (directory) to 'dir'
cd ~ # go to home dir (directory), i.e. root/home/[username]
cd / # go to root dir

mkdir [options] [dir] # make dir, if not already existing
mkdir -p [dir] # (?) how is this different from: mkdir [dir] # I can see no difference in outcome
mkdir folder\ name\ spaced/ # make folders with spaces in the name

rmdir [options] [dir] # remove dir (?) not sure if deletes content, too
rm [options] [arg] #

ls # list contents of current directory
ls -l [dir] # list contents of [dir], -l include details, metadata
  # option -a: show all, including hidden files like . (e.g. starting with '.', system files etc.)
  # option -h: show human friendly details (e.g. size in KB instead of Bytes)

# copy-pasting: if you have copied e.g. an url and want to paste it into bash, you can use right-click.

chmod [options] [arg] # change mode = change permissios,
  # options: u (user), g (group), o (others), a (all)
  # options: a+rwx [arg] = for all give permissions to read,write,execute arg
  # arg (argument): a file, executable, folder, etc.
  # can also: chmod og-wx [arg]
  # see permissions: ls -l

[command] | [command] | [command] # so-called pipes '|' pass on the output to another command on the right of the '|'. a way of saying "do this |then do this |then this etc.

curl [options] url # get/load what the given url points to
curl -L url # follows (potential(?)) redirects of url and loads whatever page it lands on.

[command] > filename # saves the output in the file with filename, creates the file if it not already exists.

# continue this cheatsheet in due time from exercise 6 onwards.
```

## [AWK cheatsheet and more explanations surrounding AWK](https://www.grymoire.com/Unix/Awk.html#toc-uh-1)

No electronic copies allowed without explicit written approval.
Efficient, effective, elaboratory, teaching.
Anything written below is from myself, as a result of working through the course.

```bash
awk '{print $0}' file # prints the whole line (and goes through the file).
awk '{print $1}' file # prints the first field of the current line (and goes through the file).
```


# day03 [bash & file handling exercises](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2021/imallona/exercises.md)

These exercises are about learning UNIX shell (officially running MacOS in the course, but I am running the WSL (Windows Subsystem for Linux) ubuntu interface for Windows 10 - there might be minor syntax differences) and awk, for handling genomic data files.

## [Set up](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2021/imallona/exercises.md#set-up)

Exercises 1-4.

1. number of lines of the file ```~/course/data/example.bed```
```~$ wc ~/course/data/example.bed
100  300 1862 /home/radroy392/course/data/example.bed
~$ wc -l ~/course/data/example.bed
100 /home/radroy392/course/data/example.bed```
100 lines

2. Get manual page of ```head```, what is command for?
```man head```
```head - output the first part of files```

3. Get the first 5 lines of the file ```~/course/data/example.bed```
```~$ head -5 ~/course/data/example.bed
chr1    13219   13390
chr1    14695   14837
chr1    15784   15947
chr1    16848   17058
chr1    17231   17374```

4. Using pipes ``` | ```, chain command ```head -5``` before ```wc -l``` to check that there are 5 lines returned
```

## [FASTQ/A Exercises](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2021/imallona/exercises.md#fastqa-exercises)

Exercises 5-14.

5. retrieve file from some link
```curl -L http://imlspenticton.uzh.ch/imallona/teaching/SP1.fq > SP1.fq
```

6. Inspect the file from the previous exercise (file size, number of lines, and visualize its head)

```~/course/data/
ls -lh # file size
wc -l SP1.fq # line count (words are not meaningful)
head SP1.fq```
SP1.fq is a FASTQ file, 4 lines per entry (or "read sequence" - identifier, sequence, separator ('+'), and quality of sequence.
new entry (identifier) is a line starting with '@' (at least here).

7. The FASTQ file stored at ~/course/data/SP1.fq is in FASTQ format, meaning it contains 4 lines per read sequence.

```head -n 4 SP1.fq```

produces

```
@A01251:208:HJVFJDRXY:2:2101:23782:1000 1:N:0:CGCTCATT
TNGAAAATGATAAAAACCACACTGTAGAACAGATTAGATGAGTGAGTTACACTGAAAAACACATTCTTTGGAAACGGGATTTGTAGAATAGTGTATATCAATGAGTTACAATGAGAAACATGTAAAATTAAAAAAACCACAAAGTACAACA
+
F#FFFFFFFFFFFFFFFFFFFFFF:F:FFFFFFFFFFFFFFFFFFF:FFFFFFFFFFFFFFFFFFF,FFFFFFFF,FFF,FFFFFFFF,FFFFFFFFFFFFFFFFFFFFFFFFF:FF::,,F,FFF,F,:,FFFFFF,F,F,,F,:,,F,:
```

* So Line 1 contains a sequence identifier that begins with an @
* Line 2 contains the read sequence (A,T,C,G,N)
* Line 3 is a comment line, often unused and only contains a +
* Line 4 is the Phred quality score for each sequence encoded in ASCII format

First use ```wc``` and ```awk``` to determine the number of sequences in the fastq

```
wc -l SP1.fq # 40, so 10 sequences.
wc -l SP1.fq | awk '{print $1/4}' # 10, so 10 fastq records
```

8. A common mistake is to use ``grep`` to pattern match the ``@`` in the
sequence identifier. Why doesn't this work?

```bash
wc -l SP1.fq | awk '{print $1 / 4}'
```
renders `10`

```bash
grep -c "@" SP1.fq
```
renders `12`.

This does not work, because the Phred quality scores in this file contain some '@' and do not indicate start of new records. The pattern search would have to be refined / changed to another symbol, depending on the specific Phred encoding used (can be seen in the ID lines, if you know them well enough).

9. Next, extract only the _sequences_ of the records. Remember, these are only every second out of every four lines in fastq files.

```bash
awk 'NR % 4 == 2' SP1.fq # returns all the sequences. awk 'NR' keeps track of the current line number
awk 'NR % 4 == 2' SP1.fq | wc -l # 10. so the command works as intended and all 10 sequences are returned, with the newlines.
```

Answer (teacher): 2 ways:

One approach to this problem is to use the ``%`` `modulo operator` ([Wikipedia](https://en.wikipedia.org/wiki/Modulo_operation)), which returns the remainder after division of two integers. For example using ``awk``

```bash
awk 'BEGIN { {print 4 % 2}}' # dw: i don't get this command structure (BEGIN and the double {{}}) (?)
awk 'BEGIN { {print 4 % 3}}'
awk 'BEGIN { {print 5 % 3}}'
awk 'BEGIN { {print 1 % 4}}'
```

In ``awk`` there is a special variable ``NR`` which is equal to the
current line number.

So let's extract the sequences of the fasta file `SP1.fq`


```bash
awk 'NR%4==2'   ~/course/data/SP1.fq
```

10. - 12. skills result in code from 13. - skipping notes' redundancy
13. convert SP1.fq into the FASTA file format and store it in the file 'example.fa'

```bash
awk 'NR % 4 == 1 {print ">"$0}; NR % 4 == 2 {print}' SP1.fq > example.fa
```

14. Check that both, FASTQ and FASTA files have the same number of sequences (10).

```bash
awk 'NR % 4 == 2 {print NR}' SP1.fq | wc -l # 10
awk 'NR % 2 == 0 {print NR}' example.fa | wc -l # 10, checks out.
```

I finished the exercises 1-14 and understand everything so far. I like AWK.

TBD:
- Write awk cheatsheet for exercises 6-14.
- Exercises 17-32, at least (done by this evening, focus on knowledge and skills, and files - not notes, for now).
