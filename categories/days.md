---
layout: default
---

{%- assign this_name = page.name | split: "." -%}
{%- assign this_category = this_name[0] | replace: '-date-sorted', '' -%}
{%- assign this_pagetitle = this_category  | capitalize | replace: '_', ' ' -%}

<div id="listpage_headline_wrapper">
	<div id="listpage_sortmarker">
 		<a href="{{this_category}}-date-sorted-reverse.html">[date&nbsp;&uarr;]</a>
		<a href="{{this_category}}-alpha-sorted.html">[A&nbsp;&rarr;&nbsp;Z]</a>
		<a href="{{this_category}}-alpha-sorted-reverse.html">[Z&nbsp;&rarr;&nbsp;A]</a>
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

{%- assign cat_posts = cat_posts | sort: 'date' | reverse -%}

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
  * no separate treatment of featured posts
{%- endcomment -%}

{%- assign today = site.time | date: '%Y%m%d' -%}
{%- assign page_tag = this_category | downcase -%}

{%- for post in cat_posts -%}
  {% unless post.tags contains '.prepend' or post.tags contains '.append' %} 
    {%- assign post_author = post.author | downcase -%}
    {%- assign excerpt_link = post.url | relative_url -%}
    {%- if post.excerpt_link contains '/' -%}
      {%- assign excerpt_link = post.excerpt_link -%}
    {%- endif -%}
    {%- assign post_day = post.date | date: '%Y%m%d' -%}
    {%- assign post_year = post.date | date: '%Y' -%}
    {%- if post_day > today -%}
      {%- assign post_year = 'Upcoming' -%}
    {%- endif %}
    {%- if current_year != post_year -%}
      {% assign current_year = post_year %}
<h2 id="y{{post.date | date: "%Y"}}" style="margin-top: 20px;">{{ current_year }}</h2>
    {% endif %}
<div class="excerpt">
    {%- if post_day > today -%}
  <h3 style="color: red">{{ post.date | date: "%Y-%m-%d" }}</h3>
    {%- endif -%}
<a href="{{ excerpt_link }}">{{ post.excerpt }}</a>
  <p class="footnote">
    {%- if post.author -%}{{ post.author | join: " | " }}&nbsp;{%- endif -%}
    {%- if post.date -%}{{ post.date | date: "%Y-%m-%d" }}: {% endif %}
 <a href="{{ excerpt_link }}">more ...</a>
  </p>
</div>
  {% endunless %}  
{%- endfor -%}

{%- for post in cat_posts -%}
  {%- if post.tags contains '.append' -%}
<div style="margin-top: 20px;">
{{ post.content | markdownify }}
</div>
  {%- endif -%}
{%- endfor -%}
