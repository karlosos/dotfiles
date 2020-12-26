set nocompatible
filetype off
set t_Co=256

call plug#begin('~/AppData/Local/nvim/plugged')
    "
    " Python
    "

    " Autocomplete 
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif

    " Intellisense (LSP)
    Plug 'zchee/deoplete-jedi'
    Plug 'davidhalter/jedi'
    Plug 'davidhalter/jedi-vim'
    " Call signatures
    Plug 'Shougo/echodoc.vim'

    " Python formatter
    Plug 'psf/black'

    " Generate docstring for python function/class
    Plug 'pixelneo/vim-python-docstring'

    "
    " Misc
    "

    " Git wrapper
    Plug 'tpope/vim-fugitive'
    " Directory sidebar tree view
    Plug 'scrooloose/nerdtree'
    " Json plugin
    Plug 'elzr/vim-json'
    " Text search your project directory
    Plug 'dyng/ctrlsf.vim'
    " Fuzzy file finder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " Root the project dir to folder w/ .git if applicable
    Plug 'airblade/vim-rooter'
    " Nice colorscheme based on Visual Studio dark
    Plug 'tomasiser/vim-code-dark'
    " Status bar on the bottom
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Show git diff in the sign column
    Plug 'airblade/vim-gitgutter'
    " Automaticly add pairing parenteses
    " Plug 'jiangmiao/auto-pairs'
    " Multiple cursors with Ctrl-Down/Ctrl-Up
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    " Highlight unique characters in line for quick f F
    Plug 'unblevable/quick-scope'
    " Linters and formatters for many languages
    Plug 'dense-analysis/ale'
    " Comment lines
    Plug 'tpope/vim-commentary'
    " Surround words/selections with braces, quotes etc.
    Plug 'tpope/vim-surround'
    " Activity Watch watcher
    Plug 'ActivityWatch/aw-watcher-vim'
call plug#end()

colors codedark
let g:airline_theme = 'codedark'

set shiftwidth=4
set tabstop=4
set expandtab
filetype plugin on
filetype indent on
syntax on
set nu
set autochdir
nmap <leader>l :set list!<CR>
set mouse=a
set autoread
let NERDTreeQuitOnOpen = 1
set completeopt=menu
set linebreak
autocmd Filetype html,ruby,javascript,yml,yaml,json,haskell,ejs,htmldjango setlocal ts=2 sts=2 sw=2
set noswapfile
set wildignore+=*.pyc

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

let g:ycm_autoclose_preview_window_after_completion=1
set enc=utf-8
set fileencodings=ucs-bom,utf8,prc
set fileencoding=utf-8

set nofoldenable
filetype plugin indent on

" let g:python2_host_prog = 'C:\Users\karol\virtualenvs\nvimpy2\Scripts\python.exe'
let g:python3_host_prog = 'C:\Users\karol\virtualenvs\nvimpy3\Scripts\python.exe'
let g:black_virtualenv = 'C:\Users\karol\virtualenvs/black'

let g:acp_enableAtStartup = 0

" Deoplete
let g:deoplete#enable_at_startup = 1
" Deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" CTRL + o for nerd tree
map <C-b> :NERDTreeToggle<CR>

" FZF and RG config
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-t': 'tabe'
      \ }

nnoremap <c-p> :FZF<cr>
nnoremap <c-f> :Rg<cr>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
 
command! -bang ProjectFiles call fzf#vim#files('.', <bang>0)
 
" Clipboard
set clipboard+=unnamedplus
let g:qs_max_chars=80

" Change leader to comma
let mapleader=","

" Set pydocstring format
let g:python_style = 'rest'

" Disable jedi-vim (because it's synchronous)
let g:jedi#completions_enabled = 0
autocmd FileType python setlocal completeopt-=preview
let g:jedi#show_call_signatures = 2
