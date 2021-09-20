# Introduction to Unix

## What is UNIX?

UNIX is a family of computer operating systems that comply with the Single Unix Specifications. 
Its philosophy is to :
* Write programs that do one thing and do it well
* Write programs to work together
* Write programs to handle text streams as that is a universal interface

We use it in bioinformatics as we interpret DNA & proteins as text and UNIX is for test streams. Furhtermore, we work with big data that is too large to be handled by a spreadsheet. 

## Computer files

* Data representations stored in computers as arrays of bytes
* File type defined by its bytes, not by the filename extension!
* contain metadata
* Plain text files are composed by bytes mapped directly to ASCII characters
* Text editors allow editingg text fiels
* Text fiels can be read without proprietary software

## Organizing a shell script

* UNIX command are case sensitive, if we use TextEdit, we have to disable the automatic spell checks
* We wirte on top of the shebang
* Always write the date, what the script is about and your name
* comment lines start with #
* multiline chuncks are split by a \
* commands are introduced one line each

Key Unix features   | Description
---|---
__Multiuser__| Different users (& differetn locations) can connect to same server & execute differetn programs at same time
__Multitasking__ | Several programs/processes can run on same server at the same time
__Networking__ | Network is central for remote access & computation (?)
__Various user interfaces__ | CLI complemented with numerous GUI through X Window sytsem


### Operating system (OS):
#### Collection of software that manages computer hardware resources, provides common services for computer programs 

Component | Descripton
---|---
__the kernel__ | <ul><li>Manages computer's resources (CPU, memory, input/output, devices, etc.)</li><li> allows other programs to run & use the resources</li></ul>
__the shell (Command Line Interpreter/CLI)__ | <ul><li>text-only interface between user and the kernel</li><li>reads commands in terminal and executes them</li><li>Several different shells, command-line interface programs work for most</li></ul>
__the programs__ | <ul><li>UNIX comes with many built-in command-line interface programs and shell utilities</li><li>http://en.wikipedia.org/wiki/Template:Unix_commands</li></ul> 

### Powering up a computer:
1. Hardware initialization
2. Loading the OS
3. User control

### GNU/Linux
* Free Unix-like operating system
* Fusion of two projects: https://en.wikipedia.org/wiki/Linux_kernel & https://www.gnu.org/
* Adapted to many systems 
* Comes in many distributions, server or home oriented

### The prompt
* symbol or a series of characters at the beginning of a line
* indicates that the system is ready to receive input
* ususally represented by the '>' sign in DOS and by the '$' sign in UNIX

### Advantages of the command line
* has programming language features
* can be assembled into scripts for easy execution of a group of commands
* provides filename and command auto-completion
* provides a history of executed commands
* you can work with every type of content using the shell
* you can perform complex computations on remote servers
* you can display windows of remote applicatons on your screen

## The Unix filesystem
### Organization
* UNIX uses a hierarchical filesystem structure to manage all files and directories
* top-down tree:
  * single __root directory '/'__ on top 
  * sub directories underneath which organize files and sub directories of the system, they include:
    * Files
    * Directories
    * __Symbolic link__ --> a file containing the path to another file
    * __home directory__ --> the 'private' directory of a user
    * Working directory --> current directory
  
 Most systems have certain set of subdirectories:
 
 Subdirectory | Description
 --- | ---
/bin | executable files available to all users
/dev |device drivers - screen, keyboard, disks, etc.
/etc |administrative and information files
/home | users home - or private - directories.
/lib | shared library files
/mnt or /media | common place to mount external media - hard disks, CD/DVD ROM, USB keys, etc.
/tmp | used by many programs as a temporary file storage place
/usr | originally intended to keep all user-related commands. Nowadays, it is used for miscellaneous purposes.
 
### absolute and relative path
* The __absolute path__ starts at the root '/' 
* The __relative path__ starts at the current working directory 

### current and parent directory
* The __current directory__ or __working directory__, refers to the directory you are in when executing a command
* The __parent directory__ refers to the directory in which a sub directory is cataloged

### Mount points
if external device is connected to the computer we say it is "mounted" by the operating system

&#8594; this adds filesystem on the external device to the currently accessible filesystem of the computer

