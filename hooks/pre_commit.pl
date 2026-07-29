#!/usr/bin/env perl

use strict;
use warnings;

use Git::Hooks;
use Term::ANSIColor;
use feature 'say';
use utf8;
use Data::Dumper;
use English qw( -no_match_vars );
use open qw( :std :encoding(UTF-8) );


PRE_COMMIT {
    my ($git) = @_;

    say "Running pre-commit hook...\n";

    my @files_changed = grep { /\.(?:pl|pm)$/ } $git->filter_files_in_index('AM');
   
   return 1 unless @files_changed;

    system('perlcritic', @files_changed);

    if ($? != 0) {
        say "❌ perlcritic found policy violations. Commit aborted.";
        $git->command(qw(restore --staged), @files_changed);
        exit 1;
    }

    system('perltidy', '-b', @files_changed);

    if ($? != 0) {
        say "❌ perltidy failed. Commit aborted.";
        $git->command(qw(restore --staged), @files_changed);
        exit;
    }

    return 1;
};

run_hook($0, @ARGV);