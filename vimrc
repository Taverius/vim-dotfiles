"   vim:    foldmethod=marker
" vimrc @ (c) Leonardo Valeri Manera, 2010-2019
" Contains code from Ciaran McCreesh's .vimrc
" Contains code from amix the lucky stiff's .vimrc
" Contains code from Dominique Pelle's .vimrc
" Contains code from Henning Hasemann's .vimrc
" Contains code from Matthew Woznisky's .vimrc
" Contains code from Shougo Matsushita's .vimrc
" Contains code from Eddie Blundell's .vimrc

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    set nocompatible        " Don't be compatible with Vi.

    cd $HOME

    let g:skip_loading_mswin = 1

    " if !has('gui_running')
    "     set t_Co=256
    " endif

    if v:progname =~? "evim"
        finish
    endif
endif

" Set local vimfiles directory
if has('win32') || has('win64')
    let $VIM_FILES = '~/vimfiles'
    let g:vim_files = '~/vimfiles/'
else
    let $VIM_FILES = '~/.vim'
    let g:vim_files = '~/.vim/'
endif

" Set this here so plugin autoload can use it
let mapleader = ","     " With a map leader it's possible to do extra key combinations.
let g:mapleader = ","   " like <leader>w saves the current file.

" ====================================
" ==============  Plug  ==============
" ====================================
" {{{


" Required
call plug#begin(g:vim_files . 'plugged')

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" Startify
Plug 'mhinz/vim-startify'

" Libraries
Plug 'tpope/vim-repeat'
Plug 'inkarkat/vim-visualrepeat'
Plug 'xolox/vim-misc'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neco-vim', Cond(has('python3'))
Plug 'Shougo/neco-syntax', Cond(has('python3'))
Plug 'Shougo/neoinclude.vim', Cond(has('python3'))
Plug 'roxma/vim-hug-neovim-rpc', Cond(has('python3'))
Plug 'roxma/nvim-yarp', Cond(has('python3'))

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher', Cond(has('python'))
Plug 'sgur/ctrlp-extensions.vim'
Plug 'DavidEGx/ctrlp-smarttabs'
Plug 'ompugao/ctrlp-history'
Plug 'mattn/ctrlp-mark'
Plug 'zeero/vim-ctrlp-help'
Plug 'nmanandhar/vim-ctrlp-menu'

" Undo browsers
Plug 'mbbill/undotree'

" Buffer stuff
Plug 'artnez/vim-wipeout'
Plug 'smitajit/bufutils.vim'

" Completion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-tags.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-necovim.vim', Cond(has('python3'))
Plug 'prabirshrestha/asyncomplete-necosyntax.vim', Cond(has('python3'))
Plug 'kyouryuukunn/asyncomplete-neoinclude.vim', Cond(has('python3'))

" Tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Motions
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'

" Plugins
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ciaranm/securemodelines'
Plug 'godlygeek/tabular'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-pseudocl'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'matze/vim-move'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/VimRegEx.vim'
Plug 'svermeulen/vim-easyclip'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Training
Plug 'mrmargolis/dogmatic.vim'

" Vim Lint
Plug 'dahu/VimLint'

" Filetypes
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/csv.vim'
Plug 'k-takata/vim-nsis'

" Colorscheme Utilities
Plug 'godlygeek/csapprox', Cond(!has('gui_running'))
Plug 'xolox/vim-colorscheme-switcher'
Plug 'vim-scripts/AfterColors.vim'

" Colorschemes
Plug 'danilo-augusto/vim-afterglow'
Plug 'sjl/badwolf'
Plug 'petobens/colorish'
Plug 'dracula/vim', { 'dir' : g:vim_files . 'plugged/dracula', 'as' : 'dracula.vim' }
Plug 'ajmwagar/vim-deus'
Plug 'whatyouhide/vim-gotham'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'kaicataldo/material.vim'
Plug 'crusoexia/vim-monokai'
Plug 'KeitaNakamura/neodark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/seoul256.vim'
Plug 'jacoborus/tender.vim'
Plug 'KabbAmine/yowish.vim'

" Local stuff
Plug g:vim_files . 'mine/vim-colorscheme-manager'
Plug g:vim_files . 'mine/ctrlp-colorscheme'

" Vim-DevIcons has to be loaded last
Plug 'ryanoasis/vim-devicons'

" Required
call plug#end()

" }}}

" ====================================
" ========== Simple options ==========
" ====================================
" {{{


set number              " Show line numbers.
set shiftwidth=4        " Indent 4 spaces by default.
set softtabstop=4       " Use 4 spaces instead of a Tab.
set tabstop=8           " Tabs use 8 spaces.
set shiftround          " Round indent (<,>) to multiples of 'shiftwidth'
set expandtab           " Convert tabs to spaces.
set lazyredraw          " Avoid redrawing the screen mid-command
set visualbell          " Visual bell.
set t_vb=               " Reset terminal code for visual bell.
set backspace=2         " Backspace like normal apps.
set cmdheight=2         " Set command window height to two lines.
set confirm             " Instead of failing because of unsaved changes,
                        " raise a dialogue
set mousehide           " Hide the mouse pointer while typing
set whichwrap+=b,s,<,>,h,l,[,]
                        " Make left & right wrap around lines.
set showmatch           " Highlight matching parens.
set matchtime=2         " for .2 seconds.
set matchpairs+=<:>     " Add <> to highlighted matches.
set showfulltag         " Show full tags when doing search completion.
set switchbuf=useopen,usetab
                        " Allow changing windows/tabs for quickfix/:sb/etc
