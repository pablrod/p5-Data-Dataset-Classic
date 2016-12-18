package Data::Dataset::Classic::Adapter::Data::Table;

use strict;
use warnings;
use utf8;

use Module::Load;

# VERSION

# ABSTRACT: Adapter for Data::Table

=encoding utf-8

=head1 SYNOPSIS

	use Data::Dataset::Classic::Anscombe
	my $anscombe = Data::Dataset::Classic::Anscombe::get(as => 'Data::Table')

=head1 DESCRIPTION

Adapts a Data::Dataset::Classic to a PDL::Matrix object. 

=method new

Constructs a new adapter

=cut

sub new {
	my $class_name = shift();
	return bless({}, $class_name);
}

=method from

Construct a Data::Table object from a Data::Dataset::Classic

=cut

sub from {
	my $self = shift();
	my $data = shift();
	
	my $class_name = 'Data::Table';
	Module::Load::load $class_name;
	my @keys = sort keys %$data;
	my $data_table = $class_name->new(
		[@{$data}{@keys}],
		\@keys,
		1 # Column based
	);
	return $data_table;	
}

1;
