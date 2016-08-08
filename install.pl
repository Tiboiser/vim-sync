#!perl -w

use 5.014;
use autodie;
use Cwd 'realpath';

my $old_file = $ENV{'HOME'}.'/.vimrc';

if (-e $old_file) {
	rename $old_file, "$old_file.old";
	say "Old vimrc backuped to ~/.vimrc.old";
} else {
	say "No file to backup";
}

say "Writing your new config";
open my $vimrc, '>', $old_file;

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
