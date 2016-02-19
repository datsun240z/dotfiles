"source $VIMRUNTIME/vimrc_example.vim

" Vundle Bundle START vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
set nocompatible
filetype off                   " required!

" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    "Add your bundles here
    Bundle 'tpope/vim-fugitive'
    "vimdiff current vs git head (fugitive extension)
    nnoremap @gd :Gdiff<cr>
    "switch back to current file and closes fugitive buffer
    nnoremap @gD <c-w>h<c-w>c
    "Bundle 'tpope/vim-sleuth' indent -detector is mod to be better
    Bundle 'tpope/vim-sensible'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-unimpaired'
    Bundle 'tpope/vim-commentary'
    Bundle 'vivien/vim-linux-coding-style'
    let g:linuxsty_patterns = [ "/usr/src/", "/linux" ]
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'ifdef-highlighting'
    Bundle 'Align'
    Bundle 'ctrlp.vim'
    let g:ctrlp_root_markers = ['go','oneos-linux']
    let g:ctrlp_by_filename = 1
    let g:ctrlp_regexp = 1
    let g:ctrlp_max_files = 0
    let g:ctrlp_max_depth = 40
    let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
    Bundle 'bufexplorer.zip'
    " CTRL+b opens the buffer list
    noremap <C-b> <esc>:BufExplorer<CR>
    Bundle 'The-NERD-tree'
    noremap <F3> :NERDTreeToggle<CR>
    noremap <F4> :NERDTreeFind<CR>
    Bundle 'NERD_Tree-and-ack'
    Bundle 'ack.vim'
    Bundle 'matchit.zip'
    Bundle 'genutils'
    Bundle 'multvals.vim'
    Bundle 'GrepCommands'
    Bundle 'bling/vim-airline'
    let g:airline_powerline_fonts=0
    let g:airline_theme='bubblegum'
    let g:airline#extensions#hunks#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    " Informs you of all the Bundles installed
    Bundle 'mbadran/headlights'
    " plugin for visually displaying indent levels in Vim
    Bundle 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_color_change_percent = 50
    " Tells you about changes
    Bundle 'airblade/vim-gitgutter'
    nnoremap ]d :GitGutterNextHunk<CR>
    nnoremap [d :GitGutterPrevHunk<CR>
    Bundle 'luochen1990/indent-detector.vim'
    Bundle "daylerees/colour-schemes", { "rtp": "vim/" }
    Bundle 'wesQ3/vim-windowswap'
    "\ww then move and \ww again
    Bundle 'vim-jp/vim-cpp'
    Bundle 'datsun240z/gtags-cscope'
    Bundle 'datsun240z/GNOME-align-args'
    nmap ,a :GNOMEAlignArguments<CR>
    Bundle 'datsun240z/gtagsomnicomplete'
    autocmd FileType c set omnifunc=gtagsomnicomplete#Complete
    "Bundle 'datsun240z/vim-colors'
    let c_space_errors=1
    "Bundle 'yaifa.vim'
    "Bundle 'quickhl.vim'
    "nmap <Space>m <Plug>(quickhl-manual-this)
    "xmap <Space>m <Plug>(quickhl-manual-this)
    "nmap <F9>     <Plug>(quickhl-manual-toggle)
    "xmap <F9>     <Plug>(quickhl-manual-toggle)
    "nmap <Space>M <Plug>(quickhl-manual-reset)
    "xmap <Space>M <Plug>(quickhl-manual-reset)
    "nmap <Space>j <Plug>(quickhl-cword-toggle)
    "nmap <Space>] <Plug>(quickhl-tag-toggle)
    "noremap H <Plug>(operator-quickhl-manual-this-motion)
    "Bundle 'autoload_cscope.vim'
    "Bundle 'cscope.vim'
    "Bundle 'taglist.vim'

    "...All your other bundles...
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Vundle Bundle STOP ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

" colorscheme by http://bytefluent.com/vivify/
"colorscheme jellybeans

"set viminfo+='21,nC:/vim/_viminfo
" Vim will search for the file named 'tags', starting with the current
" directory and then going to the parent directory and then recursively to the
" directory one level above, till it either locates the 'tags' file or reaches
" the root '/' directory.
set tags=tags;/
set path=.
"set incsearch Done in sensible.vim
set hlsearch
" Make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
set showmatch
"set scrolloff=2 Done in sensible.vim
set wildmode=longest,full
set columns=120
set lines=34
set hidden
set cindent
set cinoptions+=(0
set nomousehide
set directory=/tmp
set guioptions+=a
set guioptions-=T
"set formatoptions-=t    " kill auto-wrap
set tabstop=4 expandtab shiftwidth=4 nowrap
" set patchmode=.org
let g:is_bash=1
behave xterm
set selectmode=key
set keymodel=startsel
set bsdir=buffer
set t_Co=256 " 256 colors
"set grepprg=/bin/grep\ -Hn
"set grepformat=%f:%l:%m
"let g:greputilsFindcmd = 'C:/bin/GnuWin32/bin/find.exe'
noremap <C-Up> <C-Y>
noremap <C-Down> <C-E>
noremap <F11> :set ts=4   et sw=4 nowrap<CR>
noremap <F36> :set ts=4   et sw=4 nowrap<CR>
noremap <F12> :set ts=8 noet sw=8 nowrap<CR>
noremap <F37> :set ts=8 noet sw=8 nowrap<CR>
set cscopeprg=gtags-cscope
"set cscopetag cscopeverbose
noremap <F5> :cp<CR>
noremap <F6> :cn<CR>
noremap <M-F9> %
noremap! <C-F> <Esc>gUiw`]a
noremap ;' :%s:::cg<Left><Left><Left><Left>
vmap ;' :s:::cg<Left><Left><Left><Left>
noremap <M-l> V
nmap <C-PageDown> ]m
nmap <C-PageUp> [m
nmap <C-Right> w
nmap <C-Left> b
nmap <C-Insert> "+yy
nmap <S-Insert> "*P
imap <S-Insert> <C-R>*
nmap <C-Del> dw
nmap <S-Del> "+dd
noremap <C-Tab> :bnext<CR>
noremap <C-S-Tab> :bprev<CR>
nmap <C-F4> :bdelete<CR>
imap <S-Tab> <C-D>
imap <C-Del> <C-Right><C-W>
noremap <M-k> viw
vmap <M-k> <ESC>
" visual selection turns into thing to search for
vmap / y/<C-R>"
noremap _F ma[[k"xyy`a:echo @x<CR>
nnoremap Q gq

    " vim *.bin or *.exe : edit binary using xxd-format!
    augroup Binary
        au!
        au BufReadPre   *.elf,*.bin,*.exe,*.dll,*.jic let &bin=1
        au BufReadPost  *.elf,*.bin,*.exe,*.dll,*.jic if &bin | %!xxd -g1
        au BufReadPost  *.elf,*.bin,*.exe,*.dll,*.jic set ft=xxd | endif
        au BufWritePre  *.elf,*.bin,*.exe,*.dll,*.jic if &bin | %!xxd -r
        au BufWritePre  *.elf,*.bin,*.exe,*.dll,*.jic endif
        au BufWritePost *.elf,*.bin,*.exe,*.dll,*.jic if &bin | %!xxd
        au BufWritePost *.elf,*.bin,*.exe,*.dll,*.jic set nomod | endif
    augroup END

set nobackup
set writebackup
set printoptions=left:5pc,number:y,paper:letter
set nrformats=hex,alpha
set makeprg=\./go\ TARG=saos-sds\ -k\ -j16\ USE_COLOUR=n

nnoremap @pfa       :!p4 add %<CR>:e<CR>
nnoremap @pfe       :!p4 edit %<CR>:e<CR>
nnoremap @pfd       :!p4 diff %<CR>
command! Blame execute '!p4-annotate' . ' ' . expand('%:p') . ' ' . line('.')

set wildignore+=*/build/*,*/cache/*

" Copy full filename path
" nmap cp :let @" = expand("%")
" Use Ctrl+R" to paste
nmap cp :let @" = expand("%:p")

let $UNCOLOR=1

set visualbell

" To use the default key/mouse mapping:
let GtagsCscope_Auto_Map = 1
" To ignore letter case when searching:
"	let GtagsCscope_Ignore_Case = 1
" To use absolute path name:
"       let GtagsCscope_Absolute_Path = 1
" To deterring interruption:
"	let GtagsCscope_Keep_Alive = 1
" If you hope auto loading:
let GtagsCscope_Auto_Load = 1
