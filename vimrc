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

" ################
" # My customs #
" ################

" Custom cursor
set cursorline
set cursorcolumn

" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Ycm configuration
" Compilation flags
"let g:ycm_global_ycm_extra_conf = '$HOME/.vim/ycm_extra_conf/ycm_extra_conf.py'

" Ctrlp Conf
" Disable file exploration with

let g:ctrlp_cmd = 'CtrlP .'
set wildignore+=*/tmp/*,*.so,*.o,*.swp,*.zip,Compil,DEBUG_Compil,*.class,*/Library/*,Library/*,*.meta,*/doc/html/*,*/doc/latex/*,
let g:ctrlp_custom_ignore = {'dir': '\v[\/]\.(git|hg|svn|obj|class|jar)$'}

" AMPL Plugin - Conf


" Enable folding
 set foldmethod=manual
 set foldlevel=99

 " Restart editing where you were
 " from http:// ebonhand.wordpress.com/2011/03/30/automatically-save-and-load-vim-views-folds
  set viewoptions-=options
  augroup vimrc
  	     autocmd BufWritePost *
  	         \ if expand('%') != '' && &buftype !~ 'nofile'
  	         \| mkview
  	         \| endif
  	     autocmd BufRead *
  		 \ if expand('%') != '' && &buftype !~ 'nofile'
  		 \| silent loadview
  		 \| endif
  augroup END


" Set default encryption system
 set cm=blowfish2

" enable highlighting when searching
 set incsearch

" Enable the tag stack
 set tagstack
" Add custom ctag of std libraries 'ctags -R -f ~/.vim/systags /usr/include /usr/local/include' in the tags directories.
 " set tags+=..
 set tags+=~/vim-sync/currtags
 set tags+=~/vim-sync/systags
 set tags+=./tags



" Maps and Shortcuts
" ==================

" Set remaps for bepo

nmap <ScrollWheelUp> <nop>
nmap <S-ScrollWheelUp> <nop>
nmap <C-ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
nmap <S-ScrollWheelDown> <nop>
nmap <C-ScrollWheelDown> <nop>
nmap <ScrollWheelLeft> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>


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
nnoremap <F4> :let @l=line('.')<CR>:let @c=col('.')<CR>:%s/\s*\n/\r/g<CR>:%s/\(\S\)\s\+\(\/\/.*$\)/\1 \2/ge<CR>:%s/\(\S\);\(\/\/.*$\)/\1; \2/ge<CR>:%s/\/\/\s*/\/\/ \1/ge<CR>:%s/\(\S\+\)\s\{2,50\}\(\S\+\)/\1 \2/e<CR>:%s/\(\S\+\)\s\{1\}\(\S\+\)/\1 \2/ge<CR>:%s/\(\(^\|\s\)for\)\s*(/\1 (/ge<CR>:%s/\(\(^\|\s\)foreach\)\s*(/\1 (/ge<CR>:%s/\(\(^\|\s\)while\)\s*(/\1 (/ge<CR>:%s/^foreach(/foreach (/ge<CR>:%s/\(\s\)foreach(/\1foreach (/ge<CR>:%s/^while(/while (/ge<CR>:%s/\(\s\)while(/\1while (/ge<CR>:%s/^for(/for (/ge<CR>:%s/\(\s\)for(/\1for (/ge<CR>Gdd:call cursor(@l,@c)<CR>

" Main in c
autocmd FileType c iabbrev <buffer> main int main(int argc, char *argv[]) {<CR><CR><CR>}<Esc>:normal!kk<CR>

" C#
autocmd FileType cs nnoremap <F4> :let @l=line('.')<CR>:let @c=col('.')<CR>:%s/\s*\n/\r/g<CR>:%s/\(\S\)\s\+\(\/\/\/.*$\)/\1 \2/ge<CR>:%s/\(\S\);\(\/\/\/.*$\)/\1; \2/ge<CR>:%s/\/\/\/\s*/\/\/\/ \1/ge<CR>:%s/\(\S\+\)\s\{2,50\}\(\S\+\)/\1 \2/e<CR>:%s/\(\S\+\)\s\{1\}\(\S\+\)/\1 \2/ge<CR>:%s/\(\(^\|\s\)for\)\s*(/\1 (/ge<CR>:%s/\(\(^\|\s\)foreach\)\s*(/\1 (/ge<CR>:%s/\(\(^\|\s\)while\)\s*(/\1 (/ge<CR>:%s/^foreach(/foreach (/ge<CR>:%s/\(\s\)foreach(/\1foreach (/ge<CR>:%s/^while(/while (/ge<CR>:%s/\(\s\)while(/\1while (/ge<CR>:%s/^for(/for (/ge<CR>:%s/\(\s\)for(/\1for (/ge<CR>Gdd:call cursor(@l,@c)<CR>
autocmd FileType cs set tabstop=3
autocmd FileType cs set shiftwidth=3
autocmd FileType cs set expandtab
autocmd FileType cs iabbrev <buffer> /// /// <summary><CR><+summary+><CR></summary><CR><param name="<+paramName+>"><+param+></param><CR><returns><+returns+></returns><Esc>kkkk

" OmniSharp
let g:OmniSharp_server_stdio=1
let g:OmniSharp_highlight_types = 3
let g:syntastic_cs_checkers = ['mcs']

augroup omnisharp_commands
	autocmd!
	" Show type information automatically when the cursor stops moving
	autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
	autocmd BufWritePost *.cs call OmniSharp#HighlightBuffer()
	" The following commands are contextual, based on the cursor position.
	autocmd FileType cs nnoremap <buffer> œgd :OmniSharpGotoDefinition<CR>
	autocmd FileType cs nnoremap <buffer> œfu :OmniSharpFindUsages<CR>
	autocmd FileType cs nnoremap <buffer> œfx :OmniSharpFixUsings<CR>
	autocmd FileType cs nnoremap <buffer> œtt :OmniSharpTypeLookup<CR>
	autocmd FileType cs nnoremap <buffer> œdc :OmniSharpDocumentation<CR>
augroup END

autocmd FileType cs nnoremap œ<Space> :OmniSharpGetCodeActions<CR>
autocmd FileType cs nnoremap œcf :OmniSharpCodeFormat<CR>
autocmd FileType cs nnoremap œrn :OmniSharpRename<CR>


" Make in latex
autocmd FileType markdown set makeprg=markdown\ %\ \>\ %.html
let Tex_SmartKeyQuote=0 " Remove the stupids auto-quotes when writing in latex

" Make in markdown
"autocmd FileType tex set makeprg="execute '!tmux new -d ' . pdflatex -interaction nonstopmode %"
autocmd FileType tex set makeprg=pdflatex\ %
"autocmd FileType tex set makeprg=pdflatex\ %
autocmd FileType tex nnoremap © :execute "!tmux new -d pdflatex -interaction nonstopmode <C-R>%"<CR><CR>


" Highlight unwanted spaces
" From www.vim.wikia.com/wiki/Highlight_unwantd_spaces

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLEave * call clearmatches()

" Syntastic code checker cpp
let g:syntastic_cpp_checkers = ['gcc', 'clang_check']

" Tabulation completion from context
let g:SuperTabDefaultCompletionType = "context"

" UltiSnip configuration
set rtp+=~/vim-sync/snip/
let g:UltiSnipsSnippetsDir = "~/vim-sync/snip/"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', '/home/tiboiser/vim-sync/snip']
let g:UltiSnipsListSnippets="<c-l>"

" Midifile lib cpp
let g:syntastic_cpp_compiler_options="-I/opt/midifile/include/ -I/home/tiboiser/Downloads/json-3.9.1/single_include/nlohmann/ -I./inc/ -I./includes/"


" " OmniCppComplete
" let OmniCpp_NamespaceSearch = 1
" let OmniCpp_GlobalScopeSearch = 1
" let OmniCpp_ShowAccess = 1
" let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
" let OmniCpp_MayCompleteDot = 1 " autocomplete after .
" let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
" let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" " automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" set completeopt=menuone,menu,longest,preview
