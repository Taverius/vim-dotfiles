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

    set runtimepath+=~/vimfiles/bundle/neobundle.vim/
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
" ============ NeoBundle =============
" ====================================
" {{{


filetype off            " Required

call neobundle#begin(expand('~/vimfiles/bundle'))

" NeoBundle Cache
if neobundle#has_fresh_cache()
    NeoBundleLoadCache
else
    " Let NeoBundle manage NeoBundle
    " Required!
    NeoBundleFetch 'Shougo/neobundle.vim'

    " Headlights
    NeoBundle 'mbadran/headlights', {
                \   'disabled' : !has('python'),
                \ }

    " Libraries
    NeoBundle 'tpope/vim-repeat', {
                \   'mappings' : [
                \       [ 'n',
                \           '.',
                \           'u',
                \           'U',
                \           '<C-R>'
                \       ]
                \   ],
                \   'function_prefix' : 'repeat'
                \ }
    NeoBundle 'vim-scripts/visualrepeat'
    NeoBundle 'tomtom/tlib_vim'
    NeoBundle 'xolox/vim-misc'
    NeoBundle 'xolox/vim-shell', {
                \   'depends' : 'xolox/vim-misc'
                \ }
    NeoBundleLazy 'Shougo/context_filetype.vim'
    NeoBundle 'Shougo/vimproc.vim', {
                \   'build' :
                \       { 'windows' : 'tools/update-dll-mingw 32' }
                \ }

    " Unite
    NeoBundleLazy 'Shougo/unite.vim', {
                \   'commands' : [
                \       {
                \           'name' : 'Unite',
                \           'complete' : 'customlist,unite#complete_source'
                \       },
                \       'UniteWithCursorWord',
                \       'UniteWithInput'
                \   ]
                \ }
    NeoBundle 'Shougo/neomru.vim'
    NeoBundleLazy 'tsukkee/unite-help'
    NeoBundleLazy 'ujihisa/unite-colorscheme'
    NeoBundleLazy 'thinca/vim-unite-history', {
                \   'unite_sources' : [
                \       'history/command',
                \       'history/search'
                \   ]
                \ }
    NeoBundleLazy 'tsukkee/unite-tag', {
                \   'unite_sources' : [
                \       'tag',
                \       'tag/file',
                \       'tag/include'
                \   ]
                \ }
    NeoBundleLazy 'Shougo/echodoc.vim', {
                \   'autoload' : {
                \       'insert' : 1,
                \       'commands' : [
                \           'EchoDocEnable',
                \           'EchoDocDisable'
                \       ],
                \       'function_prefix' : 'echodoc'
                \   }
                \ }

    " Undo browsers
    NeoBundle 'sjl/gundo.vim', {
                \   'disabled' : !has('python')
                \ }
    NeoBundle 'chrisbra/histwin.vim', {
                \   'disabled' : has('python')
                \ }

    " Completion
    NeoBundleLazy 'Shougo/neocomplete.vim', {
                \   'disabled' : !has('lua'),
                \   'depends' : 'Shougo/context_filetype.vim',
                \   'autoload' : {
                \       'insert' : 1,
                \       'on_source' : 'tsukkee/unite-tag'
                \   }
                \ }
    NeoBundleLazy 'Shougo/neocomplcache.vim', {
                \   'disabled' : has('lua'),
                \   'autoload' : {
                \       'insert' : 1,
                \       'on_source' : 'tsukkee/unite-tag'
                \   }
                \ }

    " Tags
    NeoBundle 'xolox/vim-easytags', {
                \   'depends' : 'xolox/vim-shell'
                \ }
    NeoBundleLazy 'majutsushi/tagbar', {
                \   'commands' : [
                \       'Tagbar',
                \       'TagbarToggle',
                \       'TagbarOpen',
                \       'TagbarOpenAutoClose',
                \       'TagbarClose',
                \       'TagbarSetFoldlevel',
                \       'TagbarShowTag',
                \       'TagbarCurrentTag',
                \       'TagbarGetTypeConfig',
                \       'TagbarDebug',
                \       'TagbarDebugEnd',
                \       'TagbarTogglePause'
                \   ]
                \ }
    NeoBundleFetch 'jszakmeister/markdown2ctags'

    " Lightline
    NeoBundle '844196/lightline-badwolf.vim'
    NeoBundle 'itchyny/lightline.vim', {
                \   'depends' : '844196/lightline-badwolf.vim'
                \ }

    " Plugins
    NeoBundleLazy 'tpope/vim-abolish', {
                \   'depends' : 'tpope/vim-repeat',
                \   'autoload' : {
                \       'commands' : [
                \           'Abolish',
                \           'Subvert',
                \           'S'
                \       ],
                \       'mappings' : [
                \           [ 'n',
                \               'cr',
                \               '<Plug>Coerce'
                \           ]
                \       ]
                \   }
                \ }
    NeoBundle 'tpope/vim-surround', {
                \   'depends' : 'tpope/vim-repeat'
                \ }
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'tomtom/tcomment_vim'
    NeoBundleLazy 'dterei/VimBookmarking', {
                \   'commands' : [
                \       'ToggleBookmark',
                \       'ClearBookmarks',
                \       'NextBookmark',
                \       'PreviousBookmark'
                \   ]
                \ }
    NeoBundle 'junegunn/vim-easy-align', {
                \   'depends' : [
                \       'tpope/vim-repeat',
                \       'vim-scripts/visualrepeat'
                \   ]
                \ }
    NeoBundleLazy 'edsono/vim-matchit', {
                \   'commands' : 'MatchDebug',
                \   'mappings' : [
                \       '%', 'g%', '[%', ']%',
                \       [ 'v',
                \           'a%'
                \       ]
                \   ]
                \ }
    NeoBundle 'svermeulen/vim-easyclip', {
                \   'depends' : 'tpope/vim-repeat'
                \ }
    NeoBundle 'ciaranm/securemodelines'
    NeoBundle 'Raimondi/VimRegEx.vim'
    NeoBundleLazy 'justinmk/vim-sneak', {
                \   'depends' : 'tpope/vim-repeat',
                \   'autoload' : {
                \       'mappings' : [
                \           '<Plug>Sneak',
                \           '<Plug>(Sneak'
                \       ],
                \       'function_prefix' : 'sneak'
                \   }
                \ }
    NeoBundleLazy 'matze/vim-move', {
                \   'mappings' : [
                \       '<Plug>MoveBlock',
                \       '<Plug>MoveLine',
                \       [ 'vn',
                \           '<A-j>', '<A-k>'
                \       ]
                \   ]
                \ }
    NeoBundle 'jeetsukumaran/vim-numbertoggle'

    " Training
    NeoBundle 'mrmargolis/dogmatic.vim'
    NeoBundle 'takac/vim-hardtime'

    " Vim Lint
    NeoBundle 'dahu/VimLint'

    " Filetypes
    NeoBundle 'sheerun/vim-polyglot'
    NeoBundle 'mic47/KSP-Syntax'
    " NSIS
    NeoBundle 'tbf-vimfiles', {
                \   'type' : 'nosync'
                \ }
    NeoBundle 'elzr/vim-json'
    NeoBundle 'plasticboy/vim-markdown'

    " Colorscheme Utilities
    NeoBundleLazy 'godlygeek/csapprox', {
                \   'terminal' : 1,
                \   'disabled' : !has('gui')
                \ }
    NeoBundleLazy 'vim-scripts/colorsupport.vim', {
                \   'terminal' : 1,
                \   'disabled' : has('gui')
                \ }
    NeoBundle 'xolox/vim-colorscheme-switcher', {
                \   'depends' : [
                \       'xolox/vim-misc'
                \   ]
                \ }
    NeoBundle 'vim-colorscheme-manager', {
                \   'type' : 'nosync',
                \   'depends' : [
                \       'tomtom/tlib_vim',
                \       'xolox/vim-colorscheme-switcher',
                \       'vim-scripts/AfterColors.vim'
                \   ]
                \ }
    NeoBundle 'vim-scripts/AfterColors.vim'

    " Colorschemes
    NeoBundle 'sjl/badwolf', {'script_type' : 'colors'}
    NeoBundle 'mgutz/vim-colors', {'script_type' : 'colors'}
                " chance-of-storm, mudcandy
    NeoBundle 'rainux/vim-desert-warm-256', {'script_type' : 'colors'}
    NeoBundle 'biluncloud/desertEx', {'script_type' : 'colors'}
    NeoBundle 'mattsacks/vim-eddie', {'script_type' : 'colors'}
    NeoBundle 'geetarista/ego.vim', {'script_type' : 'colors'}
    NeoBundle 'petobens/heraldish', {'script_type' : 'colors'}
    NeoBundle 'nanotech/jellybeans.vim', {'script_type' : 'colors'}
    NeoBundle 'guns/jellyx.vim', {'script_type' : 'colors'}
    NeoBundle 'zeis/vim-kolor', {'script_type' : 'colors'}
    NeoBundle 'vim-scripts/Liquid-Carbon', {'script_type' : 'colors'}
    NeoBundle 'jonathanfilip/vim-lucius', {'script_type' : 'colors'}
    NeoBundle 'vim-scripts/manuscript', {'script_type' : 'colors'}
    NeoBundle 'vim-scripts/mdark.vim', {'script_type' : 'colors'}
    NeoBundle 'tomasr/molokai', {'script_type' : 'colors'}
    NeoBundle 'sickill/vim-monokai', {'script_type' : 'colors'}
    NeoBundle 'Aben/moria', {'script_type' : 'colors'}
    NeoBundle 'camelite/vim-nazca-colorscheme', {'script_type' : 'colors'}
    NeoBundle 'jeetsukumaran/vim-nefertiti', {'script_type' : 'colors'}
    NeoBundle 'vim-scripts/obsidian', {'script_type' : 'colors'}
    NeoBundle 'Taverius/openbsd.vim', {
                \   'type' : 'nosync',
                \   'script_type' : 'colors'
                \ }
    NeoBundle 'vim-scripts/pf_earth.vim', {'script_type' : 'colors'}
    NeoBundle 'Taverius/Royal-Colorschemes', {
                \   'type' : 'nosync',
                \   'script_type' : 'colors'
                \ }
    NeoBundle 'altercation/vim-colors-solarized', {'script_type' : 'colors'}
    NeoBundle 'vim-scripts/Sorcerer', {'script_type' : 'colors'}
    NeoBundle 'vim-scripts/twilight', {'script_type' : 'colors'}
    NeoBundle 'kossnocorp/up.vim', {'script_type' : 'colors'}
    NeoBundle 'shelbybark/vilight', {'script_type' : 'colors'}
    NeoBundle 'orthecreedence/void.vim', {'script_type' : 'colors'}
    NeoBundle 'vim-scripts/xorium.vim', {'script_type' : 'colors'}
    NeoBundle 'jnurmine/Zenburn', {'script_type' : 'colors'}
    NeoBundle 'vim-scripts/zenesque.vim', {'script_type' : 'colors'}

    NeoBundleSaveCache
