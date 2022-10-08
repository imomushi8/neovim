let g:lightline = {
        \ 'enable': {
        \   'statusline': 1, 
        \   'tabline': 0
        \ },
        \ 'colorscheme': 'tokyonight',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ ['mode', 'paste'],
        \             ['readonly', 'modified', 'filetype'],
        \             ['fugitive']
        \   ],
        \   'right': [ ['fileencoding', 'fileformat'],
        \              ['lineinfo'],
        \   ],
        \ },
        \  'component': {
        \     'lineinfo': '[R:%3l/%L][C:%2v]'
        \ },
        \ 'component_function': {
        \   'readonly':     'LightlineReadonly',
        \   'modified':     'LightlineModified',
        \   'mode':         'LightLineMode',
        \   'filename':     'LightlineFilename',
        \   'fugitive':     'LightlineFugitive',
        \   'gitgutter':    'LightlineGitGutter',
        \   'charcode':     'LightlineCharCode',
        \   'fileformat':   'LightlineFileformat',
        \   'fileencoding': 'LightlineFileencoding',
        \   'filetype':     'LightlineFiletype',
        \ },
        \}

function! LightlineFileformat()
  return winwidth('.') > 50 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth('.') > 50 ? (&filetype !=# '' ? &filetype : 'No FileType') : ''
endfunction

function! LightlineFileencoding()
  return winwidth('.') > 50 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 50 ? lightline#mode() : ''
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|defx\|exploler' && &readonly ? '[RO]' : ''
endfunction

function! LightlineModified()
  return &ft =~ 'help\|defx\|exploler' ? '' : &modified ? '[+]' : &modifiable ? '' : '[-]'
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]')
endfunction

function! LightLineFugitive()
  return winwidth('.') > 50 ? FugitiveStatusline() : ''
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
