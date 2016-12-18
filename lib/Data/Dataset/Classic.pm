package Data::Dataset::Classic;

use strict;
use warnings;
use utf8;

use Storable;
use Module::Load;

# VERSION

# ABSTRACT: Example Datasets

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/iris.pl

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
