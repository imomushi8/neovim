" Content
let g:ascii = [
  \'       _       ',
  \'      (_)      ',
  \' _   _ _ ____  ',
  \'| | | | |    \ ',
  \' \ V /| | | | |',
  \'  \_/ |_|_|_|_|',
  \]

let g:startify_custom_header = g:ascii + startify#fortune#boxed()
let g:startify_custom_footer = ['-------------------------------------------------------']
let g:startify_padding_left  = 4
let g:startify_files_number  = 5

let g:startify_bookmarks = [
  \ {'v': $MYVIMRC},
  \ {'s': '/workspace_Scala'},
  \ {'p': '/workspace_Python'}
  \]
let g:startify_commands = []
let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
  \ { 'type': 'sessions',  'header': ['   Sessions'] },
  \]
  " \ { 'type': 'files',     'header': ['   MRU'] },
  " \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },

let g:startify_skiplist = [
  \ '^/tmp',
  \ '.swap$',
  \ '.tmp$',
  \ ]


" " For Sessions
let g:startify_session_sort           = 0
let g:startify_session_autoload       = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence    = 1
let g:startify_session_number         = 20
let g:startify_session_dir            = $LOCALAPPDATA . '\nvim-data\sessions'
let g:startify_session_remove_lines   = ['setlocal', 'winheight']
" let g:startify_session_before_save    = ['echo "Saving this session ..."']
" let g:startify_session_savecmds       = ['echo "Saved a session."']
let g:startify_session_savevars = [
  \ 'g:startify_session_dir',
  \ 'g:startify_session_savevars',
  \ ]
  " \ 'g:startify_session_savecmds',


" For Misc options
let g:startify_change_to_dir       = 0
let g:startify_change_to_vcs_root  = 0
let g:startify_disable_at_vimenter = 0
let g:startify_fortune_use_unicode = 1
let g:startify_relative_path       = 0
let g:startify_use_env             = 0
let g:startify_enable_special      = 1
let g:startify_enable_unsafe       = 0
let g:startify_update_oldfiles     = 1