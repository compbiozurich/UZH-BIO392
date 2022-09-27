---
title:  "Website: Directories and Files"
permalink: /howto/templatefiles/
layout: default
date:   2019-03-14
author: "@mbaudis"
excerpt_link: https://progenetix.github.io/progenetix-site-template/howto/templatefiles/
excerpt_separator: <!--more-->
category:
  - howto
tags:
  - Jekyll
  - documentation
  - website
  - FAQ
  - Markdown
---

## {{page.title}}

The _Progenetix Jekyll template_ modifies the standard Jekyll file structure.

<!--more-->

<!--
This page is updated at the "excerpt_link" location linked in the header.
-->

Generally, "_underscore" directories contain specific support files are not evaluated for website content. The exception here are collection directories; however, in standard configuration this would only be the `_posts` directory. This behavior has been modified (see also inline documentation in the `_config.yml` file).

* `_data`
    - special directory for e.g. JSON data files, if needed (see [Jekyll](https://jekyllrb.com) documentation)
* `_includes`
    - special directory for page elements etc., if needed (see [Jekyll](https://jekyllrb.com) documentation)
* `_layouts`
    - directory for one or more layout pages which are used as templates when processing the Markdown or HTML files
    - the corresponding layout is selected in the page's YAML header
    - layout contain a mix of HTML and _Liquid_ instructions
    - the Progenetix template uses a single `default.html` template
* `_site`
    - a directory generated when locally serving the site; can be ignored (except for debugging)
    - should be added to  `.gitignore`
* `_templates`
    - templates for individual pages and for category etc. listing pages
    - the "_underscore.md" files are the listing page templates which are being used by the `bootstrap_site.pl` site creation script
* `_tools`
    - e.g. containing the `bootstrap_site.pl` site creation script, which should be run for site setup and after changes to the `_config.yml` configuration file
* `assets`
    - a static directory containing resource files (images, css, js ...)
    - this is directly copied to the root of the website; so files can be statically linked
    - the internal structure is flexible
* `categories`
    - created by the `bootstrap_site.pl` script
    - contains per category listing pages, based on the entries in `_config.yml`
    - please do not add/modify the content; this would be overridden
    - changes should be applied to the template files and/or `_config.yml`, with subsequent running of `bootstrap_site.pl`
* `tags`
    - as for `categories`
* `pages`
    - the root directory for adding "collections" of Markdown (or HTML) files to be processed for the website
    - directories inside have to be registered as "collections" in `_config.yml` (see there), but with a leading "_" for the directory
    - the `/pages/_posts/` directory is special, in that it requires date-prefixed page nemes (`2019-03-14-the-weather-today.md`)