set scrolloff=5         " Try to show at least three lines.
set sidescrolloff=2     " and two columns of context when scrolling.
set history=1000        " Big history.
set autoindent          " Autoindent is good.
set textwidth=0         " Don't wrap pasted text
set nostartofline       " Keep same position in line for some commands ...
set wrap                " Show long lines as wrapped.
set undolevels=10000    " 10000 undos.
set ignorecase infercase smartcase
                        " Make Vim case-insensitive but smart about it.
set hidden              " Don't complain about hiding dirty buffers.
set timeout timeoutlen=2000 ttimeoutlen=100
                        " Don't wait 1s when pressing <esc>.
set updatetime=10000    " Idle time for swapfilewrite and CursorHold trigger
set report=0            " : commands always print changed line count.
set shortmess+=aIT      " Use [+]/[RO]/[w] for modified/readonly/written.
set display=lastline,uhex
                        " Show as much as possible of last line,
                        " Show unprintable characters as <xx>.
set formatoptions+=1    " don't break a line after a 1-letter word,
                        " break before if possible
if has('patch-7.3.541')
  set formatoptions+=j  " remove comment leader when joining if sensible
endif
set nojoinspaces        " insert one space after a ./?/! with a join command
silent! set cryptmethod=blowfish2

if !isdirectory(expand(g:vim_files . 'cache/swap'))
    call mkdir(expand(g:vim_files . 'cache/swap'), 'p')
endif                   " Warn if swapdir does not exist
set directory^=$VIM_FILES/cache/swap//
" Build swap filename from path

try
    language en_GB      " Try to set language.
    language messages en_GB
catch
endtry

set fileformats=unix,dos,mac
                        " default file type.

set pastetoggle=<F1>    " F1 toggles paste mode

" }}}

" ====================================
" ======= Conditional options ========
" ====================================
" {{{

" Generic function to check if a buffer is backed by a file
function! BufferHasFileCheck()
    if has('quickfix') && &buftype =~? 'nofile'
        " Buffer is marked as not a file
        return 0
    endif
    if empty(glob(expand('%:p')))
        " File does not exist on disk
        return 0
    endif
    return 1
endfunction

" Avoid command-line redraw on every entered character by turning off Arabic
" shaping (which is implemented poorly).
if has('arabic')
    set noarabicshape
endif

if has('multi_byte')
    set encoding=utf8       " Set to UTF-8.
endif


if exists('+autochdir')
    set autochdir
endif

if has('windows')
    set showtabline=2  " Always show tab line.
endif

if has('cmdline_info')
    set ruler           " Always show cursor position.
    set showcmd         " Show us the command we're typing.
endif

if has('diff')
    set diffopt=filler,vertical
endif

if has('gui_running')
    if has('win32') || has('win64')
        " Honestly the cleanest of the lot
        " set guifont=CaskaydiaCove_NF_Mono:h13:W300
        " Self-patched with -w -s -c
        " set guifont=Consolas_NFM:h14
        " Hilarious flair. Readability might suffer a bit, but that SWAG BOII
        " set guifont=FantasqueSansMono_NFM:h14
        " I find the serifs a bit too square
        " set guifont=JetBrainsMono_NFM:h13:W300
        " Hasklug's ligatures don't seem to show on windows GUI
        " set guifont=Hasklug_NFM:h13
        " VictorMono's italic has rendering issues on windows GUI
        " set guifont=VictorMono_NFM:h14

        " Fall back onto Cascadia Code and Consolas
        set guifont=FantasqueSansMono_NFM:h14,CaskaydiaCove_NF_Mono:h13:W300,Cascadia_Code_PL:h13:W300,Consolas:h14
        set renderoptions=type:directx
    elseif has('linux')
        set guifont=Hack\ 11
        if has("gui_gtk2") || has("gui_gtk3")
            set guifont=Hack\ 11
        elseif has("gui_photon")
            set guifont=Hack:s11
        elseif has("gui_kde")
            set guifont=Hack/11/-1/5/50/0/0/0/1/0
        elseif has("x11")
            set guifont=-*-hack-medium-r-normal-*-*-180-*-*-m-*-*
        else
            set guifont=Hack:h11:cDEFAULT
        endif
    endif
    set clipboard=unnamed
                            " Clipboard is the unnamed register.

    set guioptions-=T       " Remove the toolbar
    set guioptions-=e       " Use the CUI tabline always