endif

" End plugins
call neobundle#end()

"Required
filetype plugin indent on

" Prompt to install missing bundles
NeoBundleCheck


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
set shellxquote=""

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
    " set guifont=Andale_Mono:h11:cDEFAULT
    " set guifont=Anonymous_Pro:h12:cDEFAULT
    set guifont=Consolas:h11:cDEFAULT
    " set guifont=DejaVu_Sans_Mono:h11:cDEFAULT
    " set guifont=Droid_Sans_Mono_Slashed:h11:cDEFAULT
    " set guifont=Envy_Code_R:h10:cDEFAULT
    " set guifont=Terminus:h14:cDEFAULT
    " set guifont=Monofur:h14:cDEFAULT
                            " Default font.
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
        autocmd BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
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

" F3 -> Toggle relative number
 noremap <silent> <F3>      <Plug>NumberToggleTrigger
inoremap <silent> <F3> <C-o><Plug>NumberToggleTrigger

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

let g:jellyx_show_whitespace = 1
let g:moria_fontface = "mixed"
let g:moria_style = "dark"
let g:liquidcarbon_high_contrast = 1
let g:lucius_style = "dark"
let g:mochalatte_suppress_keymaps = 1
let g:solarized_termcolors = 256
let g:solarized_style = "dark"
let g:solarized_underline = 0
let g:zenesque_colors = 3

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

    " <leader>lu -> Undo
    if has('python')
        noremap <silent> <leader>lu      :GundoToggle<CR>
    else
        noremap <silent> <leader>lu      :Histwin<CR>
    endif

    let g:ctags_location = expand('C:/Dev/Ctags/ctags')


    " Echodoc
    let g:echodoc_enable_at_startup = 1


    " NeoCompl(ete|Cache) {{{
    let g:acp_enableAtStartup = 0
    if has('lua')
        " NeoComplete.vim
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#enable_camel_case = 1
        " Set path
        let g:neocomplete#data_directory = expand('~/vimfiles/.cache/neocomplete')
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
        " Enable omni completion.
        if !exists('g:neocomplete#sources#omni#input_patterns')
            let g:neocomplete#sources#omni#input_patterns = {}
        endif
        " Ctags
        let g:neocomplete#ctags_command = g:ctags_location
    else
        " NeoComplCache
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_underbar_completion = 1
        " Set path
        let g:neocomplcache_temporary_dir = expand('~/vimfiles/.cache/neocomplcache')
        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <expr><CR>     neocomplcache#close_popup() ."\<CR>"
        " <TAB>: completion.
        inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h>    neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS>     neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>    neocomplcache#close_popup()
        inoremap <expr><C-e>    neocomplcache#cancel_popup()
        " Enable omni completion.
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endi
        " Ctags
        let g:neocomplcache_ctags_program = g:ctags_location
    endif
    " }}}


    " NeoMRU
    let g:neomru#file_mru_path = expand('~/vimfiles/.cache/neomru/file')
    let g:neomru#directory_mru_path = expand('~/vimfiles/.cache/neomru/directory')


    " Bookmarking {{{
    " F5 -> Toggle Bookmark
    " F6 -> Next Bookmark
    " F7 -> Previous Bookmark
     noremap <silent> <F5>      :ToggleBookmark<CR>
    inoremap <silent> <F5> <C-o>:ToggleBookmark<CR>
     noremap <silent> <F6>      :NextBookmark<CR>
    inoremap <silent> <F6> <C-o>:NextBookmark<CR>
     noremap <silent> <F7>      :PreviousBookmark<CR>
    inoremap <silent> <F7> <C-o>:PreviousBookmark<CR>
    let g:bookmarking_menu = 0
    if has('signs')
        function! SetBookmarkStyle()
            if has('gui_running') || (&termencoding ==? 'utf-8')
                sign define bookmark text=»» texthl=SignColumn
            else
                sign define bookmark text=>> texthl=SignColumn
            endif
        endfunction
        augroup vimrcBookmarking
            autocmd!
            autocmd VimEnter * call SetBookmarkStyle()
        augroup END
    endif
    " }}}


    " Easytags {{{
    let g:easytags_cmd = g:ctags_location
    " let g:easytags_ctags_version = '5.8'
    " let g:easytags_suppress_ctags_warning = 1
    let g:easytags_ignored_filetypes = '^\(bat|vba|tex|viki\)$'
    let g:easytags_by_filetype = expand('~/vimfiles/.cache/easytags')
    let g:easytags_python_enabled = has('python')
    " }}}


    " TagBar {{{
    " <leader>lt -> TagBar
    noremap <silent> <leader>lt      :TagbarToggle<CR>
    let g:tagbar_ctags_bin = g:ctags_location
    let g:tagbar_left = 0
    let g:tagbar_width = 40
    let g:tagbar_usearrows = 1
    if has('python')
        let g:tagbar_type_markdown = {
                    \ 'ctagstype': 'markdown',
                    \ 'ctagsbin' : expand('~/vimfiles/bundles/markdown2ctags/markdown2ctags.py'),
                    \ 'ctagsargs' : '-f - --sort=yes',
                    \ 'kinds' : [
                    \   's:sections',
                    \   'i:images'
                    \ ],
                    \ 'sro' : '|',
                    \ 'kind2scope' : {
                    \   's' : 'section',
                    \ },
                    \ 'sort': 0,
                    \ }
    endif
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
    nmap s <Plug>Sneak_s
    nmap S <Plug>Sneak_S
    " visual-mode
    xmap s <Plug>Sneak_s
    xmap S <Plug>Sneak_S
    " operator-pending-mode
    omap s <Plug>Sneak_s
    omap S <Plug>Sneak_S
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
    " }}}


    " Hardtime {{{
    let g:hardtime_default_on = 1
    let g:list_of_normal_keys = [ "h", "j", "k", "l", "-", "+" ]
    let g:list_of_visual_keys = []
    let g:hardtime_allow_different_key = 1
    let g:hardtime_maxcount = 2
    let g:hardtime_ignore_buffer_patterns = [
                \ '__Tagbar__',
                \ '__Gundo__',
                \ 'Undo_Tree'
                \ ]
    " }}}


    " Lightline {{{
    let g:lightline = {
                \ 'colorscheme': 'badwolf',
                \ 'mode_map': { 'c': 'NORMAL' },
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
                \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'colorschemeinfo', 'spellinfo', 'fileformat', 'fileencoding', 'filetype' ] ]
                \ },
                \ 'component_function': {
                \   'modified': 'MyModified',
                \   'readonly': 'MyReadonly',
                \   'fugitive': 'MyFugitive',
                \   'filename': 'MyFilename',
                \   'fileformat': 'MyFileformat',
                \   'filetype': 'MyFiletype',
                \   'fileencoding': 'MyFileencoding',
                \   'colorschemeinfo': 'MyColorscheme',
                \   'spellinfo': 'MySpell',
                \   'mode': 'MyMode'
                \ },
                \ 'separator': { 'left': '', 'right': '' },
                \ 'subseparator': { 'left': '|', 'right': '|' }
                \ }

    let g:lightline_modro_exclude = 'help\|gundo'

    function! MyModified()
        return &ft =~ g:lightline_modro_exclude ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! MyReadonly()
        return &ft !~? g:lightline_modro_exclude && &readonly ? 'x' : ''
    endfunction

    function! MyFilename()
        let l:fname = expand('%:t')
        return l:fname == '__Tagbar__' ? g:lightline.fname :
             \ l:fname =~ '__Gundo' ? '' :
             \ l:fname == 'Undo_Tree' ? '' :
             \ &ft == 'unite' ? unite#get_status_string() :
             \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
             \ ('' != fname ? fname : '[No Name]') .
             \ ('' != MyModified() ? ' ' . MyModified() : '')
    endfunction

    function! MyFugitive()
        let l:fnamex = 'Tagbar\|Gundo\|Undo_Tree'
        let l:ftypex = 'vimfiler'
        try
            if expand('%:t') !~? l:fnamex && &ft !~? l:ftypex && exists('*fugitive#head')
                let mark = ''  " edit here for cool mark
                let _ = fugitive#head()
                return strlen(_) ? mark._ : ''
            endif
        catch
        endtry
        return ''
    endfunction

    function! MyFileformat()
        return winwidth(0) > 70 ? &fileformat : ''
    endfunction

    function! MyFiletype()
        return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
    endfunction

    function! MyFileencoding()
        return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
    endfunction

    function! MyMode()
        let l:fname = expand('%:t')
        return l:fname == '__Tagbar__' ? 'Tagbar' :
             \ l:fname == 'Undo_Tree' ? 'Undo' :
             \ l:fname == '__Gundo__' ? 'Gundo' :
             \ l:fname == '__Gundo_Preview__' ? 'Gundo Preview' :
             \ &ft == 'unite' ? 'Unite' :
             \ winwidth(0) > 60 ? lightline#mode() : ''
    endfunction

    function! MyColorscheme()
        return winwidth(0) > 90 ? (exists('g:colors_name') ? g:colors_name : '') : ''
    endfunction

    function! MySpell()
        if has('spell')
            let l:spell_enabled = ( &spell ) ? ':e' : ':d'
            return winwidth(0) > 80 ? (get(g:my_lang_codes, g:MY_LANG_IDX, "none").l:spell_enabled) : ''
        endif
        return ''
    endfunction

    let g:tagbar_status_func = 'TagbarStatusFunc'

    function! TagbarStatusFunc(current, sort, fname, ...) abort
        let g:lightline.fname = a:fname
        return lightline#statusline(0)
    endfunction
    " }}}


    " Unite {{{
    let g:unite_enable_start_insert = 1
    let g:unite_split_rule = "botright"
    let g:unite_winheight = 10
    let g:unite_data_directory = expand('~/vimfiles/.cache/unite')
    let g:unite_force_overwrite_statusline = 0
    if has('gui_running') || (&termencoding ==? 'utf-8')
        let g:unite_prompt='» '
    endif
    " Source options
    let g:unite_source_history_yank_enable = 1
    let g:unite_colorscheme_command = 'SwitchToColorScheme'
    " Use the fuzzy matcher for everything
    " call unite#filters#matcher_default#use(['matcher_fuzzy'])
    " Use the rank sorter for everything
    " call unite#filters#sorter_default#use(['sorter_rank'])
    " Filter .dotfiles and such
    " call unite#custom_source('file_rec,file_rec/async,grep',
    " call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
    "                 \   'ignore_pattern', join([
    "                 \       '/\.[^\.]\+/',
    "                 \ ], '\|'))
    " let g:unite_source_rec_async_command = expand('C:/Dev/GnuWin32/bin-find/find.exe')
    " Use ag for search
    if executable('ag')
        let g:unite_source_rec_async_command = 'ag --follow --nocolor --nogroup -g ""'
        let g:unite_source_grep_command = 'ag'
        let g:unite_source_grep_default_opts =
                    \ '-i --line-numbers --nocolor --nogroup'
        let g:unite_source_grep_recursive_opt = ''
    endif

    " <leader>lg -> Grep
    noremap <silent> <leader>lg         :Unite grep:.<CR>
    " <leader>lb -> Buffer
    noremap <silent> <leader>lb         :Unite buffer<CR>
    " <leader>lf -> File
    if executable(g:unite_source_rec_async_command)
        noremap <silent> <leader>lf     :Unite file_rec/async<CR>
    else
        noremap <silent> <leader>lf     :Unite file_rec<CR>
    endif
    " <leader>lmf -> MRU File
    noremap <silent> <leader>lmf        :Unite neomru/file<CR>
    " <leader>lmd -> MRU Directory
    noremap <silent> <leader>lmd        :Unite neomru/directory<CR>
    " <leader>lhy -> Yank History
    noremap <silent> <leader>lhy        :Unite history/yank<CR>
    " <leader>lhs -> Search History
    noremap <silent> <leader>lhs        :Unite history/search<CR>
    " <leader>lhc -> Command History
    noremap <silent> <leader>lhc        :Unite history/command<CR>
    " <leader>lc -> Colorscheme
    noremap <silent> <leader>lc         :Unite colorscheme -auto-preview<CR>

    augroup vimrcUniteSettings
        autocmd!
        autocmd FileType unite call s:unite_my_settings()
    augroup END
    function! <SID>UniteReverseFilters()
        let l:reverse = 'sorter_reverse'
        let l:filters = unite#mappings#get_current_filters()
        if index(l:filters, l:reverse) == -1
            call add(l:filters, l:reverse)
        else
            call filter(l:filters, 'v:val != '.l:reverse)
        endif
        call unite#mappings#set_current_filters(l:filters)
    endfunction
    function! s:unite_my_settings()
        imap <buffer> <C-j> <Plug>(unite_select_next_line)
        imap <buffer> <C-k> <Plug>(unite_select_previous_line)
        imap <silent><buffer><expr> <C-x> unite#do_action('split')
        imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
        imap <buffer> <S-CR> <Plug>(unite_quick_match_choose_action)
        imap <silent><buffer> <C-s> <C-o>:call <SID>UniteReverseFilters()<CR>

        nmap <buffer> <ESC> <Plug>(unite_exit)
    endfunction
    " }}}

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
    anoremenu <silent> Vimrc.Toggle\ Bookmark<Tab><F5>   :ToggleBookmark<CR>
    anoremenu <silent> Vimrc.Next\ Bookmark<Tab><F6>     :NextBookmark<CR>
    anoremenu <silent> Vimrc.Previous\ Bookmark<Tab><F7> :PreviousBookmark<CR>

    menu Vimrc.-BookmarkSep- :

    " <leader>lt -> TagBar
    execute 'noremenu <silent> Vimrc.Tagbar<Tab>'.mapleader.'lt :TagbarToggle<CR>'

    " <leader>lu -> Undo
    if has('python')
        execute 'noremenu <silent> Vimrc.Undo<Tab>'.mapleader.'lu :GundoToggle<CR>'
    else
        execute 'noremenu <silent> Vimrc.Undo<Tab>'.mapleader.'lu :Histwin<CR>'
    endif

    " Unite.vim
    " <leader>lg -> Grep
    execute 'noremenu <silent> Vimrc.Unite\ Grep<Tab>'.mapleader.'lg :Unite grep:.<CR>'
    " <leader>lb -> Buffer
    execute 'noremenu <silent> Vimrc.Unite\ Buffer<Tab>'.mapleader.'lb :Unite buffer<CR>'
    " <leader>lf -> File
    if executable(g:unite_source_rec_async_command)
        execute 'noremenu <silent> Vimrc.Unite\ File<Tab>'.mapleader.'lf :Unite file_rec/async<CR>'
    else
        execute 'noremenu <silent> Vimrc.Unite\ File<Tab>'.mapleader.'lf :Unite file_rec<CR>'
    endif
    " <leader>lmf -> MRU File
    execute 'noremenu <silent> Vimrc.Unite\ MRU\ File<Tab>'.mapleader.'lmf :Unite neomru/file<CR>'
    " <leader>lmd -> MRU Directory
    execute 'noremenu <silent> Vimrc.Unite\ MRU\ Directory<Tab>'.mapleader.'lmd :Unite neomru/directory<CR>'
    " <leader>lhy -> Yank History
    execute 'noremenu <silent> Vimrc.Unite\ Yank\ History<Tab>'.mapleader.'lhy :Unite history/yank<CR>'
    " <leader>lhs -> Search History
    execute 'noremenu <silent> Vimrc.Unite\ Search\ History<Tab>'.mapleader.'lhs :Unite history/search<CR>'
    " <leader>lhc -> Command History
    execute 'noremenu <silent> Vimrc.Unite\ Command\ History<Tab>'.mapleader.'lhc :Unite history/command<CR>'
    " <leader>lc -> Colorscheme
    execute 'noremenu <silent> Vimrc.Unite\ Colorschemes<Tab>'.mapleader.'lc :Unite colorscheme -auto-preview<CR>'

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
