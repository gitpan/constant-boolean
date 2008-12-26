#!/usr/bin/perl

use strict;
use warnings;

use Carp ();

$SIG{__WARN__} = sub { local $Carp::CarpLevel = 1; Carp::confess("Warning: ", @_) };

use Test::More tests => 7;

eval q{
  use constant::boolean;
};

is( $@, '', 'use constant::boolean' );

my $true;
eval q{
    $true = TRUE;
};

ok( defined $true, 'defined TRUE' );
ok( $true, 'TRUE is true' );
is( prototype('TRUE'), '', 'TRUE is constant' );

my $false;
eval q{
    $false = FALSE;
};

ok( defined $false, 'defined FALSE' );
ok( ! $false, 'FALSE is not true' );
is( prototype('FALSE'), '', 'FALSE is constant' );
