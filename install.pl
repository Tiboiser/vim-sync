#!/usr/bin/perl -w

use 5.018;
use autodie;
use Cwd 'realpath';

say "Backuping your original vimrc";
eval {
	rename "$ENV{'HOME'}/.vimrc", "$ENV{'HOME'}/.vimrc.old";
} or do {
	say "No file to backup";
};

say "Writing your new config";
open my $vimrc, '>', "$ENV{'HOME'}/.vimrc";

my $script = realpath($0);
my $path = $script =~ s#/(\w|\.)+\z##ar;

select $vimrc;
say "let syncdir=\"$path/\"";
say 'exec "source ".syncdir."vimrc"';
select STDOUT;

close $vimrc;

say "Installing Vundle";
`git clone https://github.com/VundleVim/Vundle.vim $ENV{'HOME'}/.vim/bundle/Vundle.vim`;

say "Installation complete";
say "Now just launch vim and use :PluginInstall to complete your install";
