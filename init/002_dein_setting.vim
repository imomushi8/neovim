if &compatible
  set nocompatible
endif

" dein settings and installation
if has('python3')
  " directory variables
  let g:dein_dir      = expand($XDG_CACHE_HOME . '/dein')
  let g:dein_repo_dir = expand(g:dein_dir . '/repos/github.com/Shougo/dein.vim')
  let g:toml_dir      = expand($XDG_CONFIG_HOME . '/nvim/dein')

  " dein installation check
  if &runtimepath !~# '/dein.vim'
    if !isdirectory(g:dein_repo_dir)
      let s:msg = system('git clone https://github.com/Shougo/dein.vim ' . g:dein_repo_dir)
      echo 'EXECUTE git clone https://github.com/Shougo/dein.vim ' . g:dein_repo_dir
      echo '============================================'
      echo s:msg
      echo '============================================'
    endif
    execute 'set runtimepath^=' . g:dein_repo_dir
  endif
  
  " begin settings
  if dein#load_state(g:dein_dir)
    call dein#begin(g:dein_dir)
  
    if !isdirectory(g:toml_dir)
      call mkdir(g:toml_dir, 'p')
    endif
    
    " read toml and cache as non-lazy
    call dein#load_toml(g:toml_dir . '/utilities.toml',    {'lazy': 0})
    call dein#load_toml(g:toml_dir . '/dependencies.toml', {'lazy': 0})
  
    " read toml and cache in rc_dir directory
    let s:filelist = split(glob(g:toml_dir . '/lazy/*.toml'), "\n")
    for file in s:filelist
      call dein#load_toml(file, {'lazy': 1})
    endfor
  
    " end settings
    call dein#end()
    call dein#save_state()
  endif
  
  " plugin installation check
  if dein#check_install()
    call dein#install()
  endif
  
  " plugin remove check
  let s:removed_plugins = dein#check_clean()
  if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
  endif
  
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

" python3のパスが設定されてない場合
else
  echo 'no `g:python3_host_prog`'
endif
