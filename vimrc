" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
filetype off

" Ajout de Vundle au runtime path et initialisation
set rtp+=~/.vim/bundle/Vundle.vim
cal vundle#begin()

" On indique à Vundle de s'auto-gérer
Plugin 'VundleVim/Vundle.vim'

" Indique ce que doit gérer Vundle

exec "source ".syncdir."vimrc.plugins"

call vundle#end()
filetype plugin indent on

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

syntax on
colorscheme monokai
set relativenumber
set number

if has("gui_running")
	set guifont=Roboto\ Mono\ for\ Powerline
	set background=dark
	colorscheme solarized
endif

exec "source ".syncdir."vimrc.plugin.conf"
