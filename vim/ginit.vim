" GUI setttings for neovim an neovide client
if exists('g:fvim_loaded')
    " good old 'set guifont' compatibility
    set guifont=Hack:h15
    " Ctrl-ScrollWheel for zooming in/out
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
    nnoremap <A-CR> :FVimToggleFullScreen<CR>
endif

let g:neovide_refresh_rate=140
let g:neovide_no_idle=v:true
"let g:neovide_fullscreen=v:true
let g:neovide_cursor_animation_length=0
let g:neovide_cursor_antialiasing=v:true
" let g:neovide_cursor_trail_length=0
