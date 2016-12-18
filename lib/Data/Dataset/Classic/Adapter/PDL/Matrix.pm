package Data::Dataset::Classic::Adapter::PDL::Matrix;

use strict;
use warnings;
use utf8;

use Module::Load;

# VERSION

# ABSTRACT: Adapter for PDL::Matrix

=encoding utf-8

=head1 SYNOPSIS

	use Data::Dataset::Classic::Anscombe
	my $anscombe = Data::Dataset::Classic::Anscombe::get(as => 'PDL::Matrix')

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

Construct a PDL::Matrix object from a Data::Dataset::Classic

=cut

sub from {
	my $self = shift();
	my $data = shift();
	
	Module::Load::autoload PDL;
	Module::Load::load PDL::Matrix;
	my @keys = sort keys %$data;
	my $pdl_matrix = PDL::Matrix->pdl(
		[
			@{$data}{@keys}
		]
	);
	return transpose $pdl_matrix;	
}

1;
