"""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""
""" Polyglot
" Disable polyglot for everything it will conflict on
let g:polyglot_disabled = ['py', 'markdown', 'latex']

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Hugely powerful LanguageServer/Completion/Syntax/EverythingElse plugin

Plug '907th/vim-auto-save'             " Autosave
Plug 'APZelos/blamer.nvim'             " Inline git blame
Plug 'LucHermitte/lh-brackets'         " Automatically close brackets, quotes, etc
Plug 'LucHermitte/lh-vim-lib'          " Library for lh-brackets
Plug 'Raimondi/vim_search_objects'     " Treat search matches as text objects
Plug 'Sciencentistguy/vim-monokai-pro' " Colourscheme
Plug 'Xuyuanp/nerdtree-git-plugin'     " Git status plugin for nerdtree
Plug 'airblade/vim-gitgutter'          " Git diff tracker for airline
Plug 'airblade/vim-rooter'             " cd to the root of the project, so that grepping etc works properly
Plug 'andymass/vim-matchup'            " Cleverer '%' behavior
Plug 'arthurxavierx/vim-caser'         " Easily change word casing with motions, text objects or visual mode
Plug 'chrisbra/csv.vim'                " CSV file specific commands
Plug 'ctrlpvim/ctrlp.vim'              " Fancy fuzzy finder for a whole bunch of things
Plug 'edkolev/tmuxline.vim'            " Format tmux's statusbar to look like airline
Plug 'godlygeek/tabular'               " Align stuff
Plug 'honza/vim-snippets'              " Provides python to ultisnips
Plug 'kien/rainbow_parentheses.vim'    " Rainbow Brackets
Plug 'lervag/vimtex'                   " LaTeX support
Plug 'm42e/vim-lgh'                    " Local history using git
Plug 'majutsushi/tagbar'               " Tagbar
Plug 'mattn/emmet-vim'                 " Emmet-style abbreviation expansion
Plug 'mbbill/undotree'                 " A nice undo-tree viewer
Plug 'neoclide/coc-neco'               " Viml completion source for coc.nvim
Plug 'plasticboy/vim-markdown'         " Markdown support
Plug 'rbgrouleff/bclose.vim'           " Close buffers without closing the window
Plug 'sbdchd/neoformat'                " Formatting
Plug 'scrooloose/nerdcommenter'        " Format comments properly and automatically
Plug 'scrooloose/nerdtree'             " Tree file broweser inside vim
Plug 'sheerun/vim-polyglot'            " Language profiles (syntax highlighting)
Plug 'timonv/vim-cargo'                " Cargo commands
Plug 'tjdevries/coc-zsh'               " ZSH completion source for coc
Plug 'tpope/vim-abolish'               " Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-afterimage'            " Edit things like pdfs and word docs
Plug 'tpope/vim-eunuch'                " Vim sugar for UNIX shell commands
Plug 'tpope/vim-fugitive'              " Git integration
Plug 'tpope/vim-git'                   " Filetype plugin for git files
Plug 'tpope/vim-surround'              " Simple quoting / bracketing
Plug 'tridactyl/vim-tridactyl'         " Syntax plugin for tridactylrc
Plug 'vim-airline/vim-airline'         " Fancy statusline
Plug 'vim-airline/vim-airline-themes'  " Themes for airline
call plug#end()


"""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" We don't need to show mode, airline does it for us
set noshowmode

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Colorscheme
colorscheme monokai_pro

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" :Q mapped to :q
command Q q

" VIM user interface
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in git etc anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai
set si
set wrap

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Show relative line numbers
set relativenumber
set number

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Highlight column 100
set colorcolumn=100


"""""""""""""""""""""""""""""""""""""""
" Helper functions
"""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.tex,*.md,*.vim :call CleanExtraSpaces()
endif

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

function! ToggleMouse()
    if &mouse == 'nv'
        setlocal mouse=
    else
        setlocal mouse=nv
    endif
endfunction


"""""""""""""""""""""""""""""""""""""""
" Misc Maps
"""""""""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle <cr>
nnoremap <silent> <F3> :Neoformat<cr>
vnoremap <silent> <F3> :Neoformat!
nnoremap <F4> :TagbarToggle<cr>
nnoremap <F5> :UndotreeToggle<cr>:UndotreeFocus<cr>

nnoremap mm :wa<cr> :!make -j<cr>
nnoremap mi :!make install<cr>
nnoremap mc :!make clean<cr>
nnoremap mm :wa<cr> :!make -j<cr>

nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

nnoremap <leader>L :CocList
nnoremap <leader>rg :CocList grep<cr>
nnoremap <leader>e :FZF<cr>

" Unbind keys I don't want
noremap <Up> <NOP>
noremap <Left> <NOP>
noremap <Down> <NOP>
noremap <Right> <NOP>
noremap q: <NOP>
noremap q/ <NOP>
noremap q? <NOP>
lnoremap q: <NOP>
lnoremap q/ <NOP>
lnoremap q? <NOP>
noremap Q <NOP>
noremap <F1> <NOP>
inoremap <F1> <NOP>
noremap gh h
noremap gH H
noremap <PageUp> <NOP>
noremap <PageDown> <NOP>
inoremap <PageUp> <Left>
inoremap <PageDown> <Right>
noremap H h
noremap L l

" Save and quit with ¬¬
noremap ¬¬ ZZ

" Close a buffer with ,q
noremap <leader>q :Bclose<cr>

" Make s act like d but it doesn't cut the text to a register
nnoremap s "_d
nnoremap ss "_dd
nnoremap S "_D

" Make j and k move by wrapped line, apart from when it'd break things
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<c-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Move a line of text using CTRL+ALT+[j/k]
nmap <c-m-j> mz:m+<cr>`z
nmap <c-m-k> mz:m-2<cr>`z
vmap <c-m-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <c-m-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Remap VIM 0 to first non-blank character
map 0 ^

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Spelling shortcuts
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <c-j> <c-W>j
map <c-k> <c-W>k
map <c-h> <c-W>h
map <c-l> <c-W>l

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Move between buffers
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Use ,tm to toggle mouse support
nnoremap <leader>tm :call ToggleMouse()<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Fast saving
nmap <leader>w :w!<cr>

" Y yanks to end of line, a la D
nmap Y y$

"""""""""""""""""""""""""""""""""""""""
" Misc Sets
"""""""""""""""""""""""""""""""""""""""
" Spelllang English
set spelllang=en_gb

" Enable neovim's inccommand feature
set inccommand=nosplit

" Set spellcheck on for certain filetypes
au FileType tex,markdown setlocal spell

" Conceal level 2
set conceallevel=2

" The default UpdateTime of 4000 is far too long for coc.nvim
set updatetime=300

"""""""""""""""""""""""""""""""""""""""
" Plugin Options
"""""""""""""""""""""""""""""""""""""""
""" Airline
" Enable powerline fonts to use pointy airline separators
let g:airline_powerline_fonts = 1

