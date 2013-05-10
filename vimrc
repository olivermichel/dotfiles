let &t_Co=256

" line numbers
set number

" history
set history=700

" filetype extensions
filetype plugin on
filetype indent on

" re-read file when modified externally
set autoread

set scrolloff=999
set encoding=utf-8

filetype plugin on
filetype indent on

" syntax coloring
syntax enable
colorscheme grb256 
set background=dark

" enable wildmenu
set wildmenu

" try to be smart about cases when searching
set smartcase

" height of the command bar
set cmdheight=1

" highlight search results
set hlsearch

" incremental search
set incsearch

" show matching brackets when cursor over bracket
set showmatch

set laststatus=2				" always show the status line
set statusline=
set statusline+=%-3.3n\                         " buffer number
set statusline+=%f\                             " filename
set statusline+=%h%m%r%w                        " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
set statusline+=%=                              " right align remainder
set statusline+=%-14(%l,%c%V%) " line, character

set ruler

" spaces instead of tabs, 1 tab = 2 spaces
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

