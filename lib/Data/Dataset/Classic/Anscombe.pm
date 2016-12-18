package Data::Dataset::Classic::Anscombe;

use strict;
use warnings;
use utf8;

use Data::Dataset::Classic;

# VERSION

# ABSTRACT: Anscombe classic dataset

=encoding utf-8

=head1 SYNOPSIS

# EXAMPLE: examples/anscombe.pl

=method get

Returns the classic Anscombe dataset as a reference.

By default returns a hash ref with the column names as the keys and data as the values as an array ref.
You can get the data in the format you want using the argument as and indicating a valid class in the 
namespace Data::Dataset::Classic::Adapter::*

=cut

my $dataset = 
	 {
		'x1' => [
10.0,8.0 ,13.0,9.0 ,11.0,14.0,6.0 ,4.0 ,12.0,7.0 ,5.0
],
		'x2' => [
10.0,8.0 ,13.0,9.0 ,11.0,14.0,6.0 ,4.0 ,12.0,7.0 ,5.0
],
		'x3' => [
10.0,8.0 ,13.0,9.0 ,11.0,14.0,6.0 ,4.0 ,12.0,7.0 ,5.0
],
		'x4' => [
8.0 ,8.0 ,8.0 ,8.0 ,8.0 ,8.0 ,8.0 ,19.0,8.0 ,8.0 ,8.0
],
		'y1' => [
8.04 ,6.95 ,7.58 ,8.81 ,8.33 ,9.96 ,7.24 ,4.26 ,10.84,4.82 ,5.68 
],
		'y2' => [
9.14,8.14,8.74,8.77,9.26,8.10,6.13,3.10,9.13,7.26,4.74
],
		'y3' => [
7.46 ,6.77 ,12.74,7.11 ,7.81 ,8.84 ,6.08 ,5.39 ,8.15 ,6.42 ,5.73
],
		'y4' => [
6.58,5.76,7.71,8.84,8.47,7.04,5.25,12.50,5.56,7.91,6.89
],
		};

sub get {
	return Data::Dataset::Classic::_adapt($dataset, @_);	
}

1;
