" Vundle stuff {{{
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'
Plugin 'tpope/vim-fugitive' "git integration
Plugin 'tpope/vim-vinegar'
"Plugin 'scrooloose/nerdtree' 
Plugin 'kien/ctrlp.vim' "fuzzy finding files
Plugin 'kshenoy/vim-signature' "showing dem marks
Plugin 'altercation/vim-colors-solarized' "showing dem marks
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" set options {{{

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

let g:netrw_bufsettings = 'noma nomod rnu nobl nowrap ro'

syntax enable
set background=dark
let g:solarized_italic=0
colorscheme solarized

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set expandtab     "tabs are spaces

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

set relativenumber "line number realitves to current line

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" set and create dir for storing undo operations 
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif


set gdefault "s/... add a g default at end

"some search optimizations
set incsearch
set showmatch
set hlsearch
set wildmenu
set lazyredraw
set foldenable
set foldlevelstart=10
set foldnestmax=10

set listchars=tab:>~,nbsp:_,trail:¬
set list

set hidden "allow hidden buffers

"show git branch in statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
"make statusline always shown
set laststatus=2

"use system clipboard for unnamed buffer
set clipboard=unnamed

"only disply filename and not path in tabname in gui
set guitablabel=%t

" set GUI language to english
set langmenu=en_US.UTF-8
language messages en_US.UTF-8
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" }}}

"mappings {{{

"up down etc does not work in normal mode... training purposes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

let mapleader=","       " leader is comma
"see all modified buffers
nnoremap <leader>w :ls+<cr>
"open this file in another window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"add changelog date/time
nnoremap <leader>cl :r !date --rfc-2822<cr>

"clear search highlight
nnoremap <leader><space> :nohl<CR>

"ctrl + hjkl makes split window navigation easy
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"this function creates a new split on the side when there is none
"map <silent> <C-h> :call WinMove('h')<cr>
"map <silent> <C-j> :call WinMove('j')<cr>
"map <silent> <C-k> :call WinMove('k')<cr>
"map <silent> <C-l> :call WinMove('l')<cr>
nnoremap <space> za

"i dont wanna use esc
inoremap jj <Esc>
inoremap kk <Esc>
inoremap <C-Ã¼> <Esc>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

"git status and bigger
nmap <leader>gs :Gstatus<CR><C-w>20+ 
"nerd tree open
"map <C-n> :NERDTreeToggle<CR>

" enter in normal inserts new line (better than o + esc)
nnoremap <cr> o<esc>

" }}}

" autocmd {{{

augroup fugi_gro
    autocmd!
    "fugitive browsing windows dont keep themself open in the background
    autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

function! StartUp()
    if 0 == argc()
"        NERDTree
    end
endfunction

augroup vim_startup
    autocmd!
    autocmd VimEnter * call StartUp()
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevelstart=0
augroup END

" }}}

"Section Functions {{{

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

"}}}
