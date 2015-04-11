#!/usr/bin/perl

=encoding UTF-8
=cut

=head1 DESCRIPTION

=cut

# common modules
use strict;
use warnings FATAL => 'all';
use feature 'say';
use utf8;
use open qw(:std :utf8);

use File::Slurp;
use Lingua::EN::Splitter qw(words);
use Perl6::Form;

# global vars

# subs

# main
sub main {

    my %words;

    my @files = `cd /data; ls -1 *.txt`;
    chomp(@files);

    foreach my $file_name (@files) {

        my $content = read_file(
            "/data/$file_name",
            {
                binmode => ':utf8',
            },
        );

        my $words = words($content);

        foreach my $word (@{$words}) {
            $words{ $word } += 1;
        }
    }

    foreach my $word (sort { $words{$b} <=> $words{$a}}keys %words) {
        print form "{<<<<<<<<<} {<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<}",
            $words{$word},
            $word,
            ;
    }

}
main();
__END__
