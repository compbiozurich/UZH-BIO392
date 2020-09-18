# Chapter 1

## Text-only interfaces (CLI) vs graphical interfaces (GUI)(e.g. Gnome, KDE, xfce, etc.)
--> The X Window System (X11) allows execution of programs with graphical interfaces.

## The kernel
The operating system kernel manages the computer's resources, such as the central processing unit (or "CPU"), the memory, all input/output (I/O) devices, etc.,
and allows other programs to run and use these resources.

## The shell
The shell program - also known as a Command Line Interpreter (CLI), is a text-only interface between the user and the kernel.
Its main function is to read the commands that are typed in the terminal window by the user and execute them.

## The programs
In addition to external programs that can be installed on the computer, UNIX or UNIX-like operating systems come with many built-in command-line interface programs
and shell utilities
--> The OS manages user actions and user applications. However, access to hardware resources are performed via the kernel

## GNU/Linux project: Fusion of two distinct projects:
The Linux Kernel  - by Linus Torvalds (1991), which was missing UNIX-like applications
The GNU project, which created UNIX-like libraries and applications, but was missing a mature kernel.

## prompt
The prompt is a symbol or a series of characters at the beginning of a line

## The X window system (also known as X11)
is a computer software system and network protocol that provides a basis for graphical user interfaces (GUIs) and
rich input device capability for networked computers.

## unix-server:~ userA$ tr " " "\\n" < go-data.csv | grep ^GO: | sort | uniq -c | sort -nr | head -10
-tr' to transform all the spaces ' ' - note the space between the quotes - into a newline character '\\n'
-'tr' command is executed using the content of the go-data.csv file.
-the '|' symbol is called 'pipe' in UNIX. It allows to directly pass the output from one program to the input of another without creating intermediate or temporary files.
 In this case, the result of the 'tr' command will be given as input to the next command
-the 'grep' command - for Global Regular Expression Parser - searches for words or patterns and displays the result lines.
Here we want to retrieve only the lines that start - note the '^' - with the pattern 'GO'
-sort the remaining lines
-remove duplicates using the 'uniq' command 
-count how many times each line is repeated with the '-c' option
-using the previous data, sort the numbers in reverse order, largest first - 'sort -nr'
-display only the first ten lines using the 'head' command


# Chapter 2

## Organization of the filesystem
single root directory --> sub directories(top-down tree):
/bin: executable files available to all users
/dev: device drivers - screen, keyboard, disks, etc.
/etc: administrative and information files
/home: users home - or private - directories.
/lib: shared library files
/mnt or /media: common place to mount external media - hard disks, CD/DVD ROM, USB keys, etc.
/tmp: used by many programs as a temporary file storage place
/usr: originally intended to keep all user-related commands. Nowadays, it is used for miscellaneous purposes.

Absolute path: starts at the root '/' and shows the path - the way - to reach the file
Relative path: starts at the current - working - directory and shows the path - the way - to reach the file

Every directory has two special sub directories:
-The current directory or working directory, refers to the directory you are in when executing a command.
 ./angelina.jpg ('.' means current directory) is equivilent to ./././angelina.jpg
-The parent directory, refers to the directory in which a sub directory is cataloged. '..'

## Mount points
extenal device (e.g. USB stick) gets mounted by operating system
--> Mounting is the inclusion of an additional filesystem to the currently accessible filesystem of a computer.
the specific directory is called mount point
'/media' directory is used a lot as the mount point for removable media filesystem

##Case sensitivity
The command line differenciates upper from lower case letters

## File extensions
Under UNIX, however, file extensions are arbitrary and do not have a particular meaning
conventions:
.sh	shell scripts
.pl	perl scripts 
.py	python scripts

.txt	text files
.csv	text files with Comma-Separated Values
.fasta	text files containing sequences in FASTA format

## users and access rights:
user, group, others; read, write, execute


# Chapter 3

