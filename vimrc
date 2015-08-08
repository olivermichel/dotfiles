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

" syntax coloring
syntax enable
colorscheme hybrid
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

set laststatus=2                                  " always show the status line
set statusline=
set statusline+=\[%n\]                            " buffer number
set statusline+=\[%f/%{strlen(&ft)?&ft:'?'}]      " filename and type
set statusline+=%h%m%r%w                          " status flags
set statusline+=%=                                " right align remainder
set statusline+=\[%l/%L\]                         " line/total lines

set ruler

" always show tabbar
set showtabline=2

set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set copyindent
set preserveindent
set smarttab

set cursorline

set nobackup
set noswapfile

set mouse=a

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:<

" use te for tabedit
cabbrev te tabedit
cabbrev t newtab

