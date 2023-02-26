" let g:sessionDir = 'C:\Users\CBKNd\AppData\Local\nvim-data\sessions\'
" let s:sessionFile = g:sessionDir . 'autosession.vim'

" function! s:autoSaveSession() abort
"   execute 'mksession!' s:sessionFile
" endfunction

" function! s:autoRestoreSession() abort
"   if filereadable(expand(s:sessionFile))
"     execute 'source' s:sessionFile
"   endif
" endfunction

" augroup autoSession
"   autocmd!
"   autocmd VimLeave * call s:autoSaveSession()
"   autocmd VimEnter * call s:autoRestoreSession()
" augroup END

