#!/usr/bin/perl

=podmd
The bootstrap_site is a utility for creating the structure of __Progenetix 
Jekyll Website Template__ based websites. The current functions are:

* create list pages for all categories defined in `_config.yml`, separate for
standard (alphabetically sorted) and reverse date sorted categories
* as for categories, do the same for tags
* check/add collections directories

Additional options:

* with the argument `-update y`, users will be prompted if they want to download
the newest `style.css` and `layout.css` files from the "Progenetix :: Template"
repository - this will overwrite the existing files!

=cut

use File::Basename;
use File::Copy;
use LWP::Simple;
use YAML::XS qw(LoadFile DumpFile);
use Data::Dumper;

binmode STDOUT, ":utf8";

my %args        =   @ARGV;

$args{-master}	||=	'progenetix/progenetix-site-template';
$args{-update}	||=	'n';

my @cat_blocks  =   qw(General Products);

my $here_path   =   File::Basename::dirname( eval { ( caller() )[1] } );
my $base_path   =   $here_path.'/..';
our $config     =   LoadFile($base_path.'/_config.yml') or die "¡No _config.yml file in this path!";

print $base_path."\n";

# updating the layout and css files from the master repo
# be sure to add css modifications to "site_style.css", since "style.css"
# gets overwritten
if ($base_path !~ /$args{-master}/) {

	my $base_url	=		'https://raw.githubusercontent.com/'.$args{-master}.'/master';
	my @master_f	=		('_layouts/default.html', 'assets/css/style.css');

	if ($args{-update} =~ /y/i)	 {

		foreach (@master_f) {

			my $url			=		$base_url.'/'.$_;
			my $file		=		$base_path.'/'.$_;
			if ($args{-prompt} =~ /y/i) {
				print <<END;

################################################################################

updating $_ from $args{-master}

$url => $file

Please hit ENTER to proceed, or type "n" to skip:
END
				my $resp = <STDIN>;
				if ($resp =~ /^n/i) {
					print "skipped $_\n\n";
					next;
				}
			}
			getstore($url, $file);
			print "updated $_\n\n";

}}}

=podmd
#### Listing pages for `categories` and `tags`

For `categories` and `tags` annotated in the `_config.yml` file, a default 
landing page (i.e. this_category.md, this_tag.md) is being generated and linked 
to.

=cut

my $scopes			=		{
	categories		=>	[],
	tags					=>	$config->{cloud_tags}
};

foreach $cat_block (keys %{ $config->{nav_cat_blocks} }) {
  if ($config->{nav_cat_blocks}->{$cat_block} =~ /\,categories\,/) {
    push(
     @{ $scopes->{categories} },
     keys %{ $config->{$cat_block} },
    );
  }
}

foreach my $scope (keys %$scopes) {

	my $type_path =   $base_path.'/'.$scope;
	mkdir $type_path;
	
	my $templates	=		$base_path.'/_templates/_';
	
	foreach my $item (@{ $scopes->{$scope} }) {

=podmd
##### List page sort order

The listing pages for categories and tags are provided in alphabetic and date 
sorted versions. Default (i.e. the page shown when clicking the category or tag 
page) is "alpha-sorted". The default can be changed in the `_config.yaml` file 
by listing the respective category or tag in the corresponding sorting 
attribute, e.g.

```
tags-date-sorted:
	- news
	- lectures
```

=cut

		copy(
			$templates.$scope.'-alpha-sorted'.'.md',
			$type_path.'/'.$item.'.md'
		);
			
		foreach my $sort ("-date-sorted", "-alpha-sorted", "-date-sorted-reverse", "-alpha-sorted-reverse") {
			copy(
				$templates.$scope.$sort.'.md',
				$type_path.'/'.$item.$sort.'.md'
			);

			if (grep{ $item =~ /^$_$/i } @{ $config->{$scope.$sort} } ) {
				copy(
					$templates.$scope.$sort.'.md',
					$type_path.'/'.$item.'.md'
				);
			}

}}}

=podmd

=cut

mkdir $base_path.'/'.$config->{collections_dir};
foreach my $coll (keys %{ $config->{collections} }) {
  mkdir $base_path.'/'.$config->{collections_dir}.'/_'.$coll;
  print $base_path.'/'.$config->{collections_dir}.'/_'.$coll."\n";
}

if (-f $here_path.'/podmd.pl') {
	my $doccmd		=		'perl '.$here_path.'/podmd.pl';
	`$doccmd`;
}
