# There is an (admittedly better) cheatsheet [here](https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf). :octocat:


To understand this cheatsheet, look at the RAW as well.


# Headers  
## smaller headers  
### even smaller  

To introduce a break in text, end the line with two spaces, then click return. Otherwise you get
this instead of  
this.


> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,
 consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.
 Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.  
>
>>with nested quote
>
> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse
 id sem consectetuer libero luctus adipiscing.  


Listing can be done with asterisks, pluses or hyphens

* eg
+ like
- this

or with numbers

19. though
1. only the
22. first
5. number
1. matters
1. also: you can write over multiple lines
without indenting each and even do multiple paragraphs,

   though the first line of each paragraph
must have 4 spaces or 3 tabs in the beginning
1. still the same list
    >blockquotes
    >must be indented on each line

to avoid accidental listing, when writing numbers like  
1\.  put a backslash in there.

code blocks are always displayed as written. That means markdown will not do formatting of its own stuff in there,
while translating & and < so that html will display instead of interpret them. Here's an example (just indent it all by 4 spaces):

    <div class="footer">
        &copy; 2004 Foo Corporation
    </div>
   
Code in the middle of a paragraph can be entered with `` `. double them up if you want to include some literal backticks in the code`` like I just did.
    
    
span rules are made with three or more asterisks or hyphens on a line with nothing else, like this:
***
or this:
- - - - -

Links can be defined straight in that line (inline)  
This is [an example](http://example.com/ "Title") inline link.  
[This link](http://example.net/) has no title attribute.  
Or you can supposedly use reference links like [this][EXAMPLE] and put the link itself anywhere in the document. here i will do it right after.

[example]: http://example.net/ "optional title here"

Don't forget that the reference can't be in a paragraph though. And note the reference is not case sensitive.
The reference bracket can also be left empty, in which case the displayed text doubles as the reference name like in this [example][]


Emphasis can be done with * or _ like in this god*friggin*damn example or even like **this**. To avoid doing this where it would normally be done, just \*backslash\*.


Markdown can also include images. They work very similar to links, so ![inline](/path/to.img "optional title") or ![reference][id] both work.

[id]: /path/to.img "optional title"

The only reason those words are actually visible is, of course, that the images don't exist.


Tables | are made
-------|---------
by | separating
the first | row
with hyphens | and column entries
with | \|
