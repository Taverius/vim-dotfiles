if exists('g:did_colour_foldcolumn')
    unlet g:did_colour_foldcolumn
else
    highlight clear FoldColumn
    highlight link FoldColumn Folded
endif

if exists('g:did_colour_signcolumn')
    unlet g:did_colour_signcolumn
else
    highlight clear SignColumn
    highlight link SignColumn LineNr
endif

if exists('g:did_colour_cursorcolumn')
    unlet g:did_colour_cursorcolumn
else
    highlight clear CursorColumn
    highlight link CursorColumn CursorLine
endif

