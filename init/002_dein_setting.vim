" directory variables {{{
let s:dein_dir      = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:rc_dir        = expand('~/AppData/Local/nvim/dein')
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  
  " read toml and cache as non-lazy
  call dein#load_toml(s:rc_dir . '/utilities.toml',    {'lazy': 0})
  call dein#load_toml(s:rc_dir . '/dependencies.toml', {'lazy': 0})

  " read toml and cache in rc_dir directory
  let s:filelist = split(glob(s:rc_dir . '/lazy/*.toml'), "\n")
  for file in s:filelist
    call dein#load_toml(file, {'lazy': 1})
  endfor

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