" Enable tabline
let g:airline#extensions#tabline#enabled = 1

" Set theme
let g:airline_theme='badwolf'

" Format airline
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'


""" Autosave
let g:auto_save = 0
augroup ft_latex
    au!
    au FileType tex let b:auto_save = 1
augroup END
let g:auto_save_events = ["InsertLeave"]


""" blamer
" Enable blamer
let g:blamer_enabled = 0
nmap <leader>bb :BlamerToggle<cr>


""" Coc.nvim
" Run snippets in visual mode with <tab>
vnoremap <tab> <Plug>(coc-snippets-select)

" Rebind vim's code navigation keys to use coc's functions
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" K will show documentation (vim's :h or LSP hover)
nnoremap <silent> K :call <SID>show_documentation()<cr>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Shift+F6 for rename current word
nmap <F18> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

imap <m-cr> <c-o>:CocAction<cr>
nmap <m-cr> :CocAction<cr>

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

 "Make <tab> and <s-tab> work like in vscode
inoremap <silent><expr> <tab>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<c-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<cr>" :
            \ <SID>check_back_space() ? "\<tab>" :
            \ coc#refresh()
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
"if exists('*complete_info')
  "inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
  "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

" Snippet "next" keybind
let g:coc_snippet_next = '<tab>'

" coc functions
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction


""" Fzf
let $FZF_DEFAULT_COMMAND='rg --files'


""" lh-brackets
let g:usemarks = 0
let b:usemarks = 0
let g:marker_define_jump_mappings = 0


""" Neoformat
" Automatically format on write
augroup fmt
    autocmd!
    au BufWritePre *.c,*.py,*.h,*.hpp,*.cpp,*.hs,*.tex try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END
autocmd FileType tex let b:autoformat_autoindent=0

" Specify custom formatters
let g:neoformat_zsh_shfmt = {
            \ 'exe': 'shfmt',
            \ 'stdin': 1,
            \ 'args': ['-i 4']
            \ }
let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8',
            \ 'args': ['--max-line-length 120', '--experimental', '-aa' ,'-'],
            \ 'stdin': 1,
            \ 'noappend': 1,
            \ }
let g:neoformat_json_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--stdin-filepath', '"%:p"', '--parser', 'json', '--tab-width 4', '--print-width 120'],
            \ 'stdin': 1,
            \ }
let g:neoformat_rust_customrustfmt = {
            \ 'exe': 'rustfmt',
            \ 'stdin': 1,
            \ 'args': ['--edition 2018'],
            \}


" Select formatters
let g:neoformat_enabled_haskell = ['ormolu']
let g:neoformat_enabled_python = ['autopep8']
let g:neoformat_enabled_zsh = ['shfmt']
let g:neoformat_enabled_rust = ['customrustfmt']



""" NERDCommenter
" Mappings
nmap  <plug>NERDCommenterToggle <cr>
vmap  <plug>NERDCommenterToggle



""" NERDTree
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ "Modified"  : "M",
            \ "Staged"    : "+",
            \ "Untracked" : "N",
            \ "Renamed"   : "R",
            \ "Unmerged"  : "=",
            \ "Deleted"   : "D",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : 'i',
            \ "Unknown"   : "?"
            \ }




""" Rainbow Parenthesis
" Enable everywhere
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

""" rooter
let g:rooter_patterns = ['.git', 'Cargo.lock', 'CMakeLists.txt', '*.cabal', 'stack.yaml']

""" vim-gitgutter
let g:gitgutter_map_keys=0


""" vim-gutentags
let g:gutentags_define_commands=1


""" vim-lgh
let g:lgh_asedir = '~/.vim/githistory'


""" Vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1


""" Vimtex
let g:tex_conceal = ""
let g:vimtex_syntax_conceal = {}
let g:vimtex_syntax_conceal_default = 0
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
            \ 'backend' : 'nvim',
            \ 'background' : 1,
            \ 'build_dir' : '/tmp/latex',
            \ 'callback' : 1,
            \ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            \ 'options' : [
            \   '-lualatex',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}
let g:vimtex_compiler_latexmk_engines = {
            \ '_'         : '-lualatex',
            \}
let g:Tex_IgnoredWarnings =
            \'Underfull'."\n".
            \'Overfull'."\n".
            \'specifier changed to'."\n".
            \'You have requested'."\n".
            \'Missing number, treated as zero.'."\n".
            \'There were undefined references'."\n".
            \'Citation %.%# undefined'."\n".
            \'Double space found.'."\n"
let g:Tex_IgnoreLevel = 8

