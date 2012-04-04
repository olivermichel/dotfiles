set number
set scrolloff=999
set encoding=utf-8

filetype plugin on
filetype indent on

syntax on

set laststatus=2
set statusline=
set statusline+=%-3.3n\                         " buffer number
set statusline+=%f\                             " filename
set statusline+=%h%m%r%w                        " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
set statusline+=%=                              " right align remainder
set statusline+=0x%-8B                          " character value
set statusline+=%-14(%l,%c%V%)                  " line, character
set statusline+=%<%P                            " file position

set ruler
set wildmenu
set visualbell
set autoread

set so=7

set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

map <space> /	
