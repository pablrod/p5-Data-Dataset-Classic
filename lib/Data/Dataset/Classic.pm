package Data::Dataset::Classic;

use strict;
use warnings;
use utf8;

use Storable;
use Module::Load;

# VERSION

# ABSTRACT: Classic datasets for examples, testing and illustrative purposes

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/iris.pl

=head1 DESCRIPTION

Classic datasets for examples or testing. 

The available datasets are in the namespace: Data::Dataset::Classic and have one function: get.
This function returns the dataset in the format specified by the parameter as. By default returns a hashref
where each key is the name of the column and each value has an arrayref with the data.

Using the parameter as you can adapt the data returned by get to whatever you want. Just add an adapter in 
the namespace Data::Dataset::Classic::Adapter:: that match the type you want to get. This module ships
some default adapters: 

=for :list
* L<Data::Dataset::Classic::Adapter::Data::Table> returns L<Data::Table> objects
* L<Data::Dataset::Classic::Adapter::Data::Frame> returns L<Data::Frame> objects
* L<Data::Dataset::Classic::Adapter::PDL> returns L<PDL> objects
* L<Data::Dataset::Classic::Adapter::PDL::Matrix> returns L<PDL::Matrix> objects

You could use these as examples for your own adapters.

=cut

sub _adapt {
	my $dataset = shift();
	my $data = Storable::dclone($dataset);
	my %params = @_;
	my $as = $params{'as'};
	if (defined $as) {
		my $adapter_name = 'Data::Dataset::Classic::Adapter::' . $as;
        eval {
            Module::Load::load $adapter_name;
            my $adapter = $adapter_name->new();
			$data = $adapter->from($data);
        };
        if ($@) {
            warn 'Cannot load adapter: ' . $adapter_name . '. Returning data as a hashref. ' . $@;
        }
	}
	
	return $data;	
}

1;
