#! /usr/bin/env perl

use 5.014;
use autodie;
use File::Path;
use Cwd 'realpath';

if (shift @ARGV eq '-h'){
	say "install.pl [args]";
	say "-h to display help";
	say "--fonts install powerline fonts";
	die;
}

# Backup
my $old_file = $ENV{'HOME'}.'/.vimrc';

if (-e $old_file) {
	rename $old_file, "$old_file.old";
	say "Old vimrc backuped to ~/.vimrc.old";
} else {
	say "No file to backup";
}

# Writing files
say "Writing your new config";
open my $vimrc, '>', $old_file;

my $script = realpath($0);
my $path = $script =~ s#/(\w|\.)+\z##ar;

select $vimrc;
say "let syncdir=\"$path/\"";
say 'exec "source ".syncdir."vimrc"';
select STDOUT;

close $vimrc;

# Install stuff from git
say "Installing Vundle";
`git clone https://github.com/VundleVim/Vundle.vim $ENV{'HOME'}/.vim/bundle/Vundle.vim`;

my $tmp_dir = '.tmp_vim_config';

rmtree $tmp_dir if -e $tmp_dir;
mkdir $tmp_dir;
chdir $tmp_dir;
for(@ARGV){
	if ($_ eq "--fonts"){
		`git clone https://github.com/powerline/fonts.git`;
		`fonts/install.sh`;
	}
}
chdir '..';
rmtree $tmp_dir;

# Finish install
say "Installing your plugins";
system('vim -c PluginInstall');
say "Installation complete";
