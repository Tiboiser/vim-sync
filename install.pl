#!/usr/bin/perl -w

use 5.018;
use autodie;
use Cwd 'realpath';

open my $vimrc, '>', "$ENV{'HOME'}/.vimrc";

my $script = realpath($0);
my $path = $script =~ s#/(\w|\.)+\z##ar;

select $vimrc;
say "let syncdir=\"$path/\"";
say 'exec "source ".syncdir."vimrc"';
select STDIN;

close $vimrc;

`git clone https://github.com/VundleVim/Vundle.vim $ENV{'HOME'}/.vim/bundle/Vundle.vim`
