# NAME

Data::Dataset::Classic - Example Datasets

# VERSION

version 0.001

# SYNOPSIS

    use Data::Dataset::Classic::Iris;
    use Chart::Plotly qw(show_plot);
    
    my $iris = Data::Dataset::Classic::Iris::get(as => 'Data::Table');
    
    show_plot($iris);

# AUTHOR

Pablo Rodríguez González <pablo.rodriguez.gonzalez@gmail.com>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2016 by Pablo Rodríguez González.

This is free software, licensed under:

    The MIT (X11) License
