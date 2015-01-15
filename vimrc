source $VIMRUNTIME/vimrc_example.vim

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
    "Bundle 'Syntastic' "uber awesome syntax and errors highlighter
    "Bundle 'altercation/vim-colors-solarized' "T-H-E colorscheme
    "vim-fugitive' "So awesome, it should be illegal 
    Bundle 'https://github.com/tpope/vim-fugitive'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'ifdef-highlighting'
    Bundle 'Align'
    Bundle 'ctrlp.vim'
    Bundle 'bufexplorer.zip'
    Bundle 'The-NERD-tree'
    Bundle 'NERD_Tree-and-ack'
    Bundle 'gtags.vim'
    Bundle 'ack.vim'
    Bundle 'matchit.zip'
    Bundle 'genutils'
    Bundle 'multvals.vim'
    Bundle 'GrepCommands'
    Bundle 'statusline.vim'
    Bundle 'mbadran/headlights'
    Bundle 'nathanaelkane/vim-indent-guides'
    Bundle 'quickhl.vim'

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

"set viminfo+='21,nC:/vim/_viminfo
" Vim will search for the file named 'tags', starting with the current
" directory and then going to the parent directory and then recursively to the
" directory one level above, till it either locates the 'tags' file or reaches
" the root '/' directory.
set tags=tags;\
set path=.
set incsearch
set ignorecase
set smartcase
set showmatch
set scrolloff=2
set wildmode=longest,full
set columns=85
set lines=34
set hidden
set tabstop=2
set shiftwidth=2
set expandtab
set cindent
set cinoptions=(0<Enter
set nomousehide
set directory=/tmp
set guioptions+=a
set ts=4   et sw=4 nowrap
" set patchmode=.org
let g:is_bash=1
let c_space_errors=1

let g:ctrlp_root_markers = ['go','linux-centaur']
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40

let g:indent_guides_color_change_percent = 50


behave xterm
set selectmode=key
set keymodel=startsel
set bsdir=buffer
"set grepprg=/bin/grep\ -Hn
"set grepformat=%f:%l:%m
"let g:greputilsFindcmd = 'C:/bin/GnuWin32/bin/find.exe'
map <C-Up> <C-Y>
map <C-Down> <C-E>
map <F11> :set ts=4   et sw=4 nowrap<CR>
map <F12> :set ts=8 noet sw=8 nowrap<CR>
"set cscopeprg=gtags-cscope
map <F3> :NERDTreeToggle<CR>
map <F4> :NERDTreeFind<CR>
map <F5> :cp<CR>
map <M-F9> %
map! <C-F> <Esc>gUiw`]a
map ;' :%s:::cg<Left><Left><Left><Left>
vmap ;' :s:::cg<Left><Left><Left><Left>
map <M-l> V
nmap <C-PageDown> ]]
nmap <C-PageUp> [[
nmap <C-Right> w
nmap <C-Left> b
nmap <C-Insert> "+yy
nmap <S-Insert> "*P
imap <S-Insert> <C-R>*
nmap <C-Del> dw
nmap <S-Del> "+dd
nmap <C-Tab> :bnext
nmap <C-S-Tab> :bprev
nmap <C-F4> :bdelete
imap <S-Tab> <C-D>
imap <C-Del> <C-Right><C-W>
map <M-k> viw
vmap <M-k> <ESC>
" visual selection turns into thing to search for
vmap / y/<C-R>"
map _F ma[[k"xyy`a:echo @x<CR>

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
"set makeprg=make\ TARG=CFFANCI-FLASH\ ROOTDIR=/home/rbelaire/Perforce/rbelaire_onp4proxy01.ciena.com_2002/Centaur/cfFanCI\ -f/home/rbelaire/Perforce/rbelaire_onp4proxy01.ciena.com_2002/Centaur/cfFanCI/Makefiles/Makefile
"set gfn=terminus\ 16
set guifont=DejaVu\ LGC\ Sans\ Mono\ 10
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
"set guifont=Anonymous\ Pro\ 12

nnoremap @pfa       :!p4 add %<CR>:e<CR>
nnoremap @pfe       :!p4 edit %<CR>:e<CR>
nnoremap @pfd       :!p4 diff %<CR>

" CTRL+b opens the buffer list
map <C-b> <esc>:BufExplorer<cr>

nmap ,a :GNOMEAlignArguments<cr>
set wildignore+=*/build/*,*/cache/*

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <F9>     <Plug>(quickhl-manual-toggle)
xmap <F9>     <Plug>(quickhl-manual-toggle)

nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)

nmap <Space>] <Plug>(quickhl-tag-toggle)

map H <Plug>(operator-quickhl-manual-this-motion)

" Copy full filename path
" nmap cp :let @" = expand("%")
nmap cp :let @" = expand("%:p")

command! Blame execute '!p4-annotate' . ' ' . expand('%:p') . ' ' . line('.')
