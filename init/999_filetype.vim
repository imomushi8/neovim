filetype plugin indent on
augroup filetype_setting
  autocmd VimEnter,BufRead,BufNewFile *.sbt,*.sc set filetype=scala
augroup END
