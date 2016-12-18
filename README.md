# NAME

Data::Dataset::Classic - Classic datasets for examples, testing and illustrative purposes

# VERSION

version 0.001

# SYNOPSIS

```perl
use Data::Dataset::Classic::Iris;
use Chart::Plotly qw(show_plot);

my $iris = Data::Dataset::Classic::Iris::get(as => 'Data::Table');

show_plot($iris);
```

# DESCRIPTION

Classic datasets for examples or testing. 

The available datasets are in the namespace: Data::Dataset::Classic and have one function: get.
This function returns the dataset in the format specified by the parameter as. By default returns a hashref
where each key is the name of the column and each value has an arrayref with the data.

Using the parameter as you can adapt the data returned by get to whatever you want. Just add an adapter in 
the namespace Data::Dataset::Classic::Adapter:: that match the type you want to get. This module ships
some default adapters: 

- [Data::Dataset::Classic::Adapter::Data::Table](https://metacpan.org/pod/Data::Dataset::Classic::Adapter::Data::Table) returns [Data::Table](https://metacpan.org/pod/Data::Table) objects
- [Data::Dataset::Classic::Adapter::Data::Frame](https://metacpan.org/pod/Data::Dataset::Classic::Adapter::Data::Frame) returns [Data::Frame](https://metacpan.org/pod/Data::Frame) objects
- [Data::Dataset::Classic::Adapter::PDL](https://metacpan.org/pod/Data::Dataset::Classic::Adapter::PDL) returns [PDL](https://metacpan.org/pod/PDL) objects
- [Data::Dataset::Classic::Adapter::PDL::Matrix](https://metacpan.org/pod/Data::Dataset::Classic::Adapter::PDL::Matrix) returns [PDL::Matrix](https://metacpan.org/pod/PDL::Matrix) objects

You could use these as examples for your own adapters.

# AUTHOR

Pablo Rodríguez González <pablo.rodriguez.gonzalez@gmail.com>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2016 by Pablo Rodríguez González.

This is free software, licensed under:

```
The MIT (X11) License
```
