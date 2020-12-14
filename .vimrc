set nocompatible
filetype off
set nu
set tabstop=2
set shiftwidth=2
set expandtab
set noswf             " no swapfile
set ignorecase        " case insensitive search
set incsearch         " show incremental search results as you type
set hlsearch          " highlight search results
set scrolloff=10      " keep cursor centered on screen
set mouse=a           " allow scrolling thru vim with scrollwheel
set ttymouse=xterm2
let mapleader = ","

autocmd InsertEnter * set cul         " Display line under current inserting line
autocmd InsertLeave * set nocul
autocmd BufWritePre *.js :%s/\s\+$//e " Remove trailing whitespace
highlight Search cterm=NONE ctermfg=white ctermbg=grey

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'othree/html5.vim'
Plugin 'valloric/youcompleteme'
Plugin 'vim-airline/vim-airline'
Plugin 'rgrinberg/vim-ocaml'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mg979/vim-visual-multi'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"syntax enable
"set background=dark
"colorscheme solarized

" misc plugin settings
" map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeToggle<CR>
map <leader>/ <plug>NERDCommenterToggle
let g:ycm_autoclose_preview_window_after_completion = 1
let g:NERDTreeWinPos = "left"
let g:NERDSpaceDelims = 1
let g:airline#extensions#tabline#enabled = 1

" Syntastic settings
" To check avaiable checkers for current filetype in vim use :SyntasticInfo
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ocaml_checkers = ['merlin']
highlight SyntasticErrorSign guifg=white guibg=red
nnoremap <silent> <C-d> :call comfortable_motion#flick(50)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-50)<CR>

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
