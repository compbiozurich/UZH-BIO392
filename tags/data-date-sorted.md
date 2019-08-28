---
layout: default
---

{%- assign this_name = page.name | split: "." -%}
{%- assign this_tag = this_name[0] | replace: '-date-sorted', '' -%}
{%- assign this_pagetitle = this_tag  | capitalize | replace: '_', ' ' -%}

<div id="listpage_headline_wrapper">
	<div id="listpage_sortmarker">
		<a href="{{this_tag}}-alpha-sorted.html">[A &rarr; Z]</a>
	</div>
	<div id="listpage_headline">
		<h2 class="page_title">Pages tagged "{{ this_pagetitle  }}"</h2>
	</div>
</div>

{%- assign today = site.time | date: '%Y%m%d' -%}
{%- assign page_tag = this_tag | downcase -%}
{%- assign posts_all = site.documents | sort: 'date' | reverse -%}

{%- for post in posts_all -%}
  {%- if post.tags -%}
    {%- assign post_tags = post.tags | sort -%}
    {%- assign post_author = post.author | downcase -%}
    {%- assign excerpt_link = post.url | relative_url -%}
    {%- if post.excerpt_link contains '/' -%}
      {%- assign excerpt_link = post.excerpt_link -%}
    {%- endif -%}
    {%- for tag in post_tags -%}
      {%- assign tag_lower = tag | downcase -%}
      {%- if tag_lower == page_tag -%}
        {%- assign post_day = post.date | date: '%Y%m%d' -%}
        {%- assign post_year = post.date | date: '%Y' -%}
        {%- if post_day > today -%}
          {%- assign post_year = 'Upcoming' -%}
        {%- endif -%}
        {% if current_year != post_year %}
          {% assign current_year = post_year %}
<h2 id="y{{post.date | date: "%Y"}}" style="margin-top: 20px;">{{ current_year }}</h2>
        {% endif %}
<div class="excerpt">
        {% if post_day > today %}
  <h3 style="color: red">{{ post.date | date: "%Y-%m-%d" }}</h3>
        {% endif %}
<a href="{{ excerpt_link }}">{{ post.excerpt }}</a>
  <p class="footnote">
      {%- if post.author -%}{{ post.author | join: " | " }}&nbsp;{%- endif -%}
      {% if post.date %}{{ post.date | date: "%Y-%m-%d" }}: {% endif %}
      <a href="{{ excerpt_link }}">more ...</a>
  </p>
</div>
        {%- break -%}
      {%- endif -%}
    {%- endfor -%}
  {% endif %}
{%- endfor -%}
