"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       				Vim settings				                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
filetype plugin indent on

set nocompatible
scriptencoding=utf-8
set encoding=utf-8
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set title " Change the title of the terminal
set ruler
set incsearch "when type search display result
set lazyredraw
set ffs=unix,dos,mac
set laststatus=2
set noshowmode
set shell=/bin/zsh
" set shellcmdflag=-ic
set tw=79
set formatoptions+=t
set backspace=indent,eol,start
set ttyfast
set spelllang=fr,en " Spell languages
filetype off

" Store .swp in those directory and not in the directory of the edited file
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

" Set terminal to 256colors
if !has('gui_running')
  set term=screen-256color
  set background=dark
  set t_Co=256
endif

" Highlight with red colors if text overflows 80 columns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Format the code (indentation)
map <F4> mzgg=G`z<CR>`

" FIXME nmap <F5> :set list! :highlight NonText guifg=#cccccc :highlight SpecialKey guifg=#cccccc
" jolis caractères pour les caracs invisibles :
" set listchars=tab:▸_,eol:$,space:.,nbsp:°

" Auto-completion
set omnifunc=syntaxcomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	                            		Vundle				                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           				 Plugins				                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic - Syntax Checker
" http://vimawesome.com/plugin/syntastic
Plugin 'scrooloose/syntastic'

" Vim-Airline - Status/Tabline bar
" http://vimawesome.com/plugin/vim-airline-sad-beautiful-tragic
Plugin 'bling/vim-airline'

" YouCompleteMe - Code completion engine
" http://vimawesome.com/plugin/youcompleteme
Plugin 'Valloric/YouCompleteMe'

" Auto Pair - Insert or remove brackets, quotes ... in pair
" http://vimawesome.com/plugin/auto-pairs
Plugin 'jiangmiao/auto-pairs'

" Trailing whitespace - Highlight trailing whitespace in red (:FixWhitespace)
" http://vimawesome.com/plugin/trailing-whitespace
Plugin 'bronson/vim-trailing-whitespace'

" LaTeX-Box - Lightweight toolbox for LaTeX
" http://vimawesome.com/plugin/latex-box-mine
Plugin 'LaTeX-Box-Team/LaTeX-Box'

" PHP Complete - PHP Documentation
" http://vimawesome.com/plugin/phpcomplete-vim
Plugin 'shawncplus/phpcomplete.vim'

" Better CSS syntax - CSS3 and SASS support
" http://vimawesome.com/plugin/better-css-syntax-for-vim
Plugin 'hail2u/vim-css3-syntax'

" HTML5 - Add support for HTML5
" http://vimawesome.com/plugin/html5-vim
Plugin 'othree/html5.vim'

" Multiple Cursors - Enable multiple cursors as in Sublime Text 3
" http://vimawesome.com/plugin/vim-multiple-cursors
Plugin 'terryma/vim-multiple-cursors'

" The NERD Commenter - Toogle comments
" http://vimawesome.com/plugin/the-nerd-commenter
Plugin 'scrooloose/nerdcommenter'

" Speeddating - Dates
" http://vimawesome.com/plugin/speeddating-vim
Plugin 'tpope/vim-speeddating'

" Universal text linking
" http://vimawesome.com/plugin/utl-vim
Plugin 'utl.vim'

" Typescript syntax files for Vim
" https://github.com/leafgarland/typescript-vim
Plugin 'leafgarland/typescript-vim'

" EditorConfig plugin for Vim
" https://github.com/editorconfig/editorconfig-vim
Plugin 'editorconfig/editorconfig-vim'

" CtrlP
" https://vimawesome.com/plugin/ctrlp-vim-red
" Plugin 'kien/ctrlp.vim'
" https://vimawesome.com/plugin/ctrlp-vim-everything-has-changed
Plugin 'ctrlpvim/ctrlp.vim'

" Ack
" https://vimawesome.com/plugin/ack-vim
Plugin 'mileszs/ack.vim'

" Black (python formatter)
" https://github.com/psf/black
Plugin 'psf/black'

" Vim-prettier
" https://vimawesome.com/plugin/vim-prettier-who-speaks
Plugin 'prettier/vim-prettier'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     			     Options Plugins                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntastic - Syntax Checker
" http://vimawesome.com/plugin/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ycm_show_diagnostics_ui = 0 " avoid bug with YouCompleteMe

" Set checkers and compilers options
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_php_args='-l'
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'
let g:syntastic_xml_checkers = ['xmllint']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' --std=c++11'
" let g:syntastic_ocaml_use_ocamlc = 1
" let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_typescript_checkers = ['tslint']
" let g:syntastic_javascript_checkers = ['flow']

" Vim-Airline - Status/Tabline bar
" http://vimawesome.com/plugin/vim-airline-sad-beautiful-tragic
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

let g:prettier#config#print_width = '140'
let g:prettier#config#use_tabs = 'false'

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Map <F2> to previous tab and <F3> to next tabs
nmap <F2> :tabprevious<Enter>
nmap <F3> :tabnext<Enter>

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
