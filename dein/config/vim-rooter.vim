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

  autocmd FileType vim    call VimRooterGit()
  autocmd FileType lua    call VimRooterGit()
  autocmd FileType c      call VimRooterGit()
  autocmd FileType cpp    call VimRooterGit()
  autocmd FileType rs     call VimRooterRust()
  autocmd FileType scala  call VimRooterScala()
  autocmd FileType python call VimRooterPython()
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

  " venvを探してactivateする
  " !!!!!注!!!!! なぜかドットファイル形式だと検索されないので、（うざすぎ）venvのときにはいれないこと。
  let path_str = getcwd() . "/**/Scripts/activate"
  let g:venv = expand(path_str)
  if executable(g:venv)
    call system(g:venv)
  else
    echo "no venv"
    echo path_str
    echo g:venv
  endif
endfunction
