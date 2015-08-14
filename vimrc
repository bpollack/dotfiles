syntax on

let mapleader=","
nnoremap ; :
vnoremap ; :

set title hidden cursorline
set visualbell noerrorbells

set autoindent smartindent
set shiftwidth=4 softtabstop=4 tabstop=8 expandtab
set backspace=indent,eol,start
set scrolloff=3

set showmatch incsearch ignorecase smartcase hlsearch gdefault
set ruler wildmenu
set wildignore=*.swp,*.bak,*.pyc

set list
set listchars+=eol:¬
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=trail:⋅
set listchars+=nbsp:⋅
set listchars+=tab:>-

set wrap
set textwidth=79
set formatoptions=qrn1

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap kj <esc>

nnoremap <leader>W <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>
nmap <silent> <leader><space> :nohlsearch<CR>

au FocusLost * :wa
au filetype go setl noexpandtab shiftwidth=8 softtabstop=8 nolist
au filetype ruby setl shiftwidth=2 softtabstop=2

set history=1000
set undolevels=1000
set backup
set undofile
set backupdir=~/.vim/backupdir
set directory=~/.vim/backupdir
set undodir=~/.vim/undodir

filetype on
filetype plugin on
filetype plugin indent on

set background=dark

if has('gui_running')
    set guifont=Inconsolata\ for\ Powerline:h14
end

set laststatus=2
let g:airline_powerline_fonts = 1
let g:pymode_lint_ignore = "E501"

call plug#begin('~/.vim/plugins')
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'dag/vim-fish'
Plug 'klen/python-mode'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
call plug#end()

colorscheme solarized
