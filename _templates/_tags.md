---
layout: default
---

{%- assign this_name = page.name | split: "." -%}
{%- assign this_tag = this_name[0] | downcase -%}
{%- assign this_pagetitle = this_tag  | capitalize | replace: '_', ' ' -%}

<h2 class="page_title">Pages tagged "{{ this_pagetitle  }}"</h2>

{%- assign today = site.time | date: '%Y%m%d' -%}
{%- assign page_tag = this_tag | downcase -%}
{%- assign posts_all = site.documents | sort: 'title' -%}

{%- for post in posts_all -%}
  {% if post.tags %}
    {%- assign post_tags = post.tags | sort -%}
    {%- assign post_author = post.author | downcase -%}
    {%- assign excerpt_link = post.url | relative_url -%}
    {%- if post.excerpt_link contains '/' -%}
      {%- assign excerpt_link = post.excerpt_link -%}
    {%- endif -%}
    {%- for tag in post_tags -%}
      {% assign tag_lower = tag | downcase %}
      {% if tag_lower == page_tag %}
<div class="excerpt">
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
