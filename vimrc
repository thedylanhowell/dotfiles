set shell=/bin/bash

set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" How many lines of history are remembered
set backspace=indent,eol,start
set history=700
set undolevels=700
set mouse=a

filetype off
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 5 lines to the cursor when using j/k
set so=7

" Always show current position
set ruler
set number

" Ignore case when searchin
set ignorecase

" When searching try to be smart about cases
set smartcase

"Highlight search results
set hlsearch

" Matching brackets
set showmatch
" No sound effects
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
syntax enable
set cursorline
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fuck Swap Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noswapfile
set nobackup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tabs and Spacing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
set expandtab
set smarttab

" Indentation
set shiftwidth=4
set tabstop=4

set ai "Auto Indent
set si "Smart indent
set wrap "Wrap Lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving Around
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines
map j gj
map k gk

map <space> /
map <c-space> ?

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Delete all that nasty white space that works Staley up so much
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.java :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
