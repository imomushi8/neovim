" Default settings
let g:rooter_targets = '*.scala,*.sbt,*.py,*.c,*.cpp,*.vim,*.lua'
let g:rooter_manual_only = 0
let g:rooter_change_directory_for_non_project_files = 'current'

" FileType settings
augroup config_rooter
  autocmd!
  autocmd FileType scala let g:rooter_patterns = ['build.sbt']
  autocmd FileType vim   let g:rooter_patterns = ['.git']
  autocmd FileType lua   let g:rooter_patterns = ['.git']
  autocmd FileType py    let g:rooter_patterns = ['.git']
  autocmd FileType c     let g:rooter_patterns = ['.git']
  autocmd FileType cpp   let g:rooter_patterns = ['.git']
augroup END
