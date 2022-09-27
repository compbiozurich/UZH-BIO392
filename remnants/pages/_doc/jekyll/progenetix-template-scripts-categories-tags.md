---
title:  "Website: Setting up Tags and Categories"
permalink: "/howto/scipts-categories-tags/"
layout: default
date:   2019-07-08
author: "@mbaudis"
excerpt_link: "https://progenetix.github.io/progenetix-site-template/howto/scipts-categories-tags/"
excerpt_separator: <!--more-->
category:
  - howto
tags:
  - Jekyll
  - documentation
  - website
  - FAQ
  - scripts
---

<!--
This page is updated at the "excerpt_link" location linked in the header. If you want to keep/update a local version, you have to remove the link; then, your local page will be opened when clicking the menu link or the excerpt.
-->

## {{page.title}}

The `tags` and `categories` provided in the [pages' YAML headers](../yamlheader/) allow accessing the pages through the  listing pages (for the respective tag, category). Templates for those listing pages are provided in the source code `/_templates` directory.

<!--more-->

* `_categories.md` and `_categories-date-sorted.md`
* `_tags` and `_tags-date-sorted.md`

Those templates can be copied in the source `/tags` or `/categories` directories, and be renamed to reflect the tag or category they should serve (e.g. "news.md").

#### "bootstrap_site.pl" helper script

The script is just a helper for

* setting up the site
* updating the site after `_config.yml` or template changes

It loads the `_config.yml` file to determine which tags, categories are needed and creates the appropriate listing pages from the templates (see above and the [header page](../yamlheader/)). The script also creates the `collections` directories if missing (e.g. `/pages/_doc/` from the `collections.doc` entry in `_config.yml`.

As listed above, two types of templates exist - one with alphabetic sorting (standard), and one for time sorted tags and categories. Alphabetical sorting is standard; the time sorted can be selected in the configuration file:

```
# The categories-date-sorted parameter determines the selection of a
# time sorted, year labeled listing template for those categories.
categories-date-sorted:
  - news
  - minutes
# As above, for tags:
tags-date-sorted:
  - press
```
