" source $VIMRUNTIME/vimrc_example.vim

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
   " Add your bundles here
   Bundle 'comment.vim'
      let g:Author = 'rbelaire'
      " use .c .C to #ifdef out code
   Bundle 'tpope/vim-fugitive'
      " vimdiff current vs git head (fugitive extension)
      nnoremap @gd :Gdiff<cr>
      " switch back to current file and closes fugitive buffer
      nnoremap @gD <c-w>h<c-w>c
      " Use :Gstatus with "-" to add files to cache
      " Use :Gcommit
   " Bundle 'tpope/vim-sleuth' indent-detector is mod to be better
   Bundle 'tpope/vim-sensible'
   Bundle 'tpope/vim-scriptease'
      " Try :Verbose map
   Bundle 'tpope/vim-surround'
      " 'Hello *world!'           ds'         Hello world!
      " [123+4*56]/2              cs])        (123+456)/2
      " if *x>3 {                 ysW(        if ( x>3 ) {
   Bundle 'tpope/vim-repeat'
   Bundle 'tpope/vim-unimpaired'
      " [b ]b buffer next/previous
      " [q ]q errors next/previous
      " [f ]f file   next/previous
      " [n ]n diff   next/previous
      " [<Space> ]<Space> Add [count] blank lines above/below the cursor.
      " [e ]e Exchange the current line with [count] lines above/below it
      " [oc	]oc	coc	'cursorline'
      " [ol	]ol	col	'list'
      " [on	]on	con	'number'
      " [or	]or	cor	'relativenumber'
      " [ou	]ou	cou	'cursorcolumn'
      " [ow	]ow	cow	'wrap'
      " [ox	]ox	cox	'cursorline' 'cursorcolumn' (x as in crosshairs)
   Bundle 'tpope/vim-commentary'
      " gcc to un/comment a line
      " gc  to un/comment a motion/visual
   Bundle 'tpope/vim-vinegar'
   Bundle 'Valloric/ListToggle'
      " Location/Quick Toogle set to <leader>l and <leader>q, respectively.
   Bundle 'vivien/vim-linux-coding-style'
      let g:linuxsty_patterns = [ "/usr/src/", "/linux/", "/ko/" ]
      " or :LinuxCodingStyle
   Bundle 'Lokaltog/vim-easymotion'
      " Default Mapping      | Details
      " ---------------------|----------------------------------------------
      " <Leader>f{char}      | Find {char} to the right. See f.
      " <Leader>F{char}      | Find {char} to the left. See F.
      " <Leader>t{char}      | Till before the {char} to the right. See t.
      " <Leader>T{char}      | Till after the {char} to the left. See T.
      " <Leader>w            | Beginning of word forward. See w.
      " <Leader>W            | Beginning of WORD forward. See W.
      " <Leader>b            | Beginning of word backward. See b.
      " <Leader>B            | Beginning of WORD backward. See B.
      " <Leader>e            | End of word forward. See e.
      " <Leader>E            | End of WORD forward. See E.
      " <Leader>ge           | End of word backward. See ge.
      " <Leader>gE           | End of WORD backward. See gE.
      " <Leader>j            | Line downward. See j.
      " <Leader>k            | Line upward. See k.
      " <Leader>n            | Jump to latest "/" or "?" forward. See n.
      " <Leader>N            | Jump to latest "/" or "?" backward. See N.
      " <Leader>s            | Find(Search) {char} forward and backward
   Bundle 'ifdef-highlighting'
      "  make a '.defines' file in local folder
      " ----.defines-------
      " undefined=*
      " defined=WIN32;__MT
      " undefined=DEBUG,DBG
   Bundle 'Align'
      " \t=  : align assignments (don't count logic, like == or !=)
      " \t,  : align on commas
      " \t|  : align on vertical bars (|)
      " \tsp : align on whitespace
      " \acom : align comments
      " \adec : align C declarations (one variable per line)
      " \afnc : align ansi-style C function input arguments
   " Bundle 'w0rp/ale'
   " Bundle 'vim-indent-object'
   " Bundle 'rust-lang/rust.vim'
   Bundle 'bufexplorer.zip'
      " CTRL+b opens the buffer list
      noremap <C-b> <esc>:BufExplorer<CR>
   Bundle 'The-NERD-tree'
      noremap <F3> :NERDTreeToggle<CR>
      noremap <F4> :NERDTreeFind<CR>
   Bundle 'NERD_Tree-and-ack'
      " While in nerd, hit m to ack the folder
   " Bundle 'ack.vim'
      " :Ack pattern
   " Bundle 'matchit.zip' Included in vim 6.0
   Bundle 'genutils'
   Bundle 'ScreenShot'
      let ScreenShot = {'Title':0, 'Icon':0, 'Credits':0, 'force_background':'#FFFFFF'}
   Bundle 'multvals.vim'
   " Bundle 'GrepCommands'
      " :ArgGrep[Add][!] [{pattern}]
      " :ArgGrep[Add][!] /{pattern}/[g][j]
      "                         Search for {pattern} (or current search string if
      "                         omitted) in all files from the argument-list and set
      "                         the error list to the matches.

      " :BufGrep[Add][!] [{pattern}]
      " :BufGrep[Add][!] /{pattern}/[g][j]
      "                         Search for {pattern} (or current search string if
      "                         omitted) in all listed buffers and set the error list
      "                         to the matches.
   Bundle 'mhinz/vim-grepper'
      nnoremap <leader>g :Grepper -cword<cr>
      nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>
      nmap gs  <plug>(GrepperOperator)
      xmap gs  <plug>(GrepperOperator)
      let g:grepper = {
          \ 'tools':     ['rg', 'ack', 'grep'],
          \ 'highlight': 1,
          \ }
      autocmd FileType qf nnoremap <buffer> <cr> <cr>:cclose<cr>
   Bundle 'vim-airline/vim-airline'
   Bundle 'vim-airline/vim-airline-themes'
      let g:airline_powerline_fonts=0
      let g:airline_theme='bubblegum'
      let g:airline#extensions#hunks#enabled = 1
      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#left_sep = ' '
      let g:airline#extensions#tabline#left_alt_sep = '|'
      let g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%3p%%'.g:airline_symbols.space, 'linenr', 'maxlinenr', g:airline_symbols.space.':%5(%c%V%)'])
   " Bundle 'mbadran/headlights'
      " Informs you of all the Bundles installed
   Bundle 'nathanaelkane/vim-indent-guides'
      " plugin for visually displaying indent levels in Vim
      " Use '\ig' to toggle
      let g:indent_guides_color_change_percent = 50
   Bundle 'airblade/vim-gitgutter'
      " ]c      [c  Next/Prev Hunk
      " \hs and \hu Stage/Unstage Hunk
      " :GitGutterToggle  :GitGutterSignsToggle  :GitGutterLineHighlightsToggle
   Bundle 'luochen1990/indent-detector.vim'
      " manually patch indent_detector#search_nearby('^ [^\t \*]')
   Bundle "daylerees/colour-schemes", { "rtp": "vim/" }
   " Bundle 'wesQ3/vim-windowswap'
      " \ww then move and \ww again
   Bundle 'vim-jp/vim-cpp'
      let c_space_errors=1
   " Bundle 'godlygeek/csapprox'
   Bundle 'datsun240z/gtags-cscope'
      let GtagsCscope_Quiet=1
   Bundle 'ludovicchabant/vim-gutentags.git'
   Bundle 'datsun240z/bitbake.vim'
   Bundle 'datsun240z/GNOME-align-args'
      nmap ,a :GNOMEAlignArguments<CR>
   Bundle 'datsun240z/gtagsomnicomplete'
      autocmd FileType c set omnifunc=gtagsomnicomplete#Complete
   " Bundle 'VOoM'
   Bundle 'unblevable/quick-scope'
      " Trigger a highlight in the appropriate direction when pressing these keys:
      let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
   Bundle 'dzeban/vim-log-syntax'
   Bundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
   Bundle 'junegunn/fzf.vim'
      let g:fzf_layout = {}
      inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')
      nmap ; :Buffers<CR>
      nmap <Leader>t :Files<CR>
      nmap <Leader>r :Tags<CR>
   Bundle 'ajmwagar/vim-dues'
   Bundle 'gregsexton/gitv'
      "Type :Gitv for log
      "
      "colors dues
   " Bundle 'datsun240z/vim-colors'
   " Bundle 'yaifa.vim'
   " Bundle 'quickhl.vim'
   " Bundle 'endel/vim-github-colorscheme'
      " colorscheme github
   " Bundle 'GGalizzi/cake-vim'
      " colorscheme cake
   " Bundle 'wimstefan/Lightning'
      " colorscheme lightning
   " Bundle 'vim-scripts/beauty256'
      " colorscheme beauty256
   " Bundle 'baeuml/summerfruit256.vim'
      " colorscheme summerfruit256
   " Bundle 'tmhedberg/SimpylFold'
      " nmap <Space>m <Plug>(quickhl-manual-this)
      " xmap <Space>m <Plug>(quickhl-manual-this)
      " nmap <F9>     <Plug>(quickhl-manual-toggle)
      " xmap <F9>     <Plug>(quickhl-manual-toggle)
      " nmap <Space>M <Plug>(quickhl-manual-reset)
      " xmap <Space>M <Plug>(quickhl-manual-reset)
      " nmap <Space>j <Plug>(quickhl-cword-toggle)
      " nmap <Space>] <Plug>(quickhl-tag-toggle)
      " noremap H <Plug>(operator-quickhl-manual-this-motion)
   " Bundle 'autoload_cscope.vim'
   " Bundle 'cscope.vim'
   " Bundle 'taglist.vim'
   Bundle 'vimwiki/vimwiki'
      " let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_toc': 1 }]
      let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_toc': 1, 'syntax': 'markdown', 'ext': '.md'}]
      let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
      let g:vimwiki_url_maxsave = 0
      " nnoremap <leader>wb <Plug>VimwikiGoBackLink :VimwikiGoBackLink<CR>
      " nnoremap <leader>wb :VimwikiGoBackLink<CR>
   " Bundle 'suan/vim-instant-markdown'
      " let g:instant_markdown_autostart = 0
      " map <leader>md :InstantMarkdownPreview<CR>
   Bundle 'wikitopian/hardmode'
      nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
      let g:HardMode_level = 'wannabe'
   Bundle 'google/vim-searchindex'
      " press g/ to display search index for the last search
   Bundle 'vim-scripts/confluencewiki.vim'
   Bundle 'vim-scripts/rtorrent-syntax-file'
   Bundle 'Vimjas/vim-python-pep8-indent'
      let g:python_pep8_indent_multiline_string=-1
      " g:python_pep8_indent_multiline_string=[0|-1|-2]
      "  You can configure the initial indentation of multiline strings using
      "  g:python_pep8_indent_multiline_string (which can also be set per buffer). This
      "  defaults to 0, which means that multiline strings are not indented. -1 and
      "  positive values will be used as-is, where -1 is a special value for Vim's
      "  indentexpr, and will keep the existing indent (using Vim's autoindent
      "  setting). -2 is meant to be used for strings that are wrapped with
      "  textwrap.dedent etc. It will add a level of indentation if the multiline
      "  string started in the previous line, without any content in it already:
      " g:python_pep8_indent_hang_closing=[0|-1]
      " Control closing bracket indentation with python_pep8_indent_hang_closing

   " ...All your other bundles...
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
" colorscheme jellybeans

