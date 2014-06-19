" _vimrc @ (c) Leonardo Valeri Manera, 2010, 2014
" Contains code from Ciaran McCreesh's .vimrc
" Contains code from amix the lucky stiff's .vimrc
" Contains code from Dominique Pelle's .vimrc
" Contains code from Henning Hasemann's .vimrc
" Contains code from Matthew Woznisky's .vimrc

" Is this a portable installation?
" let g:vimrc_location = fnamemodify(expand('<sfile>'), ":h")
" if exists(glob(g:vimrc_location.'\vim*'))
"     " It is, lets set some paths
"     let g:gvim_portable = 1
"     let $HOME  = g:vimrc_location
"     let $PATH += ';'.$HOME.'\curl'
"     let $PATH += ';'.$HOME.'\git'
" endif

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

" *************** "
"     Vundle      "
" *************** "

filetype off            " Required

call neobundle#begin(expand('~/vimfiles/bundle'))

" Let NeoBundle manage NeoBundle
" Required!
NeoBundleFetch 'Shougo/neobundle.vim'

" Headlights
if has('python')
    NeoBundle 'mbadran/headlights'
else
    NeoBundleFetch 'mbadran/headlights'
endif

" Libraries
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-shell'

" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'thinca/vim-unite-history'
let g:loaded_netrwPlugin = "0"

" VimProc
NeoBundle 'Shougo/vimproc.vim',
            \ { 'build':
            \   { 'windows': 'tools\\update-dll-mingw 32' }
            \ }

" Undo browsers
if has('python')
    NeoBundle 'sjl/gundo.vim'
    NeoBundleFetch 'chrisbra/histwin.vim'
else
    NeoBundleFetch 'sjl/gundo.vim'
    NeoBundle 'chrisbra/histwin.vim'
endif

" Completion
if has('lua')
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundleFetch 'Shougo/neocomplcache.vim'
else
    NeoBundleFetch 'Shougo/neocomplete.vim'
    NeoBundle 'Shougo/neocomplcache.vim'
endif

" Tags
NeoBundle 'xolox/vim-easytags'
NeoBundle 'majutsushi/tagbar'
NeoBundleFetch 'jszakmeister/markdown2ctags',
            \ { 'type': 'nosync' }

" Lightline
NeoBundle 'itchyny/lightline.vim'
NeoBundle '844196/lightline-badwolf.vim'

" Plugins
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'dterei/VimBookmarking'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'svermeulen/vim-easyclip'
NeoBundle 'ciaranm/securemodelines'
NeoBundle 'Raimondi/VimRegEx.vim'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'matze/vim-move'
NeoBundle 'jeetsukumaran/vim-numbertoggle'

" Training
NeoBundle 'mrmargolis/dogmatic.vim'
NeoBundle 'takac/vim-hardtime'

" Vim Lint
NeoBundleLazy 'dahu/VimLint'

" Syntax/Indent
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'mic47/KSP-Syntax'
NeoBundle 'vim-scripts/NSIS-syntax-highlighting'

" Colorscheme Utilities
NeoBundle 'godlygeek/csapprox'
NeoBundle 'vim-scripts/colorsupport.vim'
NeoBundle 'xolox/vim-colorscheme-switcher'
NeoBundle 'vim-colorscheme-manager',
            \ { 'type': 'nosync' }
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
NeoBundle 'jeetsukumaran/vim-mochalatte', {'script_type' : 'colors'}
NeoBundle 'tomasr/molokai', {'script_type' : 'colors'}
NeoBundle 'sickill/vim-monokai', {'script_type' : 'colors'}
NeoBundle 'Aben/moria', {'script_type' : 'colors'}
NeoBundle 'camelite/vim-nazca-colorscheme', {'script_type' : 'colors'}
NeoBundle 'vim-scripts/obsidian', {'script_type' : 'colors'}
NeoBundle 'Taverius/openbsd.vim', {'script_type' : 'colors', 'type': 'nosync'}
NeoBundle 'vim-scripts/pf_earth.vim', {'script_type' : 'colors'}
NeoBundle 'Taverius/Royal-Colorschemes', {'script_type' : 'colors', 'type': 'nosync'}
            " Royalking
