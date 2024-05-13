" Default settings
" 新規でファイルタイプを増やすときはここを変える
let g:rooter_targets = '*.scala,*.sbt,*.py,*.c,*.cpp,*.vim,*.lua,*.rs'
let g:rooter_manual_only = 1
let g:rooter_change_directory_for_non_project_files = 'current'

" FileType settings
" さらにここにルートディレクトリを追加する
augroup vim_rooter_settings
  autocmd!
  " ファイルタイプ設定
  autocmd VimEnter,BufRead,BufNewFile *.sbt,*.sc set filetype=scala
  autocmd VimEnter,BufRead,BufNewFile *.rs set filetype=rust

  autocmd BufRead *.vim               call VimRooterGit()
  autocmd BufRead *.lua               call VimRooterGit()
  autocmd BufRead *.c                 call VimRooterGit()
  autocmd BufRead *.cpp               call VimRooterGit()
  autocmd BufRead *.rs                call VimRooterRust()
  autocmd BufRead *.scala,*.sbt,*.sc  call VimRooterScala()
  autocmd BufRead *.py                call VimRooterPython()
augroup END

function! VimRooterGit() 
  let g:rooter_patterns = ['.git']
  Rooter
endfunction

function! VimRooterScala() 
  let g:rooter_patterns = ['build.sbt']
  Rooter
endfunction

function! VimRooterRust() 
  let g:rooter_patterns = ['Cargo.toml']
  Rooter
endfunction

function! VimRooterPython() 
  let g:rooter_patterns = ['.git']
  Rooter
endfunction
