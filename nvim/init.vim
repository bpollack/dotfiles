let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set t_Co=256

let mapleader=','
nnoremap ; :
vnoremap ; :

set title hidden cursorline
set visualbell noerrorbells

set smartindent
set shiftwidth=4 softtabstop=4 tabstop=8 expandtab
set scrolloff=3

set showmatch ignorecase smartcase gdefault
set ruler
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

nmap <silent> <leader>ev :e ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>sv :so ~/.config/nvim/init.vim<CR>
nmap <silent> <leader><space> :nohlsearch<CR>

au FocusLost * :wa
au filetype go setl noexpandtab shiftwidth=8 softtabstop=8 nolist
au filetype ruby setl shiftwidth=2 softtabstop=2

set undolevels=1000
set backupdir=~/.config/nvim/backupdir
set directory=~/.config/nvim/backupdir
set undodir=~/.config/nvim/undodir

filetype on
filetype plugin on
filetype plugin indent on

set background=dark

set laststatus=2
let g:airline_powerline_fonts=1

let g:FactorRoot = "~/src/factor"
let g:FactorNewVocabRoot = "~/src/fraktor"

call plug#begin('~/.config/nvim/plugins')
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'dag/vim-fish'
Plug 'nathangrigg/vim-beancount'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug '~/src/dotfiles/vim-factor'
call plug#end()