NeoBundle 'altercation/vim-colors-solarized', {'script_type' : 'colors'}
NeoBundle 'vim-scripts/Sorcerer', {'script_type' : 'colors'}
NeoBundle 'vim-scripts/twilight', {'script_type' : 'colors'}
NeoBundle 'kossnocorp/up.vim', {'script_type' : 'colors'}
NeoBundle 'shelbybark/vilight', {'script_type' : 'colors'}
NeoBundle 'orthecreedence/void.vim', {'script_type' : 'colors'}
NeoBundle 'vim-scripts/xorium.vim', {'script_type' : 'colors'}
NeoBundle 'jnurmine/Zenburn', {'script_type' : 'colors'}
NeoBundle 'vim-scripts/zenesque.vim', {'script_type' : 'colors'}

" End plugins
call neobundle#end()

"Required
filetype on

" Prompt to install missing bundles
NeoBundleCheck

" *************** "
" Simple options. "
" *************** "

set number              " Show line numbers.
set shiftwidth=4        " Indent 4 spaces by default.
set softtabstop=0       " Use 4 spaces instead of a Tab.
set tabstop=4           " Tabs use 4 spaces.
set shiftround          " Round indent (<,>) to multiples of 'shiftwidth'
set expandtab           " Convert tabs to spaces.
set lazyredraw          " Avoid redrawing the screen mid-command
set visualbell          " Visual bell.
set t_bv=               " Reset terminal code for visual bell.
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

if empty(glob($HOME.'/vimfiles/swap'))
    echomsg "Swap directory vimfiles\swap doesn't exist!"
endif                   " Warn if swapdir does not exist
set directory^=$HOME\vimfiles\swap//
                        " Build swap filename from path

try
    language en_GB      " Try to set language.
catch
endtry

set fileformats=unix,dos,mac
                        " default file type.

" ******************** "
" Conditional options. "
" ******************** "

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

if has('autocmd')
    augroup vimrcCursorHighlight
        autocmd!
        autocmd WinLeave * set nocursorline nocursorcolumn
        autocmd WinEnter * set cursorline cursorcolumn
    augroup end
    set cursorline
    set cursorcolumn
endif

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

if has('eval') && has('autocmd')
    filetype plugin indent on         " Enable filetype settings.
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
    if has('autocmd')
        augroup vimrcFoldInsert
            autocmd!
            " Don't screw up folds when inserting text that might affect them, until
            " leaving insert mode. Foldmethod is local to the window. Protect against
            " screwing up folding when switching between windows.
            autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
            autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
        augroup end
    endif
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

if has('insert_expand') && has('eval')
    set completeopt=menu,preview,longest
endif

if has('wildmenu')
    set wildmenu        " Enable tab-complete menu.
    set wildmode=longest:full
endif

if has('viminfo')
    set viminfo=!,%,'1000,/1000,:1000,f1,h,s100,n~\\vimfiles\\viminfo
                        " Enable a nice big viminfo file.
endif

if has('persistent_undo')
    set undodir=$HOME\vimfiles\undo
    set undofile
    if has('autocmd')
        augroup vimrcUndoFile
            autocmd!
            " Only set undofile for buffers backed by a file
            autocmd BufWritePost ?* if !BufferHasFileCheck() | setlocal noundofile | endif
            autocmd BufWinEnter  ?* if !BufferHasFileCheck() | setlocal noundofile | endif
        augroup end
    endif
endif

if has('conceal')
    set concealcursor=nc
    set conceallevel=2
endif

if has('mksession')
    set viewdir=$HOME\vimfiles\view
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
    if has('autocmd')
        augroup vimrcAutoView
            autocmd!
            " Autosave & Load Views.
            autocmd BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
            autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
        augroup end
    endif
endif

if has('autocmd')
    augroup vimrcSaveOnFocusLost
        autocmd!
        " When Vim loses focus, save the file
        autocmd FocusLost * silent! :wall
    augroup end
endif

" ***** "
" Maps. "
" ***** "

let mapleader = ","     " With a map leader it's possible to do extra key combinations.
let g:mapleader = ","   " like <leader>w saves the current file.

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

if has('menu')
     noremenu .600 Vimrc.Utility.Save<Tab><C-s>      :w<CR>
    inoremenu Vimrc.Utility.Save<Tab><C-s> <C-o>:w<CR>
    menu Vimrc.Utility.-SaveSep- :
