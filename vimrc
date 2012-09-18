" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins

runtime bundle/tpope-vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" ================ General Config ====================

set encoding=utf-8              "Use utf-8
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
"set gcr=a:blinkon0              "Disable cursor blink

set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window. 
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" turn on syntax highlighting
syntax on

" Turn on the status bar
set ruler

" Save work when tabbing away.  I think it requires gui
"au FocusLost * :wa
" sets jj to to exit insert mode
inoremap jj <ESC>

" *E*dit my *V*imrc in a split
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" *S*ource my *V*imrc
:nnoremap <leader>sv :source $MYVIMRC<cr>

" ================ Movement Config  =================
" Set tab to just to matching paren (not bound before?)
nnoremap <tab> %
vnoremap <tab> %

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set gdefault         "Default is now to chang all occurences on a line
" Use normal regexs, not vim ones
nnoremap / /\v
vnoremap / /\v
" Set <leader><space> to clear the search and highlighting
nnoremap <leader><space> :noh<cr>
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works in MacVim (gui) mode. As of 7.3 it doesn't require gui

set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set wrap       "Yes wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

" ================ Scrolling ========================

set scrolloff=8          "Start scrolling when we're 8 lines away from margins
"Yes wrap lines, so this is not needed
"set sidescrolloff=1
"set sidescroll=1


" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" ================= Math =============================
imap \alpha α
imap \beta β
imap \gamma γ
imap \delta δ
imap \epsilon ε
imap \eta η
imap \theta θ
imap \iota ι
imap \kappa κ
imap \lambda λ
imap \mu μ
imap \sigma σ
imap \in ∈
imap \forall ∀
imap \exists ∃
imap \notexists ∄

imap \RR ℝ
imap \CC ℂ

imap \scriptS 𝒮

imap \subi ᵢ
imap \sub0 ₀
imap \sub1 ₁
imap \sub2 ₂
imap \sub3 ₃
imap \sub4 ₄
imap \sub5 ₅
imap \sub6 ₆
imap \sub7 ₇
imap \sub8 ₈
imap \sub9 ₉

imap \doublearrow ⇋

" ================= Python ===========================
"
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
