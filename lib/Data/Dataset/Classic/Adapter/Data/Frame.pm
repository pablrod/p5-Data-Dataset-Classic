package Data::Dataset::Classic::Adapter::Data::Frame;

use strict;
use warnings;
use utf8;

use Module::Load;

# VERSION

# ABSTRACT: Adapter for Data::Frame

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

Construct a Data::Frame object from a Data::Dataset::Classic

=cut

sub from {
	my $self = shift();
	my $data = shift();
	
	my $class_name = 'Data::Frame';
	Module::Load::load $class_name;
	Module::Load::autoload PDL;
	my @keys = sort keys %$data;
	my $data_frame = $class_name->new(
		columns => [
			map {($_ => pdl($data->{$_}) )} @keys
		]
	);
	return $data_frame;	
}

1;