endif

noremap <leader>e :e! $MYVIMRC<CR>
                        " Fast editing of the .vimrc.
if has('menu')
    execute 'noremenu Vimrc.Utility.Edit\ Vimrc<Tab>'.mapleader.'e :e! $MYVIMRC<CR>'
    menu Vimrc.Utility.-VimrcSep- :
endif

noremap <S-cr> <Esc>
                        " Shift-Enter = ESC.
if has('menu')
     noremenu Vimrc.Utility.Esc<Tab><S-cr> <Esc>
    menu Vimrc.Utility.-EscSep- :
endif

nnoremap <silent> \ :noh<CR>
                        " Clears search pattern
if has('menu')
    nnoremenu <silent> Vimrc.Utility.Clear\ Search<Tab>\\ :noh<CR>
    menu Vimrc.Utility.-ClearSep- :
endif

" Tabwidth.
map <leader>t2 :setlocal shiftwidth=2<CR>
map <leader>t4 :setlocal shiftwidth=4<CR>
map <leader>t8 :setlocal shiftwidth=8<CR>
if has('menu')
    execute 'menu Vimrc.Utility.Tab\ Width\ 2<Tab>'.mapleader.'t2 :setlocal shiftwidth=2<CR>'
    execute 'menu Vimrc.Utility.Tab\ Width\ 4<Tab>'.mapleader.'t4 :setlocal shiftwidth=4<CR>'
    execute 'menu Vimrc.Utility.Tab\ Width\ 8<Tab>'.mapleader.'t8 :setlocal shiftwidth=8<CR>'
    menu Vimrc.Utility.-TabWitdhSep- :
endif

" :cope.
noremap <leader>cc :botright cope<CR>
noremap <leader>n :cn<CR>
noremap <leader>p :cp<CR>
if has('menu')
    execute 'noremenu Vimrc.Utility.Cope<Tab>'.mapleader.'cc :botright cope<CR>'
    execute 'noremenu Vimrc.Utility.Cope\ Previous<Tab>'.mapleader.'n :cn<CR>'
    execute 'noremenu Vimrc.Utility.Cope\ Next<Tab>'.mapleader.'p :cp<CR>'
    menu Vimrc.Utility.-CopeSep- :
endif

" Remove the Windows ^M - when the encodings gets messed up.
noremap <leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm
if has('menu')
    execute 'noremenu Vimrc.Utility.WinEncode<Tab>'.mapleader.'m mmHmt:%s/<C-V><CR>//ge<CR>'."'".'tzt'."'".'m'
    menu Vimrc.Utility.-EncodeSep- :
endif

" Menu for folding
if has('menu')
    anoremenu <silent> Vimrc.Utility.Fold<Tab><C-Space> @=(foldlevel('.')?'za':'l')<CR>
endif

" This mapping allows to stay in visual mode when indenting with < and >
vnoremap > >gv
vnoremap < <gv


" These mappings are useful in long wrapped lines when pressing j or k
noremap j gj
noremap k gk

noremap <c-]> g<c-]>
noremap <c-g> g<c-g>


 noremap <F1>      :set paste!<CR>:set paste?<CR>
inoremap <F1> <C-o>:set paste!<CR><C-o>:set paste?<CR>

 noremap <F2>      :set list!<CR>:set list?<CR>
inoremap <F2> <C-o>:set list!<CR><C-O>:set list?<CR>

if !exists('g:loaded_numbertoggle')
    set relativenumber

     noremap <silent> <F3>      :set relativenumber!<CR>
    inoremap <silent> <F3> <C-o>:set relativenumber!<CR>
else
     noremap <silent> <F3>      <Plug>NumberToggleTrigger
    inoremap <silent> <F3> <C-o><Plug>NumberToggleTrigger
endif

if has('menu')
    anoremenu Vimrc.Toggle\ Paste<Tab><F1>      :set paste!<CR>:set paste?<CR>

    anoremenu Vimrc.Toggle\ List<Tab><F2>      :set list!<CR>:set list?<CR>

    if !exists('g:loaded_numbertoggle')
        anoremenu <silent> Vimrc.Toggle\ Number<Tab><F3> :set relativenumber!<CR>
    else
        anoremenu <silent> Vimrc.Toggle\ Number<Tab><F3> <Plug>NumberToggleTrigger
    endif

    menu Vimrc.-ToggleSep- :