## commands
command -x -y --option other_parameters
'-' for short and '--' for long options
-a or --all display all files (including hidden ones)
-l , uses a long listing format, including the access rights (e.g. 'ls -l')
-h or --human-readable , prints file and directory sizes in human readable format (e.g., 1K 234M 2G)
-t , sorts by modification time - the default sorting is the filename
-r , reverses the order while sorting
note: '~' means 'home directory'
In UNIX, we can often group the options and use only one '-'. For instance:
uname -s -p is equivalent to uname -sp
'id' prints our userid, username, primary groupid, primary group name and secondary group(s) id number and name
man uname for on-line manual pages of uname (press space for next site)
note: The date for cal stops in December 9999 - UNIX users already knew that the world would not end December 21, 2012!
date
cal
who
whoami
history
pwd
'cd' change directory
'ls' list
'ps' lists the processes including their respective PID
'jobs -l ' lists background and suspended processes including their job id, their PID, their status - Running/Stopped - and the command line info.
... see cheat sheet

## processes
A process is an executing - or running - program identified by a unique process identifier (PID)
process can run fore or -background, be suspended or killed
processes are also called allocation units
calling process is given a parent process ID - PPID - by the system

## Threads
is a light weight process or 'unit of execution' contained in a process (within same environment) 

## Cores (CPU)
Execution parts of CPU were dublicated and reorganized into cores which allows multithreading	

## two ways to run a process in the background
-adding an ampersand '&' at the end of the command
-suspending a process running in the foreground - hold down the [CTRL] key and press 'z' - before putting it in the background using the bg command
 e.g. sleep 10 --> [CTRL+z] (which suspends) --> bg (for putting in background)

## terminating a process
in foreground: [CTRL+c]
in background: kill followed by either '% + job id' or 'PID'


# Chapter 4

## wildcard characters
* matches any number of characters (none, one or more) in a file or directory name (e.g. 'ls -l *.txt' lists all files ending with '.txt')
? matches exactly one character - use '??' to match any group of 2 characters (e.g.  'ls -l angelina?.jpg' --> angelina1.jpg, angelina2.jpf,...) 
[] - square brackets, specify a range of characters allowed at that position - use '!' to exclude a range of characters at that position (e.g. 'ls -l angelina[!5-9].jpg')
{} - curly brackets, specify a list of terms - separated by commas (e.g. 's -l {*.jpg,*.jpeg,*.gif,*.png'})
e.g. 'ls -l *.*[!txt]' all files not ending on .txt

## ls -l
output example: 
total 0
drwxr-xr-x 1 abc abc 4096 Sep 16 13:27 UZH-BIO392
drwxr-xr-x 1 abc abc 4096 Sep 17 10:29 course

'-' indicates an ordinary file type, 'd' indicates a directory,  'l' indicates a link
'r' indicates read permission, 'w' indicates write permission, 'x' indicates execution permission

## modifying access
'chmod' <ownership> '+/-/=' <access>
<ownership> with u , g , o or a (a = ugo)
'+' to give '-' to take '=' to set
<access> 'r', 'w', 'x' (e.g. 'r-x' the group members are granted reading and executïng permissions, but not writing / modifying
e.g. 
'chmod g+w *.txt'
'chmod go-rwx *.*[!txt]'
--> grant group users write access to the files with the '.txt' extension, but remove any access (group + others) to all the other files

## file organization
'mkdir' make (new) direction
'mv' move to (e.g.  (1) 'mv {*.jpg,*.jpeg,*.gif,*.png} Pictures' for moving all of then into (existing) folder (on same level)
or (2)'mv Pictures ..' for moving in parent (one level up) direction or (3) 'mv vows.txt vows_draft.txt' for renaming a file or a directory)
'cp' copy (to new name or directory)
'rm' remove file, link, etc. ('-f' (force)ignores nonexistent files, never prompts for user confirmation; '-r' (recursively) removes directories and their contents)
'rmdir' remove directory (must be empty)

## note: link = alias = shortcut

## archiving data
'tar' creates, updates, expands archives
-z, or --gzip, compresses using gzip
-c, or --create, creates an archive
-x, or --extract, extracts from an archive
-t, or --list, display archive content
-v, or --verbose, displays information on the terminal window
-f, or --file, uses specified file


# Chapter 5

## 




