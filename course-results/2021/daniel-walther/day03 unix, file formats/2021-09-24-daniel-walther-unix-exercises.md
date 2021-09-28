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
```~/course/data$ curl 
