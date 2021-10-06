---
title:  "Website - Non-Github Hosting"
permalink: /howto/jekyllinstallation/
layout: default
date:   2019-03-14
author: "@mbaudis"
excerpt_link: https://progenetix.github.io/progenetix-site-template/howto/jekyllinstallation/
excerpt_separator: <!--more-->
category:
  - howto
tags:
  - Jekyll
  - documentation
  - website
  - FAQ
---

## Local Jekyll based website generation

In an ideal scenario, your Github served website could be build locally, with the same output structure and layout.

<!--more-->

<!--
This page is updated at the "excerpt_link" location linked in the header.
-->

However, you need to install a local version of the theme first & get this to be compiled by [Jekyll](https://jekyllrb.com). The [Github page](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/#keeping-your-site-up-to-date-with-the-github-pages-gem) has some more information (but see OS X comment below).

The `sudo` in the following commands may not be tequired, depending on your setup.

```bash
sudo gem install jekyll bundler rouge
sudo gem install github-pages
```

Change to your site's source directory, and then:

```bash
bundle install
```
... to install the specific components.

From this site directory, you issue:

```bash
jekyll build
```
... to generate the html file structure, or 
```bash
jekyll serve --incremental
```
... to run a server. Which should then answer with (more stuff) and

```bash
Server address: http://127.0.0.1:4000
```

#### Notes

* If you have a non-empty `baseurl` parameter in your `_config.yml` (e.g. the name og the repository you are running the site from), you will have to specify an empty `baseurl` when starting your localhost test server:
```bash
jekyll serve --baseurl "" --incremental
```
* On OS X with homebrew there is (was? OS X 10.13) a configuration problem when building the "nokogiri" component. A workaround is to de-install "xz", and run the install again (thanks to the comments by _halostatue_ on [Github nokogiri](https://github.com/sparklemotion/nokogiri/issues/1483)!).
```bash
brew uninstall --ignore-dependencies --force xz
sudo gem install github-pages
brew install xz
```

Please see the [Jekyll](https://jekyllrb.com) documentation for more options (e.g. how to generate your site into a specific target directory).