endif

if has('spell')
    set nospell

    if has('eval')
        " Rotate through languages of spelling checker.
        let g:my_lang_codes = [ 'en_gb', 'it' ]
        if !exists('g:MY_LANG_IDX') || ( g:MY_LANG_IDX + 1 < len(g:my_lang_codes) )
            let g:MY_LANG_IDX = 0
        endif
        function! MySpellLang()
            exec "setlocal" "spelllang=".get(g:my_lang_codes, g:MY_LANG_IDX)
            let g:MY_LANG_IDX = ( g:MY_LANG_IDX + 1 < len(g:my_lang_codes) ) ? g:MY_LANG_IDX + 1 : 0
        endfunction
         noremap <silent>   <F4>      :setlocal spell!<CR>
        inoremap <silent>   <F4> <C-o>:setlocal spell!<CR>
         noremap <silent> <C-F4>      :call MySpellLang()<CR>
        inoremap <silent> <C-F4> <C-o>:call MySpellLang()<CR>
        if has('menu')
            anoremenu <silent> Vimrc.Toggle\ Spelling<Tab><F4>  :setlocal spell!<CR>
            anoremenu <silent> Vimrc.Spell\ Language<Tab><C-F4> :call MySpellLang()<CR>

            menu Vimrc.-SpellSep- :
        endif
    endif
endif


 noremap <silent> <F5>      :ToggleBookmark<CR>
inoremap <silent> <F5> <C-o>:ToggleBookmark<CR>
 noremap <silent> <F6>      :NextBookmark<CR>
inoremap <silent> <F6> <C-o>:NextBookmark<CR>
 noremap <silent> <F7>      :PreviousBookmark<CR>
inoremap <silent> <F7> <C-o>:PreviousBookmark<CR>

if has('menu')
    anoremenu <silent> Vimrc.Toggle\ Bookmark<Tab><F5>   :ToggleBookmark<CR>
    anoremenu <silent> Vimrc.Next\ Bookmark<Tab><F6>     :NextBookmark<CR>
    anoremenu <silent> Vimrc.Previous\ Bookmark<Tab><F7> :PreviousBookmark<CR>

    menu Vimrc.-BookmarkSep- :
endif

if has('menu')
    anoremenu <silent> Vimrc.Colorscheme.Next<Tab><F8>              :NextColorScheme<CR>
    anoremenu <silent> Vimrc.Colorscheme.Previous<Tab><S-F8>        :PrevColorScheme<CR>
    menu Vimrc.Colorscheme.-Sep- :
    anoremenu <silent> Vimrc.Colorscheme.Blacklist<Tab><C-F8>       :BlacklistAddColorScheme<CR>
    anoremenu <silent> Vimrc.Colorscheme.Un-Blacklist<Tab><M-F8>    :BlacklistRemColorScheme<CR>

    menu Vimrc.-ColorschemeSep- :
endif

" ********* "
" Browsers. "
" ********* "

noremap <silent> <leader>lt      :TagbarToggle<CR>
if has('menu')
    execute 'noremenu <silent> Vimrc.Tagbar<Tab>'.mapleader.'lt :TagbarToggle<CR>'
endif

noremap <silent> <leader>lb      :<C-u>Unite -start-insert buffer<CR>
if has('menu')
    execute 'noremenu <silent> Vimrc.Unite\ Buffer<Tab>'.mapleader.'lb :<C-u>Unite -start-insert buffer<CR>'
endif

noremap <silent> <leader>lm      :<C-u>Unite -start-insert neomru/file<CR>
if has('menu')
    execute 'noremenu <silent> Vimrc.Unite\ MRU<Tab>'.mapleader.'lm :<C-u>Unite -start-insert neomru/file<CR>'
endif

call unite#filters#matcher_default#use(['matcher_fuzzy'])
if has('lua')
    noremap <silent> <leader>lf      :<C-u>Unite -start-insert file_rec/async<CR>
    if has('menu')
        execute 'noremenu <silent> Vimrc.Unite\ File<Tab>'.mapleader.'lf :<C-u>Unite -start-insert file_rec/async<CR>'
    endif