else
    set termencoding=utf8
    " set term=xterm
    if has('termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
    else
        set t_Co=256
    endif
    set mouse=a
    if has('win32') || has('win64')
        let &t_AB="\e[48;5;%dm"
        let &t_AF="\e[38;5;%dm"
    endif
    inoremap <Esc>[62~ <C-X><C-E>
    inoremap <Esc>[63~ <C-X><C-Y>
     noremap <Esc>[62~ <C-E>
     noremap <Esc>[63~ <C-Y>
endif

if has('folding')
    set foldenable      " Enable folding.
    set foldmethod=syntax
    set foldlevelstart=99
    set foldcolumn=2
    nnoremap <silent> <C-Space>      @=(foldlevel('.')?'za':'l')<CR>
    vnoremap <silent> <C-Space>      @=(foldlevel('.')?'za':'l')<CR>
    inoremap <silent> <C-Space> <C-o>@=(foldlevel('.')?'za':'l')<CR>

    " Don't screw up folds when inserting text that might affect them, until
    " leaving insert mode. Foldmethod is local to the window. Protect against
    " screwing up folding when switching between windows.
    augroup vimrcFoldInsert
        autocmd!
        autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
        autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
    augroup END
endif

if has('linebreak')
   set numberwidth=2    " Set minimum number column width to 1 digit + space.
   set breakindent      " every wrapped line will continue visually indented.
   set breakindentopt=sbr
                        " show 'showbreak' value before the indent
endif

if has('printing')
    set popt+=syntax:y  " Syntax when printing.
endif

if has('syntax')
    syntax on           " Syntax always on.

    augroup vimrcCursorHighlight
        autocmd!
        autocmd WinLeave * set nocursorline nocursorcolumn
        autocmd WinEnter * set cursorline cursorcolumn
    augroup END
    set cursorline
    set cursorcolumn
endif

if has('virtualedit')
    set virtualedit=block,onemore
                        " Enable virtual edit in vblock mode, and one past the end.
endif

if has('extra_search')
    set hlsearch        " Highlight search.
    set incsearch       " Incremental search.
endif

if has('insert_expand')
    set completeopt=menuone,preview,longest
endif

if has('textprop')
    set completeopt+=popup
endif

if has('wildmenu')
    set wildmenu        " Enable tab-complete menu.
    set wildmode=longest:full
endif

if has('wildignore')
    set wildoptions=fuzzy,pum
endif

if has('viminfo')
    let &viminfo="'1000,f1,h,s100,n" . g:vim_files . 'cache/viminfo'
                        " Enable a nice big viminfo file.
endif

if has('persistent_undo')
    let &undodir=expand(g:vim_files . 'cache/undo')
    if !isdirectory(&undodir)
        call mkdir(&undodir, 'p')
    endif
    set undofile
    augroup vimrcUndoFile
        autocmd!
        " Only set undofile for buffers backed by a file
        autocmd BufWritePost ?* if !BufferHasFileCheck() | setlocal noundofile | endif
        autocmd BufWinEnter  ?* if !BufferHasFileCheck() | setlocal noundofile | endif
    augroup END
endif

if has('conceal')
    set concealcursor=nc
    set conceallevel=2
endif

if has('mksession')
    let &viewdir=expand(g:vim_files . 'cache/view')
    if !isdirectory(&viewdir)
        call mkdir(&viewdir, 'p')
    endif
    set viewoptions=cursor,folds,slash,unix
    let g:skipview_files = []
    function! MakeViewCheck()
        " Filter out undesirables
        if !BufferHasFileCheck()
            " Buffer is not backed by a file
            return 0
        endif
        if len($TEMP) && expand('%:p:h') == $TEMP
            " We're in a temp dir
            return 0
        endif
        if len($TMP) && expand('%:p:h') == $TMP
            return 0
        endif
        if index(g:skipview_files, expand('%'), 0, 1) >= 0
            " File is in skip list
            return 0
        endif
        return 1
    endfunction

    " Autosave & Load Views.
    augroup vimrcAutoView
        autocmd!
        autocmd BufWritePost,BufLeave,WinLeave,FocusLost ?* if MakeViewCheck() | mkview | endif
        autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
    augroup END
endif

" When Vim loses focus, save the file
augroup vimrcSaveOnFocusLost
    autocmd!
    autocmd FocusLost * silent! :wall
augroup END

if has('win32') || has('win64')
    if executable('ctags.exe')
        let g:ctags_location = 'ctags.exe'
    else
        let g:ctags_location = expand('C:/Dev/Ctags/ctags')
    endif
else
    if executable('ctags-universal')
        let g:ctags_location = 'ctags-universal'
    elseif executable('ctags-exuberant')
        let g:ctags_location = 'ctags-exuberant'
    elseif executable('exctags')
        let g:ctags_location = 'exctags'
    else
        let g:ctags_location = 'ctags'
    endif
endif

if executable('ag')
    " The Silver Searcher
    set grepprg=ag\ --vimgrep\ -U
    set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('ack')
    " Ack
    set grepprg=ack\ -s\ -H\ --nopager\ --nocolor\ --nogroup\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('findstr')
    set grepprg=findstr\ /s\ /n\ $*\ nul
elseif executable('rg')
    " Ripgrep
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ -u
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif


" }}}

" ====================================
" =============== Maps ===============
" ====================================
" {{{

" , is mapleader, so rebind ,, to ,
nnoremap <silent> ,, ,
vnoremap <silent> ,, ,

nnoremap <silent> ;; ;
vnoremap <silent> ;; ;
nnoremap ; :
vnoremap ; :
nnoremap <M-;> ;
vnoremap <M-;> ;
nnoremap q; q:
vnoremap q; q:
                        " Pure genius.

" Let Control-S be 'save' as it is in most other editors
" Bug: this puts you into insert mode if you were in overwrite mode before
 noremap <C-s>      :w<CR>
inoremap <C-s> <C-o>:w<CR>

noremap <leader>v :e! $MYVIMRC<CR>
                        " Fast editing of the .vimrc.

" qq to record, Q to replay
nnoremap Q @q

noremap <S-cr> <Esc>
                        " Shift-Enter = ESC.

nnoremap <silent> \ :noh<CR>
                        " Clears search pattern

" Tabwidth.
map <leader>t2 :setlocal shiftwidth=2<CR>
map <leader>t4 :setlocal shiftwidth=4<CR>
map <leader>t8 :setlocal shiftwidth=8<CR>

" Pressing an 'enter visual mode' key while in visual mode changes mode.
vmap <C-V> <ESC>`<<C-v>`>
vmap V     <ESC>`<V`>
vmap v     <ESC>`<v`>

" Remove the Windows ^M - when the encodings gets messed up.
noremap <leader>M mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" This mapping allows to stay in visual mode when indenting with < and >
vnoremap > >gv
vnoremap < <gv

" These mappings are useful in long wrapped lines when pressing j or k
nnoremap <C-down> gj
nnoremap <C-up> gk

" tag movement
noremap <C-]> g<C-]>
noremap <C-g> g<C-g>

" quickfix
 noremap <leader>cc :cclose<bar>lclose<CR>
augroup vimrcQfClose
    autocmd!
    autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
augroup END

" circular window navigation
nnoremap <tab>   <C-w>w
nnoremap <S-tab> <C-w>W

" tab configuration
nnoremap <leader>tn :tabnew %<CR>
nnoremap <leader>te :tabedit
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove

" F2 -> Toggle list
 noremap <F2>      :set list!<CR>:set list?<CR>
inoremap <F2> <C-o>:set list!<CR><C-O>:set list?<CR>

if has('syntax')
    set nospell

    " Rotate through languages of spelling checker.
    let g:my_lang_codes = [ 'en_gb', 'it' ]
    if !exists('g:MY_LANG_IDX') || ( g:MY_LANG_IDX + 1 < len(g:my_lang_codes) )
        let g:MY_LANG_IDX = 0
    endif
    function! MySpellLang()
        exec "setlocal" "spelllang=".get(g:my_lang_codes, g:MY_LANG_IDX)
        let g:MY_LANG_IDX = ( g:MY_LANG_IDX + 1 < len(g:my_lang_codes) ) ? g:MY_LANG_IDX + 1 : 0
    endfunction

    " F4 -> Toggle Spellcheck
    " Control-F4 -> Cycle language
     noremap <silent>   <F4>      :setlocal spell!<CR>
    inoremap <silent>   <F4> <C-o>:setlocal spell!<CR>
     noremap <silent> <C-F4>      :call <SID>MySpellLang()<CR>
    inoremap <silent> <C-F4> <C-o>:call <SID>MySpellLang()<CR>
endif

" Function used to display syntax group.
function! SyntaxItem()
    return join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction

" <leader>syn -> show syntax group under cursor
noremap <silent> <Leader>syn :echo SyntaxItem()<CR>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" }}}

" ====================================
" =========== Window Size ============
" ====================================
" {{{

if has('gui_running')
    " GUI is running or is about to start.
    " Set GVim window to this size.
    set lines=999
    set columns=130
else
    " This is console Vim.
    if exists('+lines')
        set lines=50
    endif
    if exists('+columns')
        set columns=100
    endif
endif
"}}}

" ====================================
" =========== Colorscheme ============
" ====================================
" {{{

set background=dark

let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
let g:CSApprox_use_showrgb = 1

" }}}

" ====================================
" ============ Statusbar =============
" ====================================
" {{{

set laststatus=2

" }}}

" ====================================
" =========== Window Title ===========
" ====================================
" {{{

if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                                                " file name
    set titlestring+=%h%m%r%w                                           " flags
    set titlestring+=\ -\ %{substitute(expand(v:progname),\ '\.exe',\ '',\ '')}
                                                                        " program name
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}    " working directory
endif
" }}}

" ====================================
" ============ Linebreaks ============
" ====================================
" {{{

if has('linebreak')
    if (&termencoding ==? "utf-8") || has('gui_running')
        if has('gui_running')
            set showbreak=…
        else
            set showbreak=»
        endif
    else
        set showbreak=>
    endif
endif
" }}}

" ====================================
" Tabs, Trailing Whitespace, Fold fill
" ====================================
" {{{

if (&termencoding ==? "utf-8") || has('gui_running')
    if v:version >= 700
        if has('gui_running')
            set list listchars=tab:→\ ,trail:·,extends:…,precedes:…,nbsp:=
        else
            " XTerm + Terminus hates these.
            set list listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
        endif
    else
        set list listchars=tab:»\ ,trail:·,extends:…,precedes:…
    endif
else
    if v:version >= 700
        set list listchars=tab:>\ ,trail:.,extends:>,precedes:<,nbsp:_
    else
        set list listchars=tab:>\ ,trail:.,extends:>,precedes:<
    endif
endif

set fillchars=fold:-

" }}}

" ====================================
" ============= Filetype =============
" ====================================
" {{{

" C {{{
if has('eval')
    let g:c_gnu = 1
    let g:c_space_errors = 1
    let g:ch_syntax_for_h = 1
endif " }}}

" C# {{{
if has('eval') && has('autocmd')
    function! CSharpFold()
        setl foldmethod=marker
        setl foldmarker={,}
        function! FoldCSharp()
            return substitute(getline(v:foldstart),'{.*','{...}',)
        endfunction
        setl foldtext=FoldCSharp()
        setl foldlevelstart=2
    endfunction

    augroup vimrcCSharp
        autocmd!
        autocmd FileType cs call CSharpFold()
        autocmd FileType cs setl fen
        autocmd FileType cs setl omnifunc=syntaxcomplete#Complete
    augroup END
endif " }}}

" LISP {{{
if has('eval')
    let g:lisp_rainbow = 1
endif " }}}

" Python {{{
let g:python_highlight_all = 1
if has('eval') && has('autocmd')
    function! DeleteTrailingWS()
        exe "normal mz"
        %s/\s\+$//ge
        exe "normal `z"
    endfunction

    augroup vimrcPython
        autocmd!
        autocmd BufWrite *.py :call DeleteTrailingWS()
    augroup END
endif " }}}

" VimL {{{
if has('eval')
    if has('autocmd')
        augroup vimrcVIML
            autocmd!
            autocmd FileType vim setlocal foldmethod=marker
            autocmd FileType vim if bufname('') =~# '^\%(' . (v:version < 702 ? 'command-line' : '\[Command Line\]') . '\|option-window\)$' | setlocal nofoldenable | endif
        augroup END
    endif
endif " }}}
" }}}

" ====================================
" ============= Plug-ins =============
" ====================================
" {{{


packadd! matchit

" vim-yarp {{{
" let g:python3_host_prog = expand('C:\Dev\Python\38\python.exe')
" let g:python2_host_prog = expand('C:\Dev\Python\27\python.exe')
" }}}


" vim-plug {{{
" change how the Plug windows are opened
let g:plug_window = '-tabnew'
let g:plug_pwindow = 'vertical rightbelow new'
" }}}


" vim-airline {{{
" Enable fancy font stuff
let g:airline_powerline_fonts = 1
" Tabline
let g:airline#extensions#tabline#enabled = 1
nmap [t <Plug>AirlineSelectPrevTab
nmap ]t <Plug>AirlineSelectNextTab
" Disable some plugin integration
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
" }}}


" asynccomplete.vim {{{
" Maps
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" Sources
augroup vimrcAsyncCompleteSources
    autocmd!
    autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
    autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
                \ 'name': 'buffer',
                \ 'whitelist': ['*'],
                \ 'blacklist': ['go'],
                \ 'completor': function('asyncomplete#sources#buffer#completor'),
                \ 'config': {
                \    'max_buffer_size': 5000000,
                \  },
                \ }))
    autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
                \ 'name': 'tags',
                \ 'whitelist': ['*'],
                \ 'completor': function('asyncomplete#sources#tags#completor'),
                \ 'config': {
                \    'max_buffer_size': 5000000,
                \  },
                \ }))
    autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
                \ 'name': 'file',
                \ 'whitelist': ['*'],
                \ 'priority': 10,
                \ 'completor': function('asyncomplete#sources#file#completor'),
                \ }))
    if has('python3')
        autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
                    \ 'name': 'necosyntax',
                    \ 'whitelist': ['*'],
                    \ 'completor': function('asyncomplete#sources#necosyntax#completor'),
                    \ }))
        autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
                    \ 'name': 'necovim',
                    \ 'whitelist': ['vim'],
                    \ 'completor': function('asyncomplete#sources#necovim#completor'),
                    \ }))
        autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#neoinclude#get_source_options({
                    \ 'name': 'neoinclude',
                    \ 'whitelist': ['*'],
                    \ 'refresh_pattern': '\(<\|"\|/\)$',
                    \ 'completor': function('asyncomplete#sources#neoinclude#completor'),
                    \ }))
    endif
