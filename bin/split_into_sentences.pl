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
use Lingua::Sentence;
use Perl6::Form;

# global vars

# subs

# main
sub main {

    my @all_sentences;

    my @files = `cd /data; ls -1 *.txt`;
    chomp(@files);

    my $splitter = Lingua::Sentence->new("en");

    foreach my $file_name (@files) {

        my $content = read_file(
            "/data/$file_name",
            {
                binmode => ':utf8',
            },
        );

        $content =~ s/\n/ /mg;

        my @sentences = $splitter->split_array($content);

        push @all_sentences, @sentences;

    }

    write_file(
        '/data/sentences',
        {
            binmode => ':utf8',
        },
        join "\n", @all_sentences,
    );

}
main();
__END__
