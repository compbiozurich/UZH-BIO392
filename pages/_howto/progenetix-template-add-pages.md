---
title:  "Website: Add and Edit Pages"
permalink: "/howto/add-pages/"
layout: default
date:   2019-03-25
author: "@mbaudis"
excerpt_link: "https://progenetix.github.io/progenetix-site-template/howto/add-pages/"
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

<!--
This page is updated at the "excerpt_link" location linked in the header. If you want to keep/update a local version, you have to remove the link; then, your local page will be opened when clicking the menu link or the excerpt.
-->

## {{page.title}}

New pages are added to the website inside one of the "collections" directories in the [`/{{site.collections_dir}}`]({{site.github.repository_url}}/blob/master/{{site.collections_dir}}) directory. This can either be done by adding files locally or on Github (if hosted there).

<!--more-->

A simple practice is to 

* navigate to an existing page of a related topic
* duplicate the file
* change the name
    - in case of pages in `/{{site.collections_dir}}/_posts/`, this has to include starting the file name with an ISO date and minus sign, e.g. `2019-03-25-good-news.md`
* edit the page's YAML header
    - date, again; will override date in file name - not strictly needed if correct date there, but good practice for all pages (influences sorting etc.)
    - more header information can be found [here](./progenetix-template-yaml-headers.html)
    
    
#### Editing Pages on Github

If the website is hosted on Github, normal pages (i.e. not the listing pages for `tags` and `categories`) can be edited using Github's online editor. A direct link is provided through an "edit" icon which should be visible in the lower right corner of the page. <img align="right" style="margin: 10px;" src="{{ 'assets/img/icons8-edit-file-26.png' | relative_url }}" /> Clicking this will open the page's source code in the Github editor; however, to change the code one still needs to click on the "edit" icon of the editor's menu bar.

Saving changes follows standard Github protocol: Either directly pushing the changes (if you have access rights and this would be proper in the context of your project); or by creating a pull request.