augroup END
" }}}


" vim-bookmarks {{{
" F5 -> Toggle Bookmark
" F6 -> Next Bookmark
" F7 -> Previous Bookmark
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_manage_per_buffer = 1
nmap <silent> <F5>      <Plug>BookmarkToggle
nmap <silent> <F6>      <Plug>BookmarkNext
nmap <silent> <F7>      <Plug>BookmarkPrev
" }}}


" bufutils.vim/vim-wipeout {{{
" Some handy mappings
nnoremap <leader>bp :BClosePreviews<CR>
nnoremap <leader>ba :BCloseAll<CR>
nnoremap <leader>bc :BCloseThis<CR>
nnoremap <leader>bw :Wipeout<CR>
" }}}


" vim-characterize {{{
" ga is used easy-align
nmap <leader>utf    <Plug>(characterize)
" }}}


" vim-colorscheme-switcher {{{
" No builtin colorschemes thanks
let g:colorscheme_switcher_exclude_builtins=1
" }}}


" vim-colorscheme-manager {{{
" Put the file in with the rest of the cache stuff
let g:colorscheme_manager_file=expand(g:vim_files . 'cache/colorscheme')
" }}}


" ctrlp.vim {{{

" When a file is already open, jump to it
let g:ctrlp_switch_buffer = 'et'

