"----------------------------------------------------------------
"            _
"     _   __(_)___ ___  __________
"    | | / / / __ `__ \/ ___/ ___/
"   _| |/ / / / / / / / /  / /__
"  (_)___/_/_/ /_/ /_/_/   \___/
"
"----------------------------------------------------------------

runtime! debian.vim

set nocompatible     "This must be first, because it changes other options as a side effect.
set backspace=indent,eol,start   "Allow backspace over everything in insert mode.

"Enable syntax highlighting by default. 

if has("syntax")
  syntax on
endif

set history=500
set number
set relativenumber
set shortmess+=I
set hlsearch
let python_highlight_all = 1

let vim_markdown_folding_disabled = 1
let vim_markdown_folding_disabled = 1
hi markdownTexMathDelimiter ctermfg=13
hi markdownTexBlock ctermfg=13
hi markdownTexLine ctermfg=13
hi markdownExt ctermfg=11 cterm=none

if has('termguicolors')
  set termguicolors
endif

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set background=dark  "A dark background within the editing area and default on syntax highlighting
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin on
filetype indent on
let $LANG='en'

set autoindent          " Indent as with previous line
set autoread            " Automatically read a file that has been changed.
set autowrite		        " Automatically save before commands like :next and :make
set encoding=UTF-8      " Set the default file encoding to UTF-8
set foldmethod=syntax   " Fold code by define syntax.
set hidden		          " Hide buffers when they are abandoned.
set ignorecase		      " Do case insensitive matching.
set incsearch		        " Incremental search.
set langmenu=en

set laststatus=2        " Show the status line
set statusline=%t
set statusline+=%=
set statusline+=%{getcwd()}

set lazyredraw
set lbr                 " Linebreak on 200 characters
set tw=200
set magic
set mouse=a		          " Enable mouse usage (all modes).
set noerrorbells
set showmatch		        " Show matching brackets.
set showcmd		          " For showing command in status line.
set smartcase		        " Do smart case matching.
set smartindent         " Be smart about autoindent.
set ruler               " show the cursor position all the time.
set wildmenu            " Turn on the Wild menu.
set wildignore=*.o,*.pyc  " Ignore compiled files 
set wildmode=full       " Complete the next full match

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" Keep Plugin commands between vundle#begin/end.
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

Plugin 'VundleVim/Vundle.vim'                 " let Vundle manage Vundle.
Plugin 'gridley/serpent2vimsyntax'
Plugin 'jlconlin/ENDF.vim'
Plugin 'elementx54/moosefw_vim'
Plugin 'henrik/vim-indexed-search'            " Display number of search matches
Plugin 'morhetz/gruvbox'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'                   " plugin on GitHub repo
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'  " Git plugin not hosted on GitHub
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()            " required

" To ignore plugin indent changes, instead use:
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" PATH
" set path+=/path/to/

colorscheme gruvbox
set background=dark

let g:ycm_key_list_accept_completion = ['<C-y>']
let g:ycm_collect_identifiers_from_tags_files = 1

" python syntax check
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

