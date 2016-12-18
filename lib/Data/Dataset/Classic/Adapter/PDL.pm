package Data::Dataset::Classic::Adapter::PDL;

use strict;
use warnings;
use utf8;

use Module::Load;

# VERSION

# ABSTRACT: Adapter for PDL

=encoding utf-8

=head1 SYNOPSIS

	use Data::Dataset::Classic::Anscombe
	my $anscombe = Data::Dataset::Classic::Anscombe::get(as => 'PDL')

=head1 DESCRIPTION

Adapts a Data::Dataset::Classic to a PDL object. 

=method new

Constructs a new adapter

=cut

sub new {
	my $class_name = shift();
	return bless({}, $class_name);
}

=method from

Construct a PDL object from a Data::Dataset::Classic

=cut

sub from {
	my $self = shift();
	my $data = shift();
	
	Module::Load::autoload PDL;
	my @keys = sort keys %$data;
	my $pdl = pdl(
		[
			@{$data}{@keys}
		]
	);
	return transpose $pdl;	
}

1;
