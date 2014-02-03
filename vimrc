call pathogen#infect()
call pathogen#helptags()

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
set listchars=tab:>-,trail:-

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
au filetype was setl noexpandtab shiftwidth=8 softtabstop=8 nolist
au filetype aspvbs setl noexpandtab shiftwidth=8 softtabstop=8 nolist

" For KnewtonCrabStacker only, disable tab/spaces and some PEP-8 rules
augroup knewton
    au!
    au BufRead,BufWrite */KnewtonCrabStacker/*.py setl noexpandtab tabstop=8 shiftwidth=8 softtabstop=8 nolist
    au BufRead,BufWrite */KnewtonCrabStacker/*.py let pymode_lint_ignore="W191,E101,E301,E302"
augroup END

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
colorscheme solarized

set guifont=Menlo:h12.00
