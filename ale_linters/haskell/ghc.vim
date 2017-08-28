" Author: w0rp <devw0rp@gmail.com>
" Description: ghc for Haskell files

call ale#linter#Define('haskell', {
\   'name': 'ghc',
\   'output_stream': 'stderr',
\   'executable': 'ghc',
\   'command_callback': 'ale_linters#haskell#ghc#GetCommand',
\   'callback': 'ale#handlers#haskell#HandleGHCFormat',
\})

function! ale_linters#haskell#ghc#GetCommand(buffer) abort
    return ale#path#BufferCdString(a:buffer)
    \   . ' ghc -fno-code -v0 %t'
endfunction
