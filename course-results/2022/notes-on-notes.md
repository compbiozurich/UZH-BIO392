# Notes About Notes

## Markdown & Technical

<a href="https://xkcd.com/1179/" target="_blank"><img src="https://imgs.xkcd.com/comics/iso_8601.png"  align="right" style="margin 20px 0px 30px 20px; width: 200px; clear:none;" /></a>
* use logical nesting - there should only be one `<h1>` (_i.e._ `# Title`) element
* use newlines between headers and text, and around lists etc.
* you can force line separation by adding 4xspace at the line's end - no `<br/>` necessary...
* use lists - also nested ones => no extra line breaks necessary...
    - 4 spaces per level ...
* code blocks are nice & easy, with a triple backtick <code>```</code> before and after
    - [edited example page](./Janne-Berger/day_05/storage.md)
* always use ISO8601 `YYYY-MM-DD` format for ... anything (e.g. fila name starts)
    - don't use 11.09.01 => 9/11? 1901-09-11? 2001-11-09?
    - sorts logically as text!
    - see [schemablocks.org](https://schemablocks.org/standards-recommendations/#dates-times)

## Cytogenetics, FISH, CGH ...

* while M-FISH & SKY offer visualization of many & complex changes they still
require living cells for metaphase preparations

## Sequencing  & Array Technologies

* SNP arrays provide additional allele specific information => LOH ...
* SNP arrays are frequently not "pure" SNP arrays but may contain additional
probes to improve e.g. CNV detection or that of recurring somatic SNVs etc.

## Quotes & Comments

> When the techniques are compared to each other, cCGH has an improved resolution over traditional G-banding and FISH

This is not strictly true; cCGH doesn't have a higher resolution than karyotytping (same limits as metaphase preps) w/ the exception of high-level amplifications; FISH is very exact since you use sequence-specific probes.

## Progenetix

* images can be embedded through the API ...
```
![plot for PMID 20459617](http://progenetix.org/cgi/PGX/cgi/collationPlots.cgi?id=PMID:20459617)
```

![](http://progenetix.org/cgi/PGX/cgi/collationPlots.cgi?datasetIds=progenetix&id=PMID:20459617)