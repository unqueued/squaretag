#!/usr/bin/perl

use strict;
use warnings;

use FindBin '$Bin';
use Test::More;

require_ok("$Bin/../bin/squaretag");

is_deeply( [ search_tags( 'foo', 'file[foo].txt' ) ]->[0], ['file[foo].txt'] );
is_deeply( [ search_tags( 'bar', 'file[foo].txt' ) ]->[0], [] );
is_deeply( [ search_tags( 'bar', 'file[foo].txt', 'test[bar].txt' ) ]->[0],
    ['test[bar].txt'] );

is_deeply( [ search_tags( '~bar', 'file[foo].txt', 'test[bar].txt' ) ]->[0],
    ['file[foo].txt'] );

is_deeply( [ search_tags( '+foo', 'file[foo].txt', 'test[bar].txt' ) ]->[0],
    ['file[foo].txt'] );

done_testing;