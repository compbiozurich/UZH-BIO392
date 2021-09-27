# Markdown language demonstration
See [Markdown syntax](https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf) for a short introduction. Open the file in a text editor to see the syntax.

## Emphasis (Typeface)

*This text will be italic*.
_This will also be italic_.
**This text will be bold**.
__This will also be bold__.
*You **can** combine them*.

## Lists

### Unordered

* Item 1
* Item 2
  * Item 2a
  * Item 2b

### Ordered

1. Item 1
2. Item 2
3. Item 3
   * Item 3a
   * Item 3b

## Backslash escapes

Not all characters may work with backslash escapes
\*literal asterisks\*

## Issue references

(?) I don't get this functionality.  
Any number that refers to an Issue or Pull Request will be automatically converted into a link.

#1
github-flavored-markdown#1
defunkt/github-flavored-markdown#1

## Tables

First Header | Second Header
------------ | -------------
Content cell 1 | Content cell 2
Content column 1 | Content column 2

## Task lists

- [x] this is a complete item
- [ ] this is an incomplete item
- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported
- [x] list syntax required (any unordered or ordered list supported)