" ignore source control hidden dirs
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" MRU case insensitive
let g:ctrlp_mruf_case_sensitive = 0

" python matcher
if has('python')
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

    " Set delay to prevent extra search
    let g:ctrlp_lazy_update = 350
endif

" usercommand for VCS
let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'git --git-dir=%s ls-files -oc --exclude-standard'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ }
            \ }

if executable('fd')
    " Use fd
    let g:ctrlp_user_command.fallback = 'fd -H -t=f -c=never "" %s'

    let g:ctrlp_use_caching = 0
elseif executable('ag')
    " Use The Silver Searcher
    let g:ctrlp_user_command.fallback = 'ag %s -l --nocolor --nogroup --hidden -g ""'

    let g:ctrlp_use_caching = 0
elseif executable('rg')
    " Use Ripgrep
    let g:ctrlp_user_command.fallback = 'rg %s -l -u --color=never --smart-case -g ""'

    let g:ctrlp_use_caching = 0
endif

" register extensions
let g:ctrlp_extensions = ['dir', 'undo', 'smarttabs', 'buffertag', 'line']

" tags options
let g:ctrlp_buftag_ctags_bin = g:ctags_location

" colorscheme options
let g:ctrlp_ext_color_command = 'SwitchToColorScheme'

" binds
" <leader>lg -> Search in current buffer
noremap <silent> <leader>lg         :CtrlPLine %<CR>
" <leader>lb -> Search buffers
noremap <silent> <leader>lb         :CtrlPBuffer<CR>
" <leader>lf -> Search files
noremap <silent> <leader>lf         :CtrlP<CR>
" <leader>lr -> Search files local
noremap <silent> <leader>lr         :CtrlPCurFile<CR>
" <Leader>lt -> Search for Tags
noremap <silent> <leader>lt         :CtrlPBufTag<CR>
" <leader>ld -> Search and change working dir
noremap <silent> <leader>ld         :CtrlPDir<CR>
" <leader>lhy -> Search Yank history
noremap <silent> <leader>lhy        :CtrlPYankring<CR>
" <leader>lhs -> Search search history
noremap <silent> <leader>lhs        :CtrlPSearchHistory<CR>
" <leader>lhc -> Search command history
noremap <silent> <leader>lhc        :CtrlPCmdHistory<CR>
" <leader>lmr -> Search MRU
noremap <silent> <leader>lmr        :CtrlPMRU<CR>
" <leader>lmm -> Search CtrlP Modes
noremap <silent> <leader>lmm        :CtrlPMenu<CR>
" <leader>lmk -> Search Marks
noremap <silent> <leader>lmk        :CtrlPMark<CR>
" <leader>lmh -> Search Help
noremap <silent> <leader>lmh        :CtrlPHelp<CR>
" <leader>lmt -> Search for tabs
noremap <silent> <leader>lmt        :CtrlPSmartTabs<CR>
" <leader>lc -> Search Colorscheme
noremap <silent> <leader>lc         :CtrlPColorscheme<CR>

