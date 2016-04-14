set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()            " required
filetype plugin indent on    " required

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set expandtab	  "tabs are spaces

set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set nobackup
set noswapfile

"i dont wanna use esc
inoremap jj <Esc>
inoremap <C-ü> <Esc>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

"no automatic comment when pressing enter in comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set relativenumber "line number realitves to current line
set undofile        " create a undo file
set gdefault "s/... add a g default at end

"some search optimizations
set incsearch
set showmatch
set hlsearch

"up down etc does not work in normal mode... training purposes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

let mapleader=","       " leader is comma
"\w strips trailing white spaces
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
"open this file in another window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

"ctrl + hjkl makes split window navigation easy
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set wildmenu
set lazyredraw
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za

set listchars=tab:>~,nbsp:_,trail:.
set list

syntax enable
set background=dark
colorscheme solarized
if has('gui_running')
    set t_Co=16
endif


