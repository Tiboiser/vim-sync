" Configuration jile for vim

set modelines=0" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements

 set nocompatible" Use Vim defaults instead of 100% vi compatibility
 set backspace=2" more powerful backspacing
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
 set completeopt+=preview
" Slow, but cool ! set relativenumber
 set number

 if has("gui_running")
 	set guifont=Roboto\ Mono\ for\ Powerline
 	set background=dark
 	colorscheme solarized
 endif

exec "source ".syncdir."vimrc.plugin.conf"


"   ################
"   #  My customs  #
"   ################

" Ctrlp Conf
" Disable file exploration with
set wildignore+=*/tmp/*,*.so,*.o,*.swp,*.zip,Compil,DEBUG_Compil
let g:ctrlp_custom_ignore = {'dir': '\v[\/]\.(git|hg|svn|obj)$'}

" AMPL Plugin - Conf


" Enable folding
 set foldmethod=manual
 set foldlevel=99

 " Restart editing where you were
 " from http://ebonhand.wordpress.com/2011/03/30/automatically-save-and-load-vim-views-folds
  set viewoptions-=options
  augroup vimrc
  	     autocmd BufWritePost *
  	         \   if expand('%') != '' && &buftype !~ 'nofile'
  	         \|      mkview
  	         \|  endif
  	     autocmd BufRead *
  		 \   if expand('%') != '' && &buftype !~ 'nofile'
  		 \|      silent loadview
  		 \|  endif
  augroup END


" Set default encryption system
 set cm=blowfish2

" enable highlighting when searching
 set incsearch

" Enable the tag stack
 set tagstack
" Add custom ctag of std libraries 'ctags -R -f ~/.vim/systags /usr/include /usr/local/include' in the tags directories.
 set tags+=~/.vim/systags



"  Maps and Shortcuts
"  ==================

" Set remaps for bepo

noremap t j
noremap s k
noremap ê s
noremap ê S
noremap à t
noremap À T
noremap c h
noremap r l
noremap l r
noremap H C
noremap h c
noremap è <c-^>

" Add ';' at the end of the line
nnoremap ç A;<Esc>
vnoremap ç :s/\n/\;\r/<CR>

nnoremap é :r! /home/tiboiser/Documents/Projets/Assembly/gameboy/generateBG.plx<CR>
nnoremap <F4> :%s/\s*\n/\r/g<CR>

" Main in c
autocmd FileType c iabbrev <buffer> main int main(int argc, char *argv[]) {<CR><CR><CR>}<Esc>:normal!kk<CR>

" Make in latex
autocmd FileType tex set makeprg=pdflatex\ %


" Highlight unwanted spaces
" From www.vim.wikia.com/wiki/Highlight_unwantd_spaces

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLEave * call clearmatches()

let Tex_SmartKeyQuote=0