" set viminfo+='21,nC:/vim/_viminfo
" Vim will search for the file named 'tags', starting with the current
" directory and then going to the parent directory and then recursively to the
" directory one level above, till it either locates the 'tags' file or reaches
" the root '/' directory.
set tags=tags;/
set path=.
" set incsearch Done in sensible.vim
set hlsearch
" Make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
set showmatch
" set scrolloff=2 Done in sensible.vim
set wildmode=longest,full
" set columns=120
" set lines=34
set hidden
set number
set relativenumber
set cindent
set cinoptions+=(0
set nomousehide
set directory=/tmp
set guioptions+=a
set guioptions-=T
" set formatoptions-=t    " kill auto-wrap
" set tabstop=4 expandtab shiftwidth=4 nowrap
" set patchmode=.org
let g:is_bash=1
behave xterm
set number
set relativenumber
set selectmode=key
set keymodel=startsel
set bsdir=buffer
set t_Co=256 " 256 colors
" set grepformat=%f:%l:%m
noremap <C-Up> <C-Y>
noremap <C-Down> <C-E>
noremap <F11> :set ts=4   et sw=4 nowrap<CR>
noremap <F36> :set ts=4   et sw=4 nowrap<CR>
noremap <F12> :set ts=8 noet sw=8 nowrap<CR>
noremap <F37> :set ts=8 noet sw=8 nowrap<CR>
set cscopeprg=gtags-cscope
" set cscopetag cscopeverbose
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
onoremap af :<C-u>normal! ggVG<CR>
imap <S-Insert> <C-R>*
nmap <C-Del> dw
nmap <S-Del> "+dd
noremap <C-k>     : bnext<CR>
noremap <C-j>     : bprev<CR>
nmap <C-d>        : bdelete<CR>
noremap <C-Tab>   : bnext<CR>
noremap <C-S-Tab> : bprev<CR>
nmap <C-F4>       : bdelete<CR>
imap <S-Tab> <C-D>
imap <C-Del> <C-Right><C-W>
noremap <M-k> viw
vmap <M-k> <ESC>
" visual selection turns into thing to search for
vmap / y/<C-R>"
" Get me the function name!
noremap _F ma[[k"xyy`a:echo @x<CR>
" gq is a formatting command. It reflows and wraps the given text object
" (defaults to a single line) to the textwidth set width.
nnoremap Q gq
" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$
" Make Ctrl-e jump to the end of the current line in the insert mode. This is
" handy when you are in the middle of a line and would like to go to its end
" without switching to the normal mode.
" inoremap <C-e> <C-o>$

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
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=*.pdf,*.psd
set wildmenu

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

set clipboard=unnamed
if has('unnamedplus')
   set clipboard=unnamedplus
endif

" set iskeyword+=-

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

set ttyfast
set shortmess+=I

nnoremap <silent> <Leader>d "_d
xnoremap <silent> <Leader>d "_d

runtime! ftplugin/man.vim
if has("gui_running")
   nnoremap K :<C-U>exe "Man" v:count "<C-R><C-W>"<CR>
endif

" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

set grepprg=rg\ --vimgrep
set spelllang=en
set spellfile=$HOME/en.utf-8.add
" setlocal spell

" if has("autocmd")
"   filetype plugin indent on
" endif