else
    noremap <silent> <leader>lf      :<C-u>Unite -start-insert file_rec<CR>
    if has('menu')
        execute 'noremenu <silent> Vimrc.Unite\ File<Tab>'.mapleader.'lf :<C-u>Unite -start-insert file_rec<CR>'
    endif
endif

" Undo Browser
if has('python')
    noremap <silent> <leader>lu      :GundoToggle<CR>
    if has('menu')
        execute 'noremenu <silent> Vimrc.Undo<Tab>'.mapleader.'lu :GundoToggle<CR>'
    endif
else
    noremap <silent> <leader>lu      :Histwin<CR>
    if has('menu')
        execute 'noremenu <silent> Vimrc.Undo<Tab>'.mapleader.'lu :Histwin<CR>'
    endif
endif

" Function used to display syntax group.
function! SyntaxItem()
    return synIDattr(synID(line("."),col("."),1),"name")
endfunction

noremap <silent> <Leader>syn :echo SyntaxItem()<CR>
if has('menu')
    menu Vimrc.-SynGroupSep- :
    execute 'noremenu <silent> Vimrc.Hidden.Syntax\ Group<Tab>'.mapleader.'syn :echo SyntaxItem()<CR>'
endif

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

noremap <silent> <Leader>utf :echo ShowUtf8Sequence()<CR>
if has('menu')
    menu Vimrc.Hidden.-UTFSeqSep- :
    execute 'noremenu <silent> Vimrc.Hidden.Show\ UTF<Tab>'.mapleader.'utf :echo ShowUtf8Sequence()<CR>'
endif

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
if has('menu')
    menu Vimrc.-VimGrepSep- :
    execute 'menu Vimrc.VimGrep.Vim\ Grep<Tab>'.mapleader.'g :vimgrep // **/*.<left><left><left><left><left><left><left>'
    menu Vimrc.VimGrep.-VisSearchSep- :
    vnoremenu <silent> Vimrc.VimGrep.Visual\ Search\ (gv)<Tab>gv :call VisualSearch('gv')<CR>
    vnoremenu <silent> Vimrc.VimGrep.Visual\ Search\ (?)<Tab># :call VisualSearch('b')<CR>
    vnoremenu <silent> Vimrc.VimGrep.Visual\ Search\ (/)<Tab>* :call VisualSearch('f')<CR>
endif

" Pressing an 'enter visual mode' key while in visual mode changes mode.
vmap <C-V> <ESC>`<<C-v>`>
vmap V     <ESC>`<V`>
vmap v     <ESC>`<v`>

" Y behaves like D rather than like dd
nnoremap Y y$

" Smart way to move btw. windows.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
if has('menu')
    menu Vimrc.-WindowSep- :
    menu Vimrc.Window.Move\ Up<Tab><C-j> <C-W>j
    menu Vimrc.Window.Move\ Down<Tab><C-k> <C-W>k
    menu Vimrc.Window.Move\ Left<Tab><C-h> <C-W>h
    menu Vimrc.Window.Move\ Right<Tab><C-l> <C-W>l
endif

" Close the current buffer.
map <leader>bd :Bclose<CR>
if has('menu')
    menu Vimrc.-BufferSep- :
    execute 'menu Vimrc.Buffer.Close<Tab>'.mapleader.'bd :Bclose<CR>'
endif

" Close all the buffers.
map <leader>ba :1,300 bd!<CR>
if has('menu')
    execute 'menu Vimrc.Buffer.Close\ All<Tab>'.mapleader.'ba :1,300 bd!<CR>'
endif

" Use the arrows to something usefull.
map <silent> <C-right> :tabnext<CR>
map <silent> <C-left>  :tabprevious<CR>
if has('menu')
    menu Vimrc.-TabSep- :
    menu <silent> Vimrc.Tabs.Next\ Tab<Tab><C-right> :tabnext<CR>
    menu <silent> Vimrc.Tabs.Previous\ Tab<Tab><C-left>  :tabprevious<CR>
endif

