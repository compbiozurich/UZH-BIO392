---
title: "ProgenetixTemplate::bootstrap_site.pl Perl Code Documentation"
layout: default
www_link: 
excerpt_separator: <!--more-->
date: 2019-07-10
category:
  - howto
tags:
  - Perl
  - ProgenetixTemplate
  - code
  - documentation
---

## {{ page.title }}

<!--more-->


The bootstrap_site is a utility for creating the structure of __Progenetix 
Jekyll Website Template__ based websites. The current functions are:

* create list pages for all categories defined in `_config.yml`, separate for
standard (alphabetically sorted) and reverse date sorted categories
* as for categories, do the same for tags
* check/add collections directories

Additional options:

* with the argument `-update y`, users will be prompted if they want to download
the newest `style.css` and `layout.css` files from the "Progenetix :: Template"
repository - this will overwrite the existing files!

For `categories` and `tags` annotated in the `_config.yml` file, 3 listing pages
will be generated:

* (tag/category).md
    - the standard landing page, which will be either date or alphabetically
    sorted, depending on the label in the config (default alphabetic)
* (tag/category)-date-sorted.md, (tag/category)-alpha-sorted.md
    - separate date or alpha sorted landing pages, to switch to


