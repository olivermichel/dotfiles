call plug#begin('~/.vim/plugged')
	Plug 'w0ng/vim-hybrid'
	Plug 'kien/ctrlp.vim'
	Plug 'scrooloose/nerdtree'
call plug#end()

set nocompatible         " use vim defaults instead of vi
set encoding=utf-8       " always encode in utf

filetype plugin indent on
syntax on
colorscheme hybrid
set background=dark

set cursorline            " visual indicator of current line
set fcs=vert:│,fold:-     " solid instead of broken line for vert splits
set laststatus=2          " always show status line
set lazyredraw            " don't update screen when executing macros
set mouse=a               " enable mouse in all modes
set showmatch             " show bracket matches
set number                " show line numbers
set showcmd               " show command on last line of screen
set title                 " use filename in window title
set wildmenu              " enhanced cmd line completion
set wildignore+=*.a,*.o,.DS_Store,.git,*~,*.swp,*.tmp

set autoindent            " copy indent from previous line
set noexpandtab           " don't replace tabs with spaces
set shiftwidth=4          " spaces for autoindenting
set smarttab              " <BS> removes shiftwidth worth of spaces
set softtabstop=4         " spaces for editing, e.g. <Tab> or <BS>
set tabstop=4             " spaces for <Tab>

if has("autocmd")
	" filetype-specfific settings
	autocmd FileType make     setlocal ts=4 sts=4 sw=4 noexpandtab
	autocmd FileType yaml     setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType ruby     setlocal ts=2 sts=2 sw=2 noexpandtab
	autocmd FileType cpp      setlocal ts=3 sts=3 sw=3 noexpandtab
	autocmd FileType c        setlocal ts=3 sts=3 sw=3 noexpandtab
	autocmd FileType plaintex setlocal ts=3 sts=3 sw=3 noexpandtab
endif

set hlsearch              " highlight search results
set incsearch             " search whilst typing
set ignorecase            " case insensitive searching
set smartcase             " override ignorecase if upper case typed

set showtabline=2         " always show tabbar

set statusline=%n:\ %F\ %m%r%h%w[%{&ff}]%y%=%l/%L/%p%%\ 

set list                  " show some invisibles
set listchars=tab:▸\ ,trail:~,extends:>,precedes:<

map <C-n> :NERDTreeToggle<CR>