" Tab configuration.
map <leader>tn :tabnew %<CR>
map <leader>te :tabedit
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
if has('menu')
    menu Vimrc.Tabs.-TabSubSep- :
    execute 'menu Vimrc.Tabs.New\ Tab<Tab>'.mapleader.'tn :tabnew %<CR>'
    execute 'menu Vimrc.Tabs.Edit\ Tab<Tab>'.mapleader.'te :tabedit'
    execute 'menu Vimrc.Tabs.Close\ Tab<Tab>'.mapleader.'tc :tabclose<CR>'
    execute 'menu Vimrc.Tabs.Move\ Tab<Tab>'.mapleader.'tm :tabmove'
    menu Vimrc.-UtilSep- :
endif

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

" ************ "
" Window Size. "
" ************ "

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

" ************** "
" Colour scheme. "
" ************** "

set background=dark

let g:jellyx_show_whitespace = 1
let g:moria_fontface = "mixed"
let g:moria_style = "dark"
let g:liquidcarbon_high_contrast = 1
let g:lucius_style = "dark"
let g:solarized_termcolors = 256
let g:solarized_style = "dark"
let g:solarized_underline = 0
let g:zenesque_colors = 3

let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
let g:CSApprox_use_showrgb = 1

" ********** "
" Statusbar. "
" ********** "

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
    augroup end
endif

" ************* "
" Window title. "
" ************* "

if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f\                                                " file name
    set titlestring+=%h%m%r%w                                           " flags
    set titlestring+=\ -\ %{substitute(expand(v:progname),\ '\.exe',\ '',\ '')}
                                                                        " program name
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}    " working directory
endif

" *********** "
" Linebreaks. "
" *********** "

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

" ******************************* "
" Tabs, trailing whitespace, etc. "
" ******************************* "

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

" ****************** "
" Language-specific. "
" ****************** "

" C
if has('eval')
    let g:c_gnu = 1
    let g:c_space_errors = 1
    let g:ch_syntax_for_h = 1
endif

" C#
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
    augroup end
endif

" LISP
if has('eval')
    let g:lisp_rainbow = 1
endif

" Python
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
    augroup end
endif

" Ruby
if has('eval') && has('autocmd')
    augroup vimrcRuby
        autocmd!
        autocmd FileType ruby setl shiftwidth=2
        autocmd FileType ruby setl softtabstop=2
    augroup end
endif

" Scheme
if has('eval')
    let g:is_chicken = 1
endif

" Vimscript
if has('eval')
    " let g:vimsyn_folding = 'afmpPrt'
    if has('autocmd')
        augroup vimrcVIML
            autocmd!
            autocmd FileType vim setlocal foldmethod=marker foldlevel=99
            autocmd FileType vim if bufname('') =~# '^\%(' . (v:version < 702 ? 'command-line' : '\[Command Line\]') . '\|option-window\)$' | setlocal nofoldenable | endif
        augroup end
    endif
endif

" ******** "
" Plugins. "
" ******** "