" }}}


" vim-signify {{{
if has('nvim') || has('patch-8.0.902')
    " default updatetime 4000ms is not good for async update
    set updatetime=100
endif
" }}}


" vim-easyclip {{{
" Easyclip masks m (create mark), remap it to gm
nnoremap gm m
" Control-v pastes in insert and command mode
 map <F1>  <Plug>EasyClipToggleFormattedPaste
imap <C-v> <Plug>EasyClipInsertModePaste
cmap <C-v> <Plug>EasyClipCommandModePaste
"}}}


" vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap ga <Plug>(EasyAlign)
" custom patterns
let g:easy_align_delimiters = {
            \ '>': { 'pattern': '>>\|=>\|>' },
            \ '\': { 'pattern': '\\' },
            \ '/': {
            \     'pattern': '//\+\|/\*\|\*/',
            \     'delimiter_align': 'l',
            \     'ignore_groups': ['!Comment']
            \   },
            \ ']': {
            \     'pattern':       '\]\zs',
            \     'left_margin':   0,
            \     'right_margin':  1,
            \     'stick_to_left': 0
            \   },
            \ ')': {
            \     'pattern':       ')\zs',
            \     'left_margin':   0,
            \     'right_margin':  1,
            \     'stick_to_left': 0
            \   },
            \ 'f': {
            \     'pattern': ' \(\S\+(\)\@=',
            \     'left_margin': 0,
            \     'right_margin': 0
            \   },
            \ 'd': {
            \     'pattern': ' \ze\S\+\s*[;=]',
            \     'left_margin': 0,
            \ 'right_margin': 0
            \   },
            \ 'n' : {
            \     'pattern' : '\(\ =\|,\)',
            \     'left_margin' : 0,
            \     'mode_sequence' : 'lr*'
            \   }
            \ }
" }}}


" echodoc.vim {{{
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'popup'

augroup vimrcEchodocHighlight
    autocmd!
    autocmd ColorScheme * highlight clear EchoDocPopup
    autocmd ColorScheme * highlight! link EchoDocPopup        Pmenu
augroup END
" }}}


" vim-sneak {{{
let g:sneak#label = 1
 map f <Plug>Sneak_f
 map F <Plug>Sneak_F
 map t <Plug>Sneak_t
 map T <Plug>Sneak_T
" }}}


" is.vim {{{
" vim-asterisk maps
 map *   <Plug>(asterisk-*)<Plug>(is-nohl-1)
 map g*  <Plug>(asterisk-g*)<Plug>(is-nohl-1)
 map #   <Plug>(asterisk-#)<Plug>(is-nohl-1)
 map g#  <Plug>(asterisk-g#)<Plug>(is-nohl-1)

 map z*  <Plug>(asterisk-z*)<Plug>(is-nohl-10)
 map gz* <Plug>(asterisk-gz*)<Plug>(is-nohl-10)
 map z#  <Plug>(asterisk-z#)<Plug>(is-nohl-10)
 map gz# <Plug>(asterisk-gz#)<Plug>(is-nohl-10)
" }}}


" vim-numbertoggle {{{
" Don't use the default binds
let g:UseNumberToggleTrigger = 0
" F3 -> Toggle relative number
 map <silent> <F3>      <Plug>NumberToggleTrigger
imap <silent> <F3> <C-o><Plug>NumberToggleTrigger
" }}}


" vim-startify {{{
" If we have UTF8 capability, use it
if has('multi_byte')
    let g:startify_fortune_use_unicode = 1
