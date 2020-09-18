# 1 Some basic markdown examples
## 1.1 Text and paragraphs

A sample *paragraph* of text, with some **emphasis** added.
This is still part of the first paragraph.

This however, isn't. 
For paragraph breaks, leave an empty line.  
For linebreaks, end a line with 2 or more spaces.

> Quote text
>> Nested quote

## 1.2 Lists and tables

Inserting lists:
* abc
* def
  * 123
  * 456
* ghi

Numbered lists:
1. abc
2. def
3. ghi

Tables using inline-HTML:

<table>
  <caption>
    Caption text above the table.
  </caption>
  
  <tr>
    <th> Var 1 </th>
    <th> Var 2 </th>
  </tr>
  <tr>
    <td> Val 1,1 </td>
    <td> Val 2,1 </td>
  </tr>
  <tr>
    <td> Val 1,2 </td>
    <td> Val 2,2 </td>
  </tr>
</table>

## 1.3 Images

![toucan](toucan.jpg)


## 1.4 Links

https://github.com  
[GitHub](https://github.com)

## 1.5 Code

```bash
Chunks of code (or other text)
can be displayed like this,
using triple back-quotes.

Syntax-highlighting is also supported:
cd ~
rm -rf *
echo 'Job's done.'
```

```R
x <- seq(-2*pi, 2*pi, length.out = 100)
y <- sin(x)
plot(x, y, type = "l")
```

Similar thing inside `regular` text using only a single back-quote.

## 1.6 Expandable sections

<details>
 <summary>This is a tag called summary</summary>
 
 This is some information that I want to show up upon clicking the summary tag.
 Other elements such as
 
 > quotes
 
 and 
 
 ```
 blocks
 of code
 ```
 
 can be used here.
</details>
