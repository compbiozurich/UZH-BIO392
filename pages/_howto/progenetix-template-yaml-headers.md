---
title:  "Website: Header, Categories, Tags ..."
permalink: "/howto/yamlheader/"
layout: default
date:   2019-03-14
author: "@mbaudis"
excerpt_link: "https://progenetix.github.io/progenetix-site-template/howto/yamlheader/"
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

The YAML headers are necessary to process the Markdown (or HTML) files in the page collections. The _Progenetix Jekyll template_ uses standard Jekyll headers, but also adds some additional  parameters.

<!--more-->

<!--
This page is updated at the "excerpt_link" location linked in the header.
-->

A minimal header contains at least the layout information:

```
layout: default
```

However, most pages make use of multiple parameters. Example:

```
---
title: "Federated discovery and sharing of genomic data using Beacons"
date: 2019-01-23
layout: default
author: "@mbaudis"
excerpt_separator: <!--more-->
excerpt_link:
pdf_file_name: '2019-03-04___Fiume-et-al.__Federated-discovery-and-sharing-of-genomic-data-using-Beacons__NatBiotech.pdf'
pdf_file_type: article
www_link: 
www_links_formatted:
  - '<a href="https://www.ncbi.nlm.nih.gov/pubmed/30833764" target="_BLANK">[PubMed]</a>'
  - '<a href="https://www.nature.com/articles/s41587-019-0046-x" target="_BLANK">[Nature Biotechnology]</a>'
  - '<a href="https://www.ga4gh.org/news/extensions-to-the-ga4gh-beacon-api-will-enable-a-more-powerful-community-resource/" target="_BLANK">[GA4GH Press Release]</a>'
categories: 
  - news
  - publications
tags: 
  - article
  - FAQ
  - documentation
---
```

### Standard Parameters

* `title`
    - the title of the page
    - can be re-used trough a Liquid tag, e.g. `## {{page.title}}` will add the title to the HTML rendering wrapped in `<h2>` markup
* `date`
    - the date assigned to the page, as ISO8601
    - if set in the future, the `_config.yml` must contain the `future: true` directive - or the page will only be processed after the date...
* `layout`
* `author`
    - page author (can also be a YAML array)
    - if a __quoted__ "@Github" shortname is used, this will link to the author's Github page
* `excerpt_separator: <!--more-->`
    - When placed somewhere on a page, the `excerpt_separator` (as a standard here the ` <!--more-->` HTML comment) will limit the amount of content displayed in the excerpt on the listing page.
    - If no separator is provided, only the first headline is shown on the listing excerpt.
* `excerpt_link`
    - an optional link to different page when clicking the excerpt; i.e. not the page itself but the link target will be shown
    - this can be used - as in this page here - to link the excerpt of the page to a different page, as this one which is maintained in the `progenetix.github.io/progenetix-site-template/` repository
* `www_link`
    - a simple web address related to the post, e.g. https://www.ga4gh.org
    - will be added at the bottom of the page
* `www_links_formatted`
    - one or multiple complete links which will be added at the bottom of the page
    - '<a href="https://www.biorxiv.org" target="_blank">[biorXiv]</a>'
* `pdf_file_name`
    - the name of a PDF (without path!) somewhere in "assets", which will be auto-linked at the bottom of the page (like the _www_ links above)
* `categories`
    - usually *one* (or two) category the page belongs to
    - should be one of the categories in `_config.yml` (otherwise not much use ...); there, _categories_ are only implicitely defined - as keys in the `nav_cat_blocks` of the type "categories" (i.e. below keys of the root attribute "general"):  

```
nav_cat_blocks:     # comma-separated "label,type,label_visibility"
  general: 'General,categories,hide'
  related_sites: 'Related Sites,related_sites,show'
  github_projects: 'Github Projects,github_projects,show'
general:
  news: News
  people: Participants
  howto: 'Examples, Guides & FAQ'
  minutes: 'Meeting minutes'
  contact: Contacts
```
* `tags`
    - usually *several* tags associated with the content of the page
    - should be from the tags in `_config.yml` (otherwise not much use ...):   

```
# Only tags listed here are represented in the tag cloud.
cloud_tags:
  - code
  - admins
  - contacts
  - contributors
  - developers
````