endif
let g:startify_files_number        = 8
let g:startify_session_autoload    = 0
let g:startify_session_persistence = 0
" Bookmarks, skip list, filters
let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ escape(fnamemodify($VIM_FILES, ':p:gs?\?/?'), '\') . '/plugged/.*/doc',
            \ escape(fnamemodify($VIMRUNTIME, ':p:gs?\?/?'), '\') . 'doc',
            \ escape(fnamemodify($MYVIMRC, ':p:gs?\?/?'), '\'),
            \ ]
let g:startify_bookmarks = [
            \ { 'v' : escape(fnamemodify($MYVIMRC, ':~:gs?\?/?'), '\') },
            \ ]
let g:startify_transformations = [
            \ ['.*vimrc$', 'vimrc'],
            \ ]
" Fortunes
if executable('fortune-go')
    let g:startify_custom_header_quotes = [ systemlist('fortune-go') ]
endif
" }}}


" vim-gutentags {{{
" cache files in the cache directory in vimfiles
let g:gutentags_cache_dir = expand(g:vim_files . 'cache/gutentags')
" }}}


" tagbar {{{
" <leader>ly -> TagBar
noremap <silent> <leader>ly      :TagbarToggle<CR>
let g:tagbar_ctags_bin = g:ctags_location
let g:tagbar_left = 0
let g:tagbar_width = 40
let g:tagbar_usearrows = 1
" }}}


" TOhtml {{{
let g:html_number_lines = 1
let g:html_use_css = 1
let g:html_dynamic_folds = 1
let g:html_use_encoding = 'UTF-8'
" }}}


" undotree {{{
" set layout
let g:undotree_WindowLayout = 2
" <leader>lu -> Undo
noremap <silent> U      :UndotreeToggle<CR>
" }}}


" }}}

" ====================================
" =============== Menu ===============
" ====================================
" {{{

" Main menu
if has('menu')
    " F1 -> Toggle paste
    anoremenu Vimrc.Toggle\ Paste<Tab><F1>                  :set paste!<CR>:set paste?<CR>

    " F2 -> Toggle list
    anoremenu Vimrc.Toggle\ List<Tab><F2>                   :set list!<CR>:set list?<CR>

    " F3 -> Toggle relative number
    amenu <silent> Vimrc.Toggle\ Number<Tab><F3>            <Plug>NumberToggleTrigger

    menu Vimrc.-ToggleSep- :

    if has('spell')
        " F4 -> Toggle Spellcheck
        " Control-F4 -> Cycle language
        anoremenu <silent> Vimrc.Toggle\ Spelling<Tab><F4>  :setlocal spell!<CR>
        anoremenu <silent> Vimrc.Spell\ Language<Tab><C-F4> :call MySpellLang()<CR>

        menu Vimrc.-SpellSep- :
    endif

    " F5 -> Toggle Bookmark
    " F6 -> Next Bookmark
    " F7 -> Previous Bookmark
    amenu <silent> Vimrc.Toggle\ Bookmark<Tab><F5>          <Plug>BookmarkToggle
    amenu <silent> Vimrc.Next\ Bookmark<Tab><F6>            <Plug>BookmarkNext
    amenu <silent> Vimrc.Previous\ Bookmark<Tab><F7>        <Plug>BookmarkPrev

    menu Vimrc.-BookmarkSep- :

    " U -> Undo
    noremenu <silent> Vimrc.Undo\ Tree<Tab>U                :UndotreeToggle<CR>

    " <leader>ly -> TagBar
    execute 'noremenu <silent> Vimrc.Tagbar<Tab>'.mapleader.'ly :TagbarToggle<CR>'

    " <leader>lg -> Search in current buffer
    execute 'noremenu <silent> Vimrc.CtrlP.Grep<Tab>'.mapleader.'lg :CtrlPLine %<CR>'
    " <leader>lb -> Search buffers
    execute 'noremenu <silent> Vimrc.CtrlP.Buffers<Tab>'.mapleader.'lb :CtrlPBuffer<CR>'
    " <leader>lf -> Search files
    execute 'noremenu <silent> Vimrc.CtrlP.Files<Tab>'.mapleader.'lf :CtrlP<CR>'
    " <leader>lr -> Search files local
    execute 'noremenu <silent> Vimrc.CtrlP.Local\ Files<Tab>'.mapleader.'lr :CtrlP .<CR>'
    " <leader>ll -> Search with Locate
    execute 'noremenu <silent> Vimrc.CtrlP.Locate<Tab>'.mapleader.'ll :CtrlPLocate<CR>'
    " <leader>lt -> Search for Tags
    execute 'noremenu <silent> Vimrc.CtrlP.Tags<Tab>'.mapleader.'lt :CtrlPBufTag<CR>'
    " <leader>ldh -> Search and change working dir
    execute 'noremenu <silent> Vimrc.CtrlP.Chdir<Tab>'.mapleader.'ldh :CtrlPChdir<CR>'
    " <leader>ldl -> Search and change local working dir
    execute 'noremenu <silent> Vimrc.CtrlP.LChdir<Tab>'.mapleader.'ldl :CtrlPLchdir<CR>'
    " <leader>lhy -> Search Yank history
    execute 'noremenu <silent> Vimrc.CtrlP.Yank<Tab>'.mapleader.'lhy :CtrlPYankring<CR>'
    " <leader>lhs -> Search search history
    execute 'noremenu <silent> Vimrc.CtrlP.Search<Tab>'.mapleader.'lhs :CtrlPSearchHistory<CR>'
    " <leader>lhc -> Search command history
    execute 'noremenu <silent> Vimrc.CtrlP.CMD<Tab>'.mapleader.'lhc :CtrlPCmdHistory<CR>'
    " <leader>lmr -> Search MRU
    execute 'noremenu <silent> Vimrc.CtrlP.MRU<Tab>'.mapleader.'lmr :CtrlPMRU<CR>'
    " <leader>lmm -> Search CtrlP Modes
    execute 'noremenu <silent> Vimrc.CtrlP.CtrlP<Tab>'.mapleader.'lmm :CtrlPMenu<CR>'
    " <leader>lmk -> Search Marks
    execute 'noremenu <silent> Vimrc.CtrlP.Marks<Tab>'.mapleader.'lmk :CtrlPMark<CR>'
    " <leader>lmh -> Search Help
    execute 'noremenu <silent> Vimrc.CtrlP.Help<Tab>'.mapleader.'lmh :CtrlPHelp<CR>'
    " <leader>lmt -> Search for tabs
    execute 'noremenu <silent> Vimrc.CtrlP.Tabs<Tab>'.mapleader.'lmt :CtrlPSmartTabs<CR>'
    " <leader>lc -> Search Colorscheme
    execute 'noremenu <silent> Vimrc.CtrlP.Colors<Tab>'.mapleader.'lc :CtrlPColorscheme<CR>'

    menu Vimrc.-MainMenuSep- :

    " Colorscheme submenu

    " F8 -> Next Colorscheme
    " Shift-F8 -> Previous Colorscheme
    " Control-F8 -> Random Colorscheme
    anoremenu <silent> Vimrc.Colorscheme.Next<Tab><F8>              :NextColorScheme<CR>
    anoremenu <silent> Vimrc.Colorscheme.Previous<Tab><S-F8>        :PrevColorScheme<CR>
    anoremenu <silent> Vimrc.Colorscheme.Random<Tab><C-F8>          :RandomColorScheme<CR>

    menu Vimrc.Colorscheme.-Sep- :

    " F9 -> Blacklist Colorscheme
    " Shift-F9 -> Un-Blacklist Colorscheme
    anoremenu <silent> Vimrc.Colorscheme.Blacklist<Tab><F9>         :BlacklistAddColorScheme<CR>
    anoremenu <silent> Vimrc.Colorscheme.Un-Blacklist<Tab><S-F9>    :BlacklistRemColorScheme<CR>

    menu Vimrc.-ColorschemeSep- :

    " Hidden stuff submenu

    " <leader>syn -> show syntax group under cursor
    execute 'noremenu <silent> Vimrc.Hidden.Syntax\ Group<Tab>'.mapleader.'syn :echo SyntaxItem()<CR>'

    " Windows submenu
    menu Vimrc.-WindowSep- :
    noremenu Vimrc.Window.Move\ Up<Tab><C-j> <C-W>j
    noremenu Vimrc.Window.Move\ Down<Tab><C-k> <C-W>k
    noremenu Vimrc.Window.Move\ Left<Tab><C-h> <C-W>h
    noremenu Vimrc.Window.Move\ Right<Tab><C-l> <C-W>l

    " Buffers submenu
    menu Vimrc.-BufferSep- :
    execute 'noremenu Vimrc.Buffer.Close<Tab>'.mapleader.'bd :Bclose<CR>'
    execute 'noremenu Vimrc.Buffer.Close\ All<Tab>'.mapleader.'ba :1,300 bd!<CR>'

    " Tabs submenu
    menu Vimrc.-TabSep- :
    noremenu <silent> Vimrc.Tabs.Next\ Tab<Tab><C-right> :tabnext<CR>
    noremenu <silent> Vimrc.Tabs.Previous\ Tab<Tab><C-left>  :tabprevious<CR>

    menu Vimrc.Tabs.-TabSubSep- :
    execute 'noremenu Vimrc.Tabs.New\ Tab<Tab>'.mapleader.'tn :tabnew %<CR>'
    execute 'noremenu Vimrc.Tabs.Edit\ Tab<Tab>'.mapleader.'te :tabedit'
    execute 'noremenu Vimrc.Tabs.Close\ Tab<Tab>'.mapleader.'tc :tabclose<CR>'
    execute 'noremenu Vimrc.Tabs.Move\ Tab<Tab>'.mapleader.'tm :tabmove'
    menu Vimrc.-UtilSep- :

    " Utility submenu

    " Control-S -> :w
    anoremenu Vimrc.Utility.Save<Tab><C-s>  :w<CR>
    menu Vimrc.Utility.-SaveSep- :

    " <leader>e -> Edit vimrc
    execute 'noremenu Vimrc.Utility.Edit\ Vimrc<Tab>'.mapleader.'e :e! $MYVIMRC<CR>'
    menu Vimrc.Utility.-VimrcSep- :

    " Shift-Enter -> ESC
    noremenu Vimrc.Utility.Esc<Tab><S-cr>   <Esc>
    menu Vimrc.Utility.-EscSep- :

    " \ -> Clear search highlight
    nnoremenu <silent> Vimrc.Utility.Clear\ Search<Tab>\\ :noh<CR>
    menu Vimrc.Utility.-ClearSep- :

    " Tabwidth
    " ,<leader>t(2|4|8) -> shiftwidth = (2|4|8)
    execute 'noremenu Vimrc.Utility.Tab\ Width\ 2<Tab>'.mapleader.'t2 :setlocal shiftwidth=2<CR>'
    execute 'noremenu Vimrc.Utility.Tab\ Width\ 4<Tab>'.mapleader.'t4 :setlocal shiftwidth=4<CR>'
    execute 'noremenu Vimrc.Utility.Tab\ Width\ 8<Tab>'.mapleader.'t8 :setlocal shiftwidth=8<CR>'
    menu Vimrc.Utility.-TabWitdhSep- :

    " Cope
    " <leader>cc -> Open Cope
    " <leader>cn -> Cope Next
    " <leader>cp -> Cope Previous
    execute 'noremenu Vimrc.Utility.Cope<Tab>'.mapleader.'cc :botright cope<CR>'
    execute 'noremenu Vimrc.Utility.Cope\ Previous<Tab>'.mapleader.'n :cn<CR>'
    execute 'noremenu Vimrc.Utility.Cope\ Next<Tab>'.mapleader.'p :cp<CR>'
    menu Vimrc.Utility.-CopeSep- :

    " Remove the Windows ^M - when the encodings gets messed up.
    execute 'noremenu Vimrc.Utility.Fix\ Win\ Encode<Tab>'.mapleader.'M mmHmt:%s/<C-V><CR>//ge<CR>'."'".'tzt'."'".'m'
    menu Vimrc.Utility.-EncodeSep- :

    " Menu for folding
    anoremenu <silent> Vimrc.Utility.Fold<Tab><C-Space> @=(foldlevel('.')?'za':'l')<CR>

endif

" }}}

