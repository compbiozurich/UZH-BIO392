# AWK
https://www.grymoire.com/Unix/Awk.html#uh-0

Extremely versatile programming language for working on files and is thus a cornerstone of UNIX shell programming.
Its advantages include:
* Excellent filter and report writer
* Excellent tool for processing rows and columns
* Its string manipulation functions allowes fir searching for particular strings and modify the output.
* Incredible useful associative arrays (lacking in most computing languages)
  *Can make complex problems trivial
  
## Basic Structure
  
* Line oriented
* The essential organization of an AWK program followes the form:
> __*pattern {action}*__
  
  &#8594; the pattern specifies when the action is performed, meaning that it specifies a test that is perfomred with each line read as input.
* The defualt pattern is something that matches every line (blank or null pattern), e.g. if we want to print every line:
>__*{print }*__
* The "BEGIN" and "END" patterns specify actions to be taken before any lines are read. E.g. we can put a line before and after the input file:
>__*BEGIN { print "START" }__*

>__*{ print         }*__

>__*END   { print "STOP"  }*__

* Improved script from above, making a typical AWK program (FileOwner is the script name):

>__*BEGIN { print "File\tOwner"}*__

>__*{ print $8, "\t", $3}*__

>__*END   { print " - DONE -" }*__

  * __/t__ : indicates tab character, output lines up on even boundaries
  * __$8__ & __$3__ : the 8th and 3rd __field__ of the input line 
    * A field can be looked at as a column, the action therfore operates on each line or row read in
    * In scripting languages, the $ means the word following it is of the variable. In AWK it refers to a field in the current line:
    >__*BEGIN { x=5 }*__  &#8594; assign 5 to x
    > __*{ print x, $x}*__ &#8594; first field printed is the number 5, the second is the fifth field
  * AWK understands speial characters follow the "\" character.
  * AWK does not evaluate variables within strings, thereforem the following program would print "$8 $3":
  > __*{print "$8\t$3" }*__
    
    * Inside the quotes, the dollar sign is not a special character
  
  ## Executing an AWK script
 * We assume our  script is called "FileOwner"
 * Invocation:
 > ls -l | FileOwner
 
 
 
