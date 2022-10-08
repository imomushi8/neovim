nnoremap <silent> <C-h> <Cmd>BufferPrevious<CR>
nnoremap <silent> <C-l> <Cmd>BufferNext<CR>
" nnoremap <silent> <C-d> <Cmd>BufferClose<CR>
" nnoremap <silent> <C-p> <Cmd>BufferPin<CR>

" Re-order to previous/next
"   :BufferMovePrevious
"   :BufferMoveNext
" Wipeout buffer
"   :BufferWipeout
" Close commands
"   :BufferCloseAllButCurrent
"   :BufferCloseAllButPinned
"   :BufferCloseAllButCurrentOrPinned
"   :BufferCloseBuffersLeft
"   :BufferCloseBuffersRight

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:false

" Enables/disable clickable tabs
let bufferline.clickable = v:false

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
" if set to 'buffer_number_with_icon', will show buffer number and icons in the tabline
let bufferline.icons = v:true

" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '*'
let bufferline.icon_pinned = '車'

" Default is to insert after current buffer.
let bufferline.insert_at_start = v:false
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 4

" Sets the minimum padding width with which to surround each tab.
let bufferline.minimum_padding = 1

" Sets the maximum buffer name length.
let bufferline.maximum_length = 25

" If set, the letters for each buffer in buffer-pick mode will be assigned based on their name. Otherwise or in case all letters are already assigned, the behavior is to assign letters in order of usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is optimal for the qwerty keyboard layout but might need adjustement for other layouts.
let bufferline.letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null