&#8594; only one root, therefore the additional fielsystem has to be added into a speciic sub directory

&#8594; This directory is called the __mount point__

The root directory of the added filesystem will be renamed & becomes a subdirectory in the mount point directory

### Filename limits
* forbdden character: __/__
* Characters with particular meaning for the shell: __[space] [enter] - ; * [quotes]__, etc.
* International characters are not recognized by all filesystems

### Filename extension
* in some operating systems, file extensions are important and define the types of files 
* __UNIX: ile extensions are arbitrary and do not have a particular meaning__ (for the operating system
* some extensions are used by convention:
  * __.sh__	used for shell scripts - text files containing a series of shell commands
  * __.pl__	used for perl scripts - text files containing PERL commands
  * __.py__	used for python scripts - text files containing PYTHON commands
* some extensions widely used in bioinformatics:
  * __.txt__	used for text files with no particular format
  * __.csv__	used for text files with Comma-Separated Values
  * __.fasta__	used for text files containing sequences in FASTA format

### Users and access rights
* UNIX distinguishes three levels of ownership:
  * __user:__ the user who owns the file
  * __group:__ other users in the same group as the user who owns the file
  * __others:__ all the other users in the system, as compared to the User and the User's group.
* UNIX distinugishes three access levels:
  * __read:__ permission to display the content of the file
  * __write:__ permission to modify the content of the file - add or remove some content
  * __execute:__ permission to run a file - that would be for scripts or for compiled programs

### Unix administrator: root
* has every right
* NEver work as root!&#8594; only for administrative tasks

## UNIX shell: first steps

### The shell

Four types of shell commands:
 * Integrated into the shell (for, while, ulimit, …)
 * Binary executable programs (located somewhere on the filesystem)
 * Executable scripts (will be executed using another program, like PERL, PYTHON, etc.)
 * Aliases (allow to create “shortcuts” to often used commands)
  
 Access a remote server:
 * Open terminal
 * Connect to remote server using __ssh__
   
 &#8594; ssh -l username remoteservername.somewhere.ch
 
 * often, the password is changed after first login (__passwd__ command)
 
### User environment and miscellaneous commands
 
 Command | Description
 ---|---
 __pwd__ | Print full pathname of the working directory
 __uname__ -s -p | prints system infomration <ul><li>-p displays processor type</li></ul>
 __man__ [command name] | on-line manual pages <ul><li>next page can be displayed by pressing [space bar], until end of file is reached</li><li>press q to quit manual pages</li></ul>
 __clear__ | clean termial display
 __cal__ or __date__ | standard programs that display current montha nd the date in the terminal <ul><li>with cal we can display a given month of a given year, etc.</li></ul>
 __history__  | display history of all executed commands
 __!__ [number] | repeat a command a certain number of times
 __id__ | | prints uderid, username, primary groupid, primary group name & secondary group group(s) id number and name 
 __whoami__ | prints username
 __who__ | shows all users currently logged on
 
 
 ### Processes commands
 * A process is an executing - or running - program identified by a __unique process identifier (PID)__
 It can:
  * run in the foreground
  * run in the background
  * be suspended - status 'Stopped'
  * killed - status 'Terminated'
 
 * A __Thread__ is a 'light weight' process - or "unit of execution" - that is contained in a process. It uses the same environment as the process it belongs to - PID, memory, data, etc. Each process has one or more threads but each thread belongs to one process only!
 
 * By default: proccess always runs in the foreground
 
 * To run it in the background: adding '__&__'
 
 * __[CTRL+c]__ terminates process &#8594; in the __foreground__
 
 * __kill %__ [job id/PID]  &#8594; in the __background__

 
 Command | Description
 ---|---
 __ps__ | lists processes ncluding their respective PID
 __jobs__ |  lists background and suspended processes including their job id, their PID, their status - Running/Stopped - and the command line info.
 __fg %__ [job number] | move runnign process in the foreground or to reactivate a suspended process
 
 
## UNIX shell: filesystem commands
when the terminal is opned, the home directory is the working directory by default, represented by __~__. If a username is appended by it, it indicates the home directry of the logged in user

Command | Description
---|---
__cd__ | change directory, followed by the directory we want to change to
__ls__ | display the content of a directory. options: <ul><li>__-l__ = uses a long listing format, including the access rights</li><li>__-h__ or __--human-readable__ =prints file and directory sizes in human readable format</li><li> __-t__ = sorts by modification time - the default sorting is the filename</li><li> __-r__ = reverses the order while sorting</li><li> __-a__ or __--all__ = display all files, including those which names start with a '.' (hidden sub directories &#8594; current & parent directory as well as others  )</li></ul>
__mkdir__ | create new directory, followed by the name of the directory
__mv__ | <ul><li>move files or directories, followed by name of file or directory and the location where to move them to</li><li> Can also be used to rename a file or directory, in addition to location a new name is provided (added at end of the location)
 __cp__ | copy a file/directory, followed by file/directory name, location of where to it should be copied and its new name
__rm__ | delete a file, followed by filename <ul><li>__-f__, or __--force__, ignores nonexistent files, never prompts for user confirmation</li><li>__-r__, or __-R__, or __--recursive__, removes directories and their contents recursively. Use this option with care as there is no way back!</li></ul>
__rmdir__ | delete a directory, followed by directory name <ul><li>directory has to be empty</li></ul>
__tar__ | create, update or expand archives. by default groups several files and directories in one archive file <ul><li>__-z__, or __--gzip__: compresses using gzip</li><li>__-c__, or __--create__: creates an archive</li><li>__-x__, or __--extract__: extracts from an archive</li><li>__-t__, or __--list__: display archive content</li><li>__-v__, or __--verbose__: displays information on the terminal window</li><li>__-f__, or __--file__, uses specified file</li><li>__zxvf__: combination often used for extraction</li></ul>



Wildcard | Description
---|---
__*__ | matches any number of characters in a file or directory name
__?__ | matches exactly one character - use __'??'__ to match any group of 2 characters
__[]__ | specify a range of characters allowed at that position
__[!]__ |  exclude a range of characters at that position 
__{}__ | curly brackets, specify a list of terms - separated by commas (or spaces?)
 
Each file and directory has associated access rights (visible when using ls -l):
* column on the left side
* first character either __-__ (ordinary file type), __d__ (directory), __l__ (link)
* 9 remaining characters  indicate access rights (three groups of three)
  *  left group indicates the permissions for the user who owns the file 
  * next group of three indicates the permissions for the primary group of the user who owns the file
  * last group of three indicates the permissions for all other users
* In every group of three:
  * __'r'__ at the first position indicates that 'read' permission is granted
  * __'w'__ at the second position indicates that 'write' permission is granted
  * __'x'__ at the third position indicates that 'execution' permission is granted
  * __'-'__ indicates the absence of permission
* can be modified using __'chmod'__ <ownership> '+/-' <access>
  * <ownership> indicates which owner affected. Can use any combination of the following characters u , g , o or a for All
  * '+' or '-' used to give or remove the permission(s), '=' is used to set permissions
  * <access> indicates which access level is concerned. Can use any combination of the characters r , w or x


## UNIX shell: working with files

### Find files
* __find__ command: effective in finding files using CLI, can be refined:
 * __-name__ : search based on the file name. Use -__iname__ for a case insensitive search
 * __-type__: search based on the file type (f, for regular files; d, for directories; l, for symbolic links)
 * __-size__ n : earch based on the file size. n indicates the units of space, which can be expressed (c, for bytes; k, for Kilobytes; M, for Megabytes and G, for Gigabytes)

### File type determination

Extension | Usage
---| ---
__.txt__ | text files with no particular format
__.csv__ | text files with Comma-Separated Values
__.tab__ | text files with Tab-Separated Values
__.fasta__ | text files containing sequences in FASTA format

&#8594; many more

To determine file type:
* __file_: usually tells if the specified file is of type
 * text - file contains only printing characters and few common control characters, probably safe to read on ASCII terminal
 * executable - file contains result of compiling a program in a form understandable to some UNIX kernel or another
 * data - neither 'text' nor 'executable', usually 'binary' or 'non-printable'

### File statistics (wc)
* __wc__: gives information about file content
 * -l : print number of lines
 * -w : print number of words
 * -c : print number of bytes
 * -m : print number of characters 
 * -L : print length of the longest line
* -l, -w, -c displayed by default


### Display file content

Command | Description
--- | ---
__head__ -n| prints the indicated number of lines - default is 10 - from the beginning of a file
__tail__ -n | prints the indicated number of lines - default is 10 - but from the end of a file
__cat__ | display file content on the terminal window
__less__ | display the content of a text file one screen at a time &#8594; text viewer <ul><li>[space-bar]: prints the next page, one screen at a time</li><li>up/down arrow keys: moves the content backward/forward one line at a time</li><li>'/+search_pattern': searches forward for the 'search_pattern'</li><li>'?+search_pattern' : searches backward for the 'search_pattern'</li><li>n: repeats the previous search forward</li><li>N: repeats the previous search backward</li><li>q: quits 'less' - as do 'Q', ':q', ':Q' and 'ZZ'</li></ul>

### Standard Streams
* __stdout__ : stream where programs write their ouput data to
 * by default printed on terminal window
* __stdin__ : stream programs receive data from
 * input expected from the keyboard (unless redirected)
* __stderr__ : stream used by programs to output error messages
 * by default printed on terminal window
 
### Redirecting input
* __sort__: sorts lines of text file(s) alphanumerically
 * -u or --unique': discards duplicates
 * -n or --numeric-sort: compares according to string numerical value
 * -r or --reverse: reverses the output
* if data comes from file rather  than keyboard: followed by __<__ [filename]
 * can only handle input from one file (many programs can handle this however)
 
 ### Redirecting output
 * __>__ [filename]: redirect output into file, if file exists it is overwritten
 * __>>__ [filename]: redirect output into file, if file exists it is appended at the end
* __|__ : pass output directly from one program to the input of another

### File formats, newlines
* newline character is not the same between all the OSes:
 * \n : Unix & all Unix flavors
 * \r : Mac OS
 * \r\n : Windows OS
* __dos2unix__: convert text files into a regular UNIX format
* __tr__: translates or deletes characters, first argument ('') replaced by second

### delimiter-separated values
* also dsv
* organizes the information in two-dimentional arrays: an "entry" - a line - consists of data separated by a delimiter
* csv format is a variant of the generic dsv format

### FASTA
* text-based format for representing either nucleotide sequences or peptide sequences
* nucleotides or amino acids are represented using single-letter codes
* allows for sequence names and comments to precede the sequences
* A sequence begins with a single-line description starting with '>', followed by lines of sequence data

### Swiss-Prot flatline
* made up of individual protein entries
* Every entry consists of lines starting with a two-character line code (indicate type of data contained in the line) followed by white spaces and description
* first line of a Swiss-Prot entry starts with 'ID '
* last line contains only '//'
* Only protein sequence lines do not follow the two-character line code

### Filters: diff
* compares two files and outputs differences
* e.g. for comapring two files with same name or different versions of files
* Options:
 * -b: ignores changes in amount of white space
 * -B: ignore changes that just insert or delete blank lines
 * -s: reports when two files are the same
 * -q: reports only whether two files differ, no details of the differences
 
### Search file contnet: grep
* Global Regular Expression Parser 
* searches file(s) for words or patterns and displays the result lines
* options:
 * -c or --count: displays number of resulting lines instead lines themselves
 * -i or --ignore-case: performs case insensitive search of the pattern
 * -v or --invert-match: displays lines that _do not_ match the pattern
 * -n or --line-number: adds line number in front of result lines
 * -r, -R or --recursive: search all files recursively under each directory
* Structured file content makes it easy to search into (e.g. '^>' in FASTA
 * '^' means allt he lines that start with
 * '.' means any character
 * '$' means all the lines that end with
 
 ### Filters: cut
 * extract selected parts of lines from each line of input
 * options:
  * -c or --characters: selection is done based on characters
  * -f or --fields: selection is done based on fields. Usually a number or a range is provided
  * -d or --delimiter: fields are splitted according to specified delimiter (default delimiter: 'tab')
 
### Filters: uniq
* reports lines
* reports one line if several identical and adjacent lines are found
* typically used after __sort__
* options:
 * d or --repeated: outputs only the duplicate lines
 * -c or --count: precedes each reported line with the number of occurrences
 * -i or --ignore-case: ignores the differences in case when comparing the lines
