---
layout: default
---

{%- assign this_name = page.name | split: "." -%}
{%- assign this_category = this_name[0] | replace: '-alpha-sorted', '' -%}
{%- assign this_pagetitle = this_category  | capitalize | replace: '_', ' ' -%}

<div id="listpage_headline_wrapper">
	<div id="listpage_sortmarker">
		<a href="{{this_category}}-date-sorted.html">[date &darr;]</a>
	</div>
	<div id="listpage_headline">
		<h2 class="page_title">{{ this_pagetitle }}</h2>
	</div>
</div>

{%- comment -%}
  * collecting the pages
{%- endcomment -%}

{%- assign cat_posts = site.emptyArray -%}
{%- for post in site.documents -%}
  {%- if post.categories contains this_category -%}
    {%- assign cat_posts = cat_posts | push: post -%}
  {%- endif -%}
{%- endfor -%}

{%- assign cat_posts = cat_posts | sort: 'title' -%}

{%- comment -%}
  * special posts for prepending content to the listing pages
  * they are processed first, so separate loops are needed  
{%- endcomment -%}

{%- for post in cat_posts -%}
  {%- if post.tags contains '.prepend' -%}
<div style="margin-bottom: 20px;">
{{ post.content | markdownify }}
</div>
  {%- endif -%}
{%- endfor -%}

{%- comment -%}
  * featured posts on top, so new loop
{%- endcomment -%}

{%- for post in cat_posts -%}

  {%- if post.tags contains '.featured' -%}
    {%- assign excerpt_link = post.url | relative_url -%}
    {%- if post.excerpt_link contains '/' -%}
      {%- assign excerpt_link = post.excerpt_link -%}
    {%- endif -%}
<div class="excerpt">
<a href="{{ excerpt_link }}">
{{ post.excerpt }}
</a>
  <p class="footnote">
    {%- if post.author -%}{{ post.author | join: " | " }}&nbsp;{%- endif -%}
    {% if post.date %}{{ post.date | date: "%Y-%m-%d" }}: {% endif %}
    <a href="{{ excerpt_link }}">more ...</a>
  </p>
</div>
  {%- endif -%}
{%- endfor -%}

{%- comment -%}
  * remaining normal posts, again new loop
{%- endcomment -%}

{%- for post in cat_posts -%}
  {% unless post.tags contains '.featured' or post.tags contains '.prepend' or post.tags contains '.append' %} 
    {%- assign excerpt_link = post.url | relative_url -%}
    {%- if post.excerpt_link contains '/' -%}
      {%- assign excerpt_link = post.excerpt_link -%}
    {%- endif -%}
<div class="excerpt">
<a href="{{ excerpt_link }}">
{{ post.excerpt }}
</a>
  <p class="footnote">
    {%- if post.author -%}{{ post.author | join: " | " }}&nbsp;{%- endif -%}
    {% if post.date %}{{ post.date | date: "%Y-%m-%d" }}: {% endif %}
    <a href="{{ excerpt_link }}">more ...</a>
  </p>
</div>
  {% endunless %}
{%- endfor -%}

{%- comment -%}
  * special posts for appending content to the listing pages
  * they are processed last, so again a separate loop is needed  
{%- endcomment -%}

{%- for post in cat_posts -%}
  {%- if post.tags contains '.append' -%}
<div style="margin-top: 20px;">
{{ post.content | markdownify }}
</div>
  {%- endif -%}
{%- endfor -%}

