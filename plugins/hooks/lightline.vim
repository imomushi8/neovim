let g:lightline#bufferline#enable_devicons = 1
let g:lightline = {
\ 'enable': {
\   'statusline': 1, 
\   'tabline': 1,
\ },
\ 'colorscheme': 'catppuccin',
\ 'mode_map': {'c': 'NORMAL'},
\ 'active': {
\   'left': [ ['mode', 'paste'],
\             ['filetype', 'filestatus', 'fugitive'],
\   ],
\   'right': [ ['fileencoding', 'fileformat'],
\              ['lineinfo'],
\   ],
\ },
\  'component': {
\     'lineinfo': '[R:%3l/%L][C:%2v]'
\ },
\ 'component_function': {
\   'mode':         'LightLineMode',
\   'filetype':     'LightlineFiletype',
\   'filestatus':   'LightlineFileStatus',
\   'filename':     'LightlineFilename',
\   'fugitive':     'LightlineFugitive',
\   'fileformat':   'LightlineFileformat',
\   'fileencoding': 'LightlineFileencoding',
\   'gitgutter':    'LightlineGitGutter',
\   'charcode':     'LightlineCharCode',
\ },
\
\ 'tabline': {
\   'left': [ ['buffers'] ],
\   'right': []
\ },
\ 'component_expand': {
\   'buffers': 'lightline#bufferline#buffers'
\ },
\ 'component_type': {
\   'buffers': 'tabsel'
\ },
\}

function! LightLineMode()
  return &filetype =~ 'help\|defx\|exploler' ? '' : lightline#mode()
endfunction

function! LightlineFiletype()
  return &filetype !=# '' ? &filetype : 'No FileType'
endfunction

function! LightlineFileStatus()
  return  (&readonly ? 'r' : '-') . (&modifiable ? 'w' : '-')

endfunction

function! LightlineFilename()
  return '' != expand('%:t') ? expand('%:t') : '[No Name]'
endfunction

function! LightlineFileformat()
  return winwidth('.') > 50 ? &fileformat : ''
endfunction

function! LightlineFileencoding()
  return winwidth('.') > 50 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineFugitive()
  return winwidth('.') > 50 ? FugitiveHead() : ''
endfunction

function! LightlineGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth(0) <= 70
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" Get cursored charcter code
function! LightlineCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction
