" vimrc @ (c) Leonardo Valeri Manera, 2010, 2014
" Contains code from Ciaran McCreesh's .vimrc
" Contains code from amix the lucky stiff's .vimrc
" Contains code from Dominique Pelle's .vimrc
" Contains code from Henning Hasemann's .vimrc
" Contains code from Matthew Woznisky's .vimrc
" Contains code from Shougo Matsushita's .vimrc
" Contains code from Eddie Blundell's .vimrc

" Is this a portable installation?
" let g:vimrc_location = fnamemodify(expand('<sfile>'), ":h")
" if exists(glob(g:vimrc_location.'\vim*'))
"     " It is, lets set some paths
"     let g:gvim_portable = 1
"     let $HOME  = g:vimrc_location
"     let $PATH += ';'.$HOME.'\curl'
"     let $PATH += ';'.$HOME.'\git'
" endif

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    set nocompatible        " Don't be compatible with Vi.

    cd $HOME

    let g:skip_loading_mswin = 1

    if !has('gui_running')
        set t_Co=256
    endif

    if v:progname =~? "evim"
        finish
    endif
endif

" Backslash to forwardslash
set shellslash

" In Windows, can't find exe, when $PATH isn't contained $VIM.
if $PATH !~? '^' . escape($VIMRUNTIME, '\\') . ';'
    let $PATH = $VIMRUNTIME.';'.$PATH
endif

" Disable built-in plugins
let g:loaded_netrwPlugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimballPlugin = 1

" Set this here so plugin autload can use it
let mapleader = ","     " With a map leader it's possible to do extra key combinations.
let g:mapleader = ","   " like <leader>w saves the current file.

" ====================================
" ==============  Plug  ==============
" ====================================
" {{{


" Required
call plug#begin('~/vimfiles/plugged')

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" Headlights
Plug 'mbadran/headlights', Cond(has('python'))

" Libraries
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/visualrepeat'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher', Cond(has('python'))
Plug 'sgur/ctrlp-extensions.vim'
Plug 'DavidEGx/ctrlp-smarttabs'
Plug 'kassio/ctrlp-bufline.vim'
Plug 'ompugao/ctrlp-history'
Plug 'mattn/ctrlp-mark'
Plug 'DeaR/ctrlp-chdir'
Plug 'hara/ctrlp-colorscheme'
Plug 'ompugao/ctrlp-locate'
Plug 'zeero/vim-ctrlp-help'
Plug 'nmanandhar/vim-ctrlp-menu'

" Undo browsers
Plug 'sjl/gundo.vim', Cond(has('python'))
Plug 'chrisbra/histwin.vim', Cond(!has('python'))

" Completion
Plug 'Shougo/neocomplete.vim', Cond(has('lua'))
Plug 'prabirshrestha/asyncomplete.vim', Cond(!has('lua'))
Plug 'Shougo/neco-syntax', Cond(!has('lua'))
Plug 'prabirshrestha/asyncomplete.vim', Cond(!has('lua'))
Plug 'prabirshrestha/asyncomplete-buffer.vim', Cond(!has('lua'))
Plug 'prabirshrestha/asyncomplete-necovim.vim', Cond(!has('lua'))
Plug 'prabirshrestha/asyncomplete-necosyntax.vim', Cond(!has('lua'))

" Tags
Plug 'diraol/vim-easytags'
Plug 'majutsushi/tagbar'

" Lightline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plugins
Plug 'ciaranm/securemodelines'
Plug 'godlygeek/tabular'
Plug 'jeetsukumaran/vim-numbertoggle'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-slash', { 'on': [], 'for': [] }
Plug 'justinmk/vim-sneak'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'matze/vim-move'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth', { 'on': [], 'for': [] }
Plug 'Raimondi/VimRegEx.vim'
Plug 'svermeulen/vim-easyclip'

" Training
Plug 'mrmargolis/dogmatic.vim'

" Vim Lint
Plug 'dahu/VimLint'

" Filetypes
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/csv.vim'
Plug 'vim-scripts/genindent.vim'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'

" Colorscheme Utilities
Plug 'godlygeek/csapprox', Cond(has('gui'))
Plug 'vim-scripts/colorsupport.vim', Cond(!has('gui'))
Plug 'xolox/vim-colorscheme-switcher'
Plug 'vim-scripts/AfterColors.vim'

" Colorschemes
Plug 'danilo-augusto/vim-afterglow'
Plug 'sjl/badwolf'
Plug 'petobens/colorish'
Plug 'blueshirts/darcula'
Plug 'dracula/vim', { 'dir' : '~/vimfiles/plugged/dracula' }
Plug 'whatyouhide/vim-gotham'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'KeitaNakamura/neodark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/seoul256.vim'
Plug 'jacoborus/tender.vim'
Plug 'chriskempson/tomorrow-theme', { 'rtp' : 'vim' }
Plug 'KabbAmine/yowish.vim'

" Local stuff
Plug '~/vimfiles/mine/vim-colorscheme-manager'
" NSIS syntax
Plug '~/vimfiles/mine/tbf-vimfiles'

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
set tabstop=8           " Tabs use 4 spaces.
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
set scrolloff=3         " Try to show at least three lines.
set sidescrolloff=2     " and two columns of context when scrolling.
set history=500         " Big history.
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
set shortmess+=a        " Use [+]/[RO]/[w] for modified/readonly/written.
set display=lastline,uhex
                        " Show as much as possible of last line,
                        " Show unprintable characters as <xx>.
" set shellxquote=""

if !isdirectory(expand('~/vimfiles/swap'))
    call mkdir(expand('~/vimfiles/swap'), 'p')
endif                   " Warn if swapdir does not exist
set directory^=~/vimfiles/swap//
                        " Build swap filename from path

try
    language en_GB      " Try to set language.
    language messages en_GB
catch
endtry

set fileformats=unix,dos,mac
                        " default file type.

" }}}

" ====================================
" ======= Conditional options ========
" ====================================
" {{{

if has('gui_running')
    augroup vimrcVisualBell
        autocmd!
        autocmd GuiEnter * :silent set t_vb=
    augroup END
endif

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

augroup vimrcCursorHighlight
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END
set cursorline
set cursorcolumn

if exists('+autochdir')
    set autochdir
endif

if has('windows')
    if !&readonly      " If we're not in RO mode ...
        set showtabline=2  " Always show tab line.
    else
        set showtabline=0
    endif
endif

if has('cmdline_info')
    set ruler           " Always show cursor position.
    set showcmd         " Show us the command we're typing.
endif

if has('gui_running')
    " set guifont=Consolas:h11
    " set guifont=Fantasque_Sans_Mono:h12
    " set guifont=Input:h11
    set guifont=Consolas_NF:h11
    " set guifont=Input_NF:h11
                            " Default font.
    set renderoptions=type:directx
    set clipboard=unnamed
                            " Clipboard is the unnamed register.

    set guioptions-=T       " Remove the toolbar
    if &readonly            " GView
        set guioptions-=m   " Remove the menu bar
    endif
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
   set numberwidth=2   " Set minimum number column width to 1 digit + space.
endif

if has('printing')
    set popt+=syntax:y  " Syntax when printing.
endif

if has('syntax')
    syntax on           " Syntax always on.
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
    set completeopt=menu,preview,longest
endif

if has('wildmenu')
    set wildmenu        " Enable tab-complete menu.
    set wildmode=longest:full
endif

if has('viminfo')
    set viminfo=!,%,'1000,/1000,:1000,f1,h,s100,n~/vimfiles/viminfo
                        " Enable a nice big viminfo file.
endif

if has('persistent_undo')
    set undodir=~/vimfiles/undo
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
    set viewdir=~/vimfiles/view
    set viewoptions=cursor,folds,slash,unix
    let g:skipview_files = [
                \ '[Vundle] Installer'
                \ ]
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

" }}}

" ====================================
" =============== Maps ===============
" ====================================
" {{{


nnoremap <silent> ;; ;
vnoremap <silent> ;; ;
nnoremap ; :
vnoremap ; :
nnoremap <A-;> ;
vnoremap <A-;> ;
nnoremap q; q:
vnoremap q; q:
                        " Pure genius.

" Let Control-S be 'save' as it is in most other editors
" Bug: this puts you into insert mode if you were in overwrite mode before
 noremap <C-s>      :w<CR>
inoremap <C-s> <C-o>:w<CR>

" :W -> :w
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
" :Q -> :q
command! -bang Q quit<bang>

noremap <leader>e :e! $MYVIMRC<CR>
                        " Fast editing of the .vimrc.

noremap <S-cr> <Esc>
                        " Shift-Enter = ESC.

nnoremap <silent> \ :noh<CR>
                        " Clears search pattern

" Tabwidth.
map <leader>t2 :setlocal shiftwidth=2<CR>
map <leader>t4 :setlocal shiftwidth=4<CR>
map <leader>t8 :setlocal shiftwidth=8<CR>

" :cope.
noremap <leader>cc :botright cope<CR>
noremap <leader>n :cn<CR>
noremap <leader>p :cp<CR>

" Remove the Windows ^M - when the encodings gets messed up.
noremap <leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" This mapping allows to stay in visual mode when indenting with < and >
vnoremap > >gv
vnoremap < <gv

" These mappings are useful in long wrapped lines when pressing j or k
nnoremap <M-j> gj
nnoremap <M-k> gk


noremap <c-]> g<c-]>
noremap <c-g> g<c-g>

" F1 -> Toggle paste
 noremap <F1>      :set paste!<CR>:set paste?<CR>
inoremap <F1> <C-o>:set paste!<CR><C-o>:set paste?<CR>

" F2 -> Toggle list
 noremap <F2>      :set list!<CR>:set list?<CR>
inoremap <F2> <C-o>:set list!<CR><C-O>:set list?<CR>

if has('spell')
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
     noremap <silent> <C-F4>      :call MySpellLang()<CR>
    inoremap <silent> <C-F4> <C-o>:call MySpellLang()<CR>
endif

" Function used to display syntax group.
function! SyntaxItem()
    return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" <leader>syn -> show syntax group under cursor
noremap <silent> <Leader>syn :echo SyntaxItem()<CR>

" Function used to display utf-8 sequence.
function! ShowUtf8Sequence()
    try
        let p = getpos('.')
        redir => utfseq
        sil normal! g8
        redir End
        call setpos('.', p)
        return substitute(matchstr(utfseq, '\x\+ .*\x'), '\<\x', '0x&', 'g')
    catch
        return '?'
    endtry
endfunction

" <leader>utf -> show uft sequence under cursor
noremap <silent> <Leader>utf :echo ShowUtf8Sequence()<CR>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann.
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction ==# 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction ==# 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction ==# 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Really useful!
" In visual mode when you press * or # to search for the current selection.
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text.
     map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
vnoremap <silent> gv :call VisualSearch('gv')<CR>

" Pressing an 'enter visual mode' key while in visual mode changes mode.
vmap <C-V> <ESC>`<<C-v>`>
vmap V     <ESC>`<V`>
vmap v     <ESC>`<v`>

" Y behaves like D rather than like dd
" nnoremap Y y$

" Smart way to move btw. windows.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer.
map <leader>bd :Bclose<CR>

" Close all the buffers.
map <leader>ba :1,300 bd!<CR>

" Use the arrows to something usefull.
map <silent> <C-right> :tabnext<CR>
map <silent> <C-left>  :tabprevious<CR>

" Tab configuration.
map <leader>tn :tabnew %<CR>
map <leader>te :tabedit
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

command! Bclose call <SID>BufcloseCloseIt()

" Specify the behavior when switching between buffers.
try
  set switchbuf=usetab
  set stal=2
catch
endtry

" }}}

" ====================================
" =========== Window Size ============
" ====================================
" {{{

if has('gui_running')
    " GUI is running or is about to start.
    " Set GVim window to this size.
    if &lines < 50
        set lines=50
    endif
    if &columns < 100
        set columns=100
    endif
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
set statusline=
set statusline+=%2*%-3.3n%0*\                   " buffer number
set statusline+=%f\                             " file name
set statusline+=%h%1*%m%r%w%0*                  " Flags.
set statusline+=\[%{strlen(&ft)?&ft:'none'},    " Filetype.
set statusline+=%{&encoding},                   " Encoding.
set statusline+=%{&fileformat}]                 " File format.
if has('eval')
    function! ColorSchemeInfo()
        return exists('g:colors_name') ? g:colors_name : 'none'
    endfunction
    set statusline+=\ %{ColorSchemeInfo()}
endif
if has('spell')
    function! SpellLangInfo()
        let l:spell_enabled = ( &spell ) ? ':e' : ':d'
        return get(g:my_lang_codes, g:MY_LANG_IDX, "none").l:spell_enabled
    endfunction
    set statusline+=\ %{SpellLangInfo()}
endif
set statusline+=%=                      " Right align.
set statusline+=%2*0x%-8B\              " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P   " Offset.

if has('autocmd')       " Special statusbar for special windows.
    function! <SID>FixMiniBufExplorerTitle()
        if "-MiniBufExplorer-" ==? bufname("%")
            setlocal statusline=%2*%-3.3n%0*
            setlocal statusline+=\[Buffers\]
            setlocal statusline+=%=%2*\ %<%P
        endif
    endfunction

    augroup vimrcStatusBar
        autocmd!
        autocmd FileType qf
                    \ if &buftype ==? "quickfix" |
                    \ setlocal statusline=%2*%-3.3n%0* |
                    \ setlocal statusline+=\ \[Compiler\ Messages\] |
                    \ setlocal statusline+=%=%2*\ %<%P |
                    \ endif

        autocmd BufWinEnter *
                    \ let oldwinnr=winnr() |
                    \ windo call <SID>FixMiniBufExplorerTitle() |
                    \ exec oldwinnr.' wincmd w'
    augroup END
endif
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

" Ruby {{{
if has('eval') && has('autocmd')
    augroup vimrcRuby
        autocmd!
        autocmd FileType ruby setl shiftwidth=2
        autocmd FileType ruby setl softtabstop=2
    augroup END
endif " }}}

" Scheme {{{
if has('eval')
    let g:is_chicken = 1
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

if has('eval')

    packadd! matchit

    let g:ctags_location = expand('C:/Dev/Ctags/ctags')


    " The Silver Searcher
    if executable('ag')
        " Use ag over grep
        set grepprg=ag\ --nogroup\ --nocolor
    endif


    " CtrlP {{{

    " When a file is already open, jump to it
    let g:ctrlp_switch_buffer = 'et'

    " ignore source control hidden dirs
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

    " MRU case insensitive
    let g:ctrlp_mruf_case_sensitive = 0

    " Use The Silver Searcher
    if executable('ag')
        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

        " ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
    endif

    " python matcher
    if has('python')
        let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
    endif

    " register extensions
    let g:ctrlp_extensions = ['undo', 'smarttabs', 'buffertag', 'tag']

    " tags options
    let g:ctrlp_buftag_ctags_bin = g:ctags_location

    " binds
    " <leader>lg -> Search in current buffer
    noremap <silent> <leader>lg         :CtrlPBufLine<CR>
    " <leader>lb -> Search buffers
    noremap <silent> <leader>lb         :CtrlPBuffer<CR>
    " <leader>lf -> Search files
    noremap <silent> <leader>lf         :CtrlP<CR>
    " <leader>lr -> Search files local
    noremap <silent> <leader>lr         :CtrlP .<CR>
    " <leader>ll -> Search with Locate
    noremap <silent> <leader>ll         :CtrlPLocate<CR>
    " <Leader>lt -> Search for Tags
    noremap <silent> <leader>lt         :CtrlPBufTag<CR>
    " <leader>ldh -> Search and change working dir
    noremap <silent> <leader>ldh        :CtrlPChdir<CR>
    " <leader>ldl -> Search and change local working dir
    noremap <silent> <leader>ldl        :CtrlPLchdir<CR>
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
    " <leader>lc -> Search Colorscheme
    noremap <silent> <leader>lc         :CtrlPColorscheme<CR>
    " <leader>ts -> Search for tabs
    noremap <silent> <leader>ts         :CtrlPSmartTabs<CR>

    " }}}


    " <leader>lu -> Undo
    if has('python')
        noremap <silent> <leader>lu      :GundoToggle<CR>
    else
        noremap <silent> <leader>lu      :Histwin<CR>
    endif


    " Echodoc
    let g:echodoc_enable_at_startup = 1


    " AsyncComplete {{{
    if !has('lua')
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
                        \ }))
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
        augroup END
    endif
    " }}}


    " NeoComplete {{{
    if has('lua')
        let g:acp_enableAtStartup = 0
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#enable_camel_case = 1

        " Set path
        let g:neocomplete#data_directory = expand('~/vimfiles/.cache/neocomplete')

        " Define dictionary.
        let g:neocomplete#sources#dictionary#dictionaries = {
                    \ 'default' : '',
                    \ 'vimshell' : $HOME.'/.vimshell_hist',
                    \ }

        " Enable omni completion.
        if !exists('g:neocomplete#sources#omni#input_patterns')
            let g:neocomplete#sources#omni#input_patterns = {}
        endif

        " Ctags
        let g:neocomplete#ctags_command = g:ctags_location

        " Key mappings
        " <CR>: close popup and save indent.
        inoremap <expr><CR>     neocomplete#close_popup() ."<CR>"
        " <TAB>: completion.
        inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h>    neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><BS>     neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>    neocomplete#close_popup()
        inoremap <expr><C-e>    neocomplete#cancel_popup()
        inoremap <expr><C-g>    neocomplete#undo_completion()
        inoremap <expr><C-l>    neocomplete#complete_common_string()
    endif
    " }}}


    " vim-bookmarks {{{
    " F5 -> Toggle Bookmark
    " F6 -> Next Bookmark
    " F7 -> Previous Bookmark
    let g:bookmark_no_default_key_mappings = 1
    let g:bookmark_manage_per_buffer = 1
    nnoremap <silent> <F5>      :BookmarkToggle<CR>
    nnoremap <silent> <F6>      :BookmarkNext<CR>
    nnoremap <silent> <F7>      :BookmarkPrev<CR>
    " }}}


    " Easytags {{{
    let g:easytags_cmd = g:ctags_location
    " async is still bork
    " let g:easytags_async = 1
    let g:easytags_ignored_filetypes = '^\(bat|vba|tex|viki\)$'
    let g:easytags_by_filetype = expand('~/vimfiles/.cache/easytags')
    let g:easytags_python_enabled = has('python')
    " }}}


    " TagBar {{{
    " <leader>lt -> TagBar
    " noremap <silent> <leader>lt      :TagbarToggle<CR>
    let g:tagbar_ctags_bin = g:ctags_location
    let g:tagbar_left = 0
    let g:tagbar_width = 40
    let g:tagbar_usearrows = 1
    " }}}


    " Shell
    let g:shell_mappings_enabled = 0


    " TOhtml {{{
    let g:html_number_lines = 1
    let g:html_use_css = 1
    let g:html_dynamic_folds = 1
    let g:html_use_encoding = 'UTF-8'
    " }}}


    " Numbertoggle
    let g:UseNumberToggleTrigger = 0
    " F3 -> Toggle relative number
     noremap <silent> <F3>      <Plug>NumberToggleTrigger
    inoremap <silent> <F3> <C-o><Plug>NumberToggleTrigger


    " Easyclip
    nnoremap gm m
    imap <c-v> <plug>EasyClipInsertModePaste


    " Sneak {{{
    " Streak
    let g:sneak#streak = 1
    nmap <Space> <Plug>(SneakStreak)
    " Highlights
    hi link SneakPluginTarget ErrorMsg
    hi link SneakPluginScope Comment
    " Repeats
    nmap <CR> <Plug>SneakNext
    xmap <CR> <Plug>SneakNext
    nmap <bs> <Plug>SneakPrevious
    xmap <bs> <Plug>SneakPrevious
    " 2-character Sneak (default)
    nmap z <Plug>Sneak_s
    nmap Z <Plug>Sneak_S
    " visual-mode
    xmap z <Plug>Sneak_s
    xmap Z <Plug>Sneak_S
    " operator-pending-mode
    omap z <Plug>Sneak_s
    omap Z <Plug>Sneak_S
    "replace 'f' with inclusive 1-char Sneak
    nmap f <Plug>Sneak_f
    nmap F <Plug>Sneak_F
    xmap f <Plug>Sneak_f
    xmap F <Plug>Sneak_F
    omap f <Plug>Sneak_f
    omap F <Plug>Sneak_F
    "replace 't' with exclusive 1-char Sneak
    nmap t <Plug>Sneak_t
    nmap T <Plug>Sneak_T
    xmap t <Plug>Sneak_t
    xmap T <Plug>Sneak_T
    omap t <Plug>Sneak_t
    omap T <Plug>Sneak_T
    " }}}


    " Easy-Align {{{
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vmap <Enter> <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
    nmap <Leader>a <Plug>(EasyAlign)
    " custom patterns
    let g:easy_align_delimiters = {
                \ 'n' : {
                \       'pattern' : '\(\ =\|,\)',
                \       'left_margin' : 0,
                \       'mode_sequence' : 'lr*'
                \   }
                \ }
    " }}}


    " Airline
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tagbar#enabled = 0
    let g:airline#extensions#wordcount#enabled = 0

endif
" }}}

" ====================================
" =============== Menu ===============
" ====================================
" {{{

" Main menu
if has('menu')
    " F1 -> Toggle paste
    anoremenu Vimrc.Toggle\ Paste<Tab><F1>      :set paste!<CR>:set paste?<CR>

    " F2 -> Toggle list
    anoremenu Vimrc.Toggle\ List<Tab><F2>      :set list!<CR>:set list?<CR>

    " F3 -> Toggle relative number
    anoremenu <silent> Vimrc.Toggle\ Number<Tab><F3> <Plug>NumberToggleTrigger

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
    anoremenu <silent> Vimrc.Toggle\ Bookmark<Tab><F5>   :BookmarkToggle<CR>
    anoremenu <silent> Vimrc.Next\ Bookmark<Tab><F6>     :BookmarkNext<CR>
    anoremenu <silent> Vimrc.Previous\ Bookmark<Tab><F7> :BookmarkPrev<CR>

    menu Vimrc.-BookmarkSep- :

    " <leader>lu -> Undo
    if has('python')
        execute 'noremenu <silent> Vimrc.Undo<Tab>'.mapleader.'lu :GundoToggle<CR>'
    else
        execute 'noremenu <silent> Vimrc.Undo<Tab>'.mapleader.'lu :Histwin<CR>'
    endif

    " <leader>lt -> TagBar
    " execute 'noremenu <silent> Vimrc.Tagbar<Tab>'.mapleader.'lt :TagbarToggle<CR>'

    " <leader>lg -> Search in current buffer
    execute 'noremenu <silent> Vimrc.CtrlP\ Grep<Tab>'.mapleader.'lg :CtrlPBufLine<CR>'
    " <leader>lb -> Search buffers
    execute 'noremenu <silent> Vimrc.CtrlP\ Buffers<Tab>'.mapleader.'lb :CtrlPBuffer<CR>'
    " <leader>lf -> Search files
    execute 'noremenu <silent> Vimrc.CtrlP\ Files<Tab>'.mapleader.'lf :CtrlP<CR>'
    " <leader>lr -> Search files local
    execute 'noremenu <silent> Vimrc.CtrlP\ Local\ Files<Tab>'.mapleader.'lr :CtrlP .<CR>'
    " <leader>ll -> Search with Locate
    execute 'noremenu <silent> Vimrc.CtrlP\ Locate<Tab>'.mapleader.'ll :CtrlPLocate<CR>'
    " <leader>lt -> Search for Tags
    execute 'noremenu <silent> Vimrc.CtrlP\ Tags<Tab>'.mapleader.'lt :CtrlPBufTag<CR>'
    " <leader>ldh -> Search and change working dir
    execute 'noremenu <silent> Vimrc.CtrlP\ Chdir<Tab>'.mapleader.'ldh :CtrlPChdir<CR>'
    " <leader>ldl -> Search and change local working dir
    execute 'noremenu <silent> Vimrc.CtrlP\ LChdir<Tab>'.mapleader.'ldl :CtrlPLchdir<CR>'
    " <leader>lhy -> Search Yank history
    execute 'noremenu <silent> Vimrc.CtrlP\ Yank<Tab>'.mapleader.'lhy :CtrlPYankring<CR>'
    " <leader>lhs -> Search search history
    execute 'noremenu <silent> Vimrc.CtrlP\ Search<Tab>'.mapleader.'lhs :CtrlPSearchHistory<CR>'
    " <leader>lhc -> Search command history
    execute 'noremenu <silent> Vimrc.CtrlP\ CMD<Tab>'.mapleader.'lhc :CtrlPCmdHistory<CR>'
    " <leader>lmr -> Search MRU
    execute 'noremenu <silent> Vimrc.CtrlP\ MRU<Tab>'.mapleader.'lmr :CtrlPMRU<CR>'
    " <leader>lmm -> Search CtrlP Modes
    execute 'noremenu <silent> Vimrc.CtrlP\ CtrlP<Tab>'.mapleader.'lmm :CtrlPMenu<CR>'
    " <leader>lmk -> Search Marks
    execute 'noremenu <silent> Vimrc.CtrlP\ Marks<Tab>'.mapleader.'lmk :CtrlPMark<CR>'
    " <leader>lmh -> Search Help
    execute 'noremenu <silent> Vimrc.CtrlP\ Help<Tab>'.mapleader.'lmh :CtrlPHelp<CR>'
    " <leader>lc -> Search Colorscheme
    execute 'noremenu <silent> Vimrc.CtrlP\ Colors<Tab>'.mapleader.'lc :CtrlPColorscheme<CR>'
    " <leader>ts -> Search for tabs
    execute 'noremenu <silent> Vimrc.CtrlP\ Tabs<Tab>'.mapleader.'ts :CtrlPSmartTabs<CR>'

    menu Vimrc.-MainMenuSep- :
endif

" Colorscheme submenu
if has('menu')
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
endif

" Hidden stuff submenu
if has('menu')
    " <leader>syn -> show syntax group under cursor
    execute 'noremenu <silent> Vimrc.Hidden.Syntax\ Group<Tab>'.mapleader.'syn :echo SyntaxItem()<CR>'

    menu Vimrc.Hidden.-UTFSeqSep- :
    " <leader>utf -> show uft sequence under cursor
    execute 'noremenu <silent> Vimrc.Hidden.Show\ UTF<Tab>'.mapleader.'utf :echo ShowUtf8Sequence()<CR>'
endif

" VimGrep submenu
if has('menu')
    menu Vimrc.-VimGrepSep- :
    execute 'menu Vimrc.VimGrep.Vim\ Grep<Tab>'.mapleader.'g :vimgrep // **/*.<left><left><left><left><left><left><left>'
    menu Vimrc.VimGrep.-VisSearchSep- :
    vnoremenu <silent> Vimrc.VimGrep.Visual\ Search\ (gv)<Tab>gv :call VisualSearch('gv')<CR>
    vnoremenu <silent> Vimrc.VimGrep.Visual\ Search\ (?)<Tab># :call VisualSearch('b')<CR>
    vnoremenu <silent> Vimrc.VimGrep.Visual\ Search\ (/)<Tab>* :call VisualSearch('f')<CR>
endif

" Windows submenu
if has('menu')
    menu Vimrc.-WindowSep- :
    menu Vimrc.Window.Move\ Up<Tab><C-j> <C-W>j
    menu Vimrc.Window.Move\ Down<Tab><C-k> <C-W>k
    menu Vimrc.Window.Move\ Left<Tab><C-h> <C-W>h
    menu Vimrc.Window.Move\ Right<Tab><C-l> <C-W>l
endif

" Buffers submenu
if has('menu')
    menu Vimrc.-BufferSep- :
    execute 'menu Vimrc.Buffer.Close<Tab>'.mapleader.'bd :Bclose<CR>'
    execute 'menu Vimrc.Buffer.Close\ All<Tab>'.mapleader.'ba :1,300 bd!<CR>'
endif

" Tabs submenu
if has('menu')
    menu Vimrc.-TabSep- :
    menu <silent> Vimrc.Tabs.Next\ Tab<Tab><C-right> :tabnext<CR>
    menu <silent> Vimrc.Tabs.Previous\ Tab<Tab><C-left>  :tabprevious<CR>

    menu Vimrc.Tabs.-TabSubSep- :
    execute 'menu Vimrc.Tabs.New\ Tab<Tab>'.mapleader.'tn :tabnew %<CR>'
    execute 'menu Vimrc.Tabs.Edit\ Tab<Tab>'.mapleader.'te :tabedit'
    execute 'menu Vimrc.Tabs.Close\ Tab<Tab>'.mapleader.'tc :tabclose<CR>'
    execute 'menu Vimrc.Tabs.Move\ Tab<Tab>'.mapleader.'tm :tabmove'
    menu Vimrc.-UtilSep- :
endif

" Utility submenu {{{
if has('menu')
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
    execute 'menu Vimrc.Utility.Tab\ Width\ 2<Tab>'.mapleader.'t2 :setlocal shiftwidth=2<CR>'
    execute 'menu Vimrc.Utility.Tab\ Width\ 4<Tab>'.mapleader.'t4 :setlocal shiftwidth=4<CR>'
    execute 'menu Vimrc.Utility.Tab\ Width\ 8<Tab>'.mapleader.'t8 :setlocal shiftwidth=8<CR>'
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
    execute 'noremenu Vimrc.Utility.Fix\ Win\ Encode<Tab>'.mapleader.'m mmHmt:%s/<C-V><CR>//ge<CR>'."'".'tzt'."'".'m'
    menu Vimrc.Utility.-EncodeSep- :

    " Menu for folding
    anoremenu <silent> Vimrc.Utility.Fold<Tab><C-Space> @=(foldlevel('.')?'za':'l')<CR>
endif " }}}



" }}}

"   vim:    foldmethod=marker
