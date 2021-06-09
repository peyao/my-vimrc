set nocompatible
filetype off
set nu
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start " more normal backspace functionality
set noswf             " no swapfile
set ignorecase        " case insensitive search
set incsearch         " show incremental search results as you type
set hlsearch          " highlight search results
set scrolloff=10      " keep cursor centered on screen
set mouse=a           " allow scrolling thru vim with scrollwheel
set ttymouse=xterm2
let mapleader = ","
set belloff=all


autocmd InsertEnter * set cul         " Display line under current inserting line
autocmd InsertLeave * set nocul
autocmd BufWritePre *.js :%s/\s\+$//e " Remove trailing whitespace
highlight Search cterm=NONE ctermfg=white ctermbg=grey

" misc plugin settings
map <leader>l :NERDTreeToggle<CR>
map <leader>/ <plug>NERDCommenterToggle
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinPos = "left"
let g:NERDSpaceDelims = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#clock#format = 'T:%H:%M'


" Pathogen Required
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
set guifont=iosevka-term-regular.ttf:h18

colorscheme dracula
let g:airline_theme='dracula'
