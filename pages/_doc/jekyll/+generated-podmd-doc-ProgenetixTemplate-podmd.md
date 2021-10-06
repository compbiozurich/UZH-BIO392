---
title: "ProgenetixTemplate::podmd.pl Perl Code Documentation"
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


The "podmd.pl" script parses inline documentation from - now various - code files
and writes it to a given output directory, in the format of Jekyll-compatible
Markdown files, i.e. including a YAML header.

* location: `__Jekyll_site_directory__/_tools/`

Processing the input files is based on parameters provided in the "podmd.yaml"
configuration file. Please have a look for examples there.

For now, the functions of the script are optimised for use in the
[Progenetix](http://info.progenetix.org) documentation environment but may be
adapted for other purposes.

The script itself contains an inline predefined minimal processing configuration
which should be overridden from a `./podmd.yaml` file:

```
my $here_path   =   File::Basename::dirname( eval { ( caller() )[1] } );
my $conf_yaml		=		$here_path.'/podmd.yaml';
my $config			=		{
	output_dir		=>	 '../pages/_doc',
	output_pre		=>	 '+generated-podmd-doc',
	category			=>	 'howto',
	tags					=>	[ qw(code documentation) ],
	md_starts			=>	[ '^=podmd', '\/\*podmd', '^# podmd' ],
	md_stops			=>	[ '^=cut', 'end_podmd\*\/', '^# end_podmd' ],
	packages			=>	{
		ProgenetixTemplate	=>	{
			input				=>	'.',
			extensions	=>	[ '.pl' ],
			language		=>	'Perl',
		},
	},
};

if (-f $conf_yaml) {
	$config      	=   LoadFile($here_path.'/podmd.yaml') }
```
For the scanned files, comment lines are read in if they are between one of the
`md_starts` and `md_stops` markers, which can be defined as global parameters
or package specific.

Similarly, code is read in between the `md_code_starts` and `md_code_stops`
markers, but is wrapped in source quote tags.

If per-line commenting is uses between the markers (Python "# " line starts),
these comment tags a re removed. However, this will also remove Markdown H1
tags - so either use HTML for those or pre-pend them with a space.

No file is created if there isn't any content in the text buffer.

If documentation has been found, the YAML-prefixed markdown file is created in
the `output_dir` target directory.

The [YAML header](https://progenetix.github.io/progenetix-site-template/howto/yamlheader/)
contains directives and parameters for the processing of the page through the
[__Jekyll__](https://jekyllrb.com) website generation engine.

The following code shows how the header is generated through injecting some
file dependent parameters into a standard _Jekyll_ YAML header:

```
		my $mdFtxt	=		<<END;
---
title: "$scope::$cfName $package->{language} Code Documentation"
layout: default
www_link: $package->{web_project_link}
excerpt_separator: <!--more-->
date: $today
category:
  - $config->{category}
tags:
  - $package->{language}
  - $scope
$addTags
---

## {{ page.title }}

<!--more-->

END
```