if has('eval')

    let g:ctags_location = 'C:\\Dev\\Ctags\\ctags.exe'

    if has('lua')
        " NeoComplete.vim
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        " Use neocomplete.
        let g:neocomplete#enable_at_startup = 1
        " Use smartcase.
        let g:neocomplete#enable_smart_case = 1
        " Set minimum syntax keyword length.
        let g:neocomplete#sources#syntax#min_keyword_length = 3
        let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
        " Define dictionary.
        let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ }
        " Define keyword.
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'
        " Plugin key-mappings.
        inoremap <expr><C-d>    neocomplete#undo_completion()
        inoremap <expr><C-l>    neocomplete#complete_common_string()
        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <silent> <CR>  <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
            return neocomplete#close_popup() . "\<CR>"
            " For no inserting <CR> key.
            "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
        endfunction
        " <TAB>: completion.
        inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h>    neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><BS>     neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y>    neocomplete#close_popup()
        inoremap <expr><C-e>    neocomplete#cancel_popup()
        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        " Enable heavy omni completion.
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
        let g:neocomplcache_temporary_dir = $HOME.'\vimfiles\neocon'
        " Recommended key-mappings.
        " <CR>: close popup and save indent.
        inoremap <expr><CR>  neocomplcache#smart_close_popup() ."\<CR>"
        " <TAB>: completion.
        inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y> neocomplcache#close_popup()
        inoremap <expr><C-e> neocomplcache#cancel_popup()
        " Enable omni completion.
        if !exists('g:neocomplcache_omni_patterns')
            let g:neocomplcache_omni_patterns = {}
        endif
        " Ctags
        let g:neocomplcache_ctags_program = g:ctags_location
    endif


    " Bookmarking
    let g:bookmarking_menu = 0
    if has('signs')
        function! SetBookmarkStyle()
            if has('gui_running') || (&termencoding ==? 'utf-8')
                sign define bookmark text=»» texthl=SignColumn
            else
                sign define bookmark text=>> texthl=SignColumn
            endif
        endfunction
        if has('autocmd')
            augroup vimrcBookmarking
                autocmd!
                autocmd VimEnter * call SetBookmarkStyle()
            augroup end
        else
            call SetBookmarkStyle()
        endif
    endif


    " Easytags
    let g:easytags_cmd = g:ctags_location
    " let g:easytags_ctags_version = '5.8'
    " let g:easytags_suppress_ctags_warning = 1
    let g:easytags_ignored_filetypes = '^\(bat|vba|tex|viki\)$'
    let g:easytags_by_filetype = $HOME.'\vimfiles\easytags'
    let g:easytags_python_enabled = 1


    " TagBar
    let g:tagbar_ctags_bin = g:ctags_location
    let g:tagbar_left = 0
    let g:tagbar_width = 40
    let g:tagbar_usearrows = 1
    if has('python')
        let g:tagbar_type_markdown = {
                    \ 'ctagstype': 'markdown',
                    \ 'ctagsbin' : $HOME.'bundles\markdown2ctags\markdown2ctags.py',
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


    " Shell
    let g:shell_mappings_enabled = 0


    " TOhtml
    let g:html_number_lines = 1
    let g:html_use_css = 1
    let g:html_dynamic_folds = 1
    let g:html_use_encoding = 'UTF-8'


    " Numbertoggle
    let g:UseNumberToggleTrigger = 0


    " Easyclip
    nnoremap gm m


    " Sneak
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


    " Easy-Align
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vmap <Enter> <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
    nmap <Leader>a <Plug>(EasyAlign)


    " Hardtime
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


    " Lightline
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

    " Unite and such
    let g:unite_force_overwrite_statusline = 0
    let g:unite_source_history_yank_enable = 0

    autocmd FileType unite call s:unite_my_settings()
    function! s:unite_my_settings()
        " Overwrite settings.

        imap <buffer> jj <Plug>(unite_insert_leave)
        "imap <buffer> <C-w> <Plug>(unite_delete_backward_path)

        imap <buffer><expr> j unite#smart_map('j', '')
        imap <buffer> <TAB> <Plug>(unite_select_next_line)
        imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
        imap <buffer> ' <Plug>(unite_quick_match_default_action)
        nmap <buffer> ' <Plug>(unite_quick_match_default_action)
        imap <buffer><expr> x
        \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
        nmap <buffer> x <Plug>(unite_quick_match_choose_action)
        nmap <buffer> <C-z> <Plug>(unite_toggle_transpose_window)
        imap <buffer> <C-z> <Plug>(unite_toggle_transpose_window)
        imap <buffer> <C-y> <Plug>(unite_narrowing_path)
        nmap <buffer> <C-y> <Plug>(unite_narrowing_path)
        nmap <buffer> <C-j> <Plug>(unite_toggle_auto_preview)
        nmap <buffer> <C-r> <Plug>(unite_narrowing_input_history)
        imap <buffer> <C-r> <Plug>(unite_narrowing_input_history)
        nnoremap <silent><buffer><expr> l
        \ unite#smart_map('l', unite#do_action('default'))

        let unite = unite#get_current_unite()
        if unite.profile_name ==# 'search'
        nnoremap <silent><buffer><expr> r unite#do_action('replace')
        else
        nnoremap <silent><buffer><expr> r unite#do_action('rename')
        endif

        nnoremap <silent><buffer><expr> cd unite#do_action('lcd')
        nnoremap <buffer><expr> S unite#mappings#set_current_filters(
        \ empty(unite#mappings#get_current_filters()) ?
        \ ['sorter_reverse'] : [])

        " Runs "split" action by <C-s>.
        imap <silent><buffer><expr> <C-s> unite#do_action('split')
    endfunction

endif

