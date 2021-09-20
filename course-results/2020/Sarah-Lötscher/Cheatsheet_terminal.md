## Cheatsheet

````
Nano hello.pdf (create new file? ,to extit: Ctrl+X)
#!/bin/bash 
# this does stuff
# name -date
Echo hello world \|     ( \ to connect with command on next line) ````

Cat hello.pdf  ((file ausgeben)
More file.txt (better for long files as cat)
Less file.txt (better for long files as cat)
Head file.txt (onli gives header of file)
Tail file.txt(only gives tail of file)

File hello.txt (shows what type of file,  if file compressed then cannot say)
Curl URL (take from website)

Man man or man ‘comand’ (for manual /leave manual with q)
Ls (list file)
Ls -l (list files and attributterd)
Pwd (shows working directory)
Cd .. (change directory to eins vorher/parent      . /file.txt -> punk= current directory)
$Cd /filename (go to filename)
Mkdir newdir (make new directory) (press tabulator for options/ complete command)
Rmdir(remove directory)



Mv hello.pdf hello.txt (move file to/ can also be used to rename files)
ZB $mv docs Docs   or   $mv pictures .. (move one up to parent dictionary)
Cp sourcefile destinationfile/place (copy)
Rm file.txt (remove)
Rm -r 'dirname' ('recrusive' remove all contents and the directory)
 
Cal 
Date (calender or date information)
History (see history of commands)
!3 (use third command of history)
Clear (clears terminal)

Id (id command prints our userid, username, primary groupid, primary group name and secondary group(s) id number and name
Whoami (prints username)
Who (show all users logged on)

Sort (sorts lines of text files alphanumerically)
     ZB $sort < file.txt

Gzip hello.txt(compress file?) 
 
Tar -zcvf pictures.tar.gz 'pictures/filename' ( zipsup/compresses files)
Tar -tf pictures.tar.gz (see whats inside before unzipping)
Tar -zxvf pictures.tar.gz (unzip/extract)
 
 
Chmod <ownership> '+/-' <access> (changing acces premissions )
<ownership>= (User, Group, Other or All)|  <access> =(Read, Write or eXecute)
ZB: $ chmod g+w filename.txt


'ps' lists the processes including their respective PID
'jobs -l ' lists background and suspended processes including their job id, their PID, their status - Running/Stopped - and the command line info.
Fg  %2 'fg' followed by '%' and the job number ->move a running process in the foreground
 
Terminate process:
•	in the foreground, hold down the [CTRL] key and press 'c' - [CTRL+c]
•	in the background, use the 'kill' command followed by either '% + job id' or 'PID'
 
----
Diff (differences in files)
Grep(searching for strings in file)
Wc (counting words) 
 

tr " " "\\n"  < data.csv | grep ^GO:
('tr' is used to translate or transform the characters found in the first group of quotes into the second group of quotes. )
$tr -d '\r' <  file.csv ( would delete all the '\r' from the file.)
$tr '[a-z]' '[A-Z]' < file.csv (would transform every lower case to upper case)

uniq -c (remove duplicates)
 

--------

? matches exactly one character, ?? matches two characters   ---- ZB $ls -l dokument?.txt
*matches any number of charackters in a file or directory name ----ZB $ls -l *.txt
[] specify a range of charackters allowed at that position (use ! to exclude range of characters)
----ZB $ls -l document[4-6].txt or $ls -l document[!4-6].txt or $ls -l *.*[ !txt]
{} specify a list of terms separated by commas, ----ZB ls -l  {*.jpg,*.png}
 
Find 'place' (finding files)
-name ' filename'(serches for specific filename)
-type (searches for filetype ZB f= regularfiles, d= directorys)
-size(find files according to size c=bytes, k= kilobytes ,M=megabytes …)
$Find ~ -name '*' -size +5M
$Find ~ -name '3o*' -type d
WC
Wc -w file.txt (wordcount)
Wc -l (number of lines)
Wc -m (number of charakters)
Wc -L (length of longest line)
 
 
Diff -u file1.txt file2.txt (compares two files and outputs differences)
    -b, ignores changes in amount of white space
    -B, ignore changes that just insert or delete blank lines
    -s, reports when two files are the same - by default there is no report when two files are identical
    -q, reports only whether two files differ, no details of the differences
 

Grep (searches files for ords or patterns and displays the result)
-c or --count, displays the number of resulting lines instead of the result lines themselves
-i or --ignore-case, performs a case insensitive search of the pattern
-v or --invert-match, displays lines that _do not_ match the pattern
-n or --line-number, adds the line number in front of the result lines
-r, -R or --recursive, search all files recursively under each directory
    ZB how mani entry in FASTA file? -> 
$grep -c '^>' filename.fasta
'^' all the entrys that start with this zb '^.' (all entys starting with'.')
'$' all the entrys that end with this
 
 
 
Cut (extract selected parts, cuts collums)
-c or --characters, selection is done based on characters
-f or --fields, selection is done based on fields. Usually a number or a range is provided.
-d or --delimiter, fields are splitted according to the specified delimiter. The default delimiter is 'tab'.
ZB $cut -d "," -f 2,6 filename.tab (ersetzt tabs mit ',' und displays nur kollunen 2&6)
 
 
 
Uniq (reports lines from a file and how often they are found(mostly used after sort))
-d or --repeated, outputs only the duplicate lines
-c or --count, precedes each reported line with the number of occurrences
-i or --ignore-case, ignores the differences in case when comparing the lines
    ZB Sort filename.txt| uniq -c | head
    ZB Sort filename.txt| uniq -cd  (only display repeated lines with number of occurunces)
 
 
 
 
Awk (scans input file for lines that match any of a set of patterns specified)
$awk '{print NR "- " $1 }' sample.txt     (print: NR Rownumber, "- " , $1 first item )
$awk '{print NR $1 , $(NF-1) }' sample.txt     (print: NR Rownumber, $1 first item, $(NF-1) last item  )
$awk 'NR % 4 == 2'  file.fq  (print every second line)
$awk '{print  $1 /4 }' sample.txt  (print first number geteilt durch 4)
 
 
 
 
 
