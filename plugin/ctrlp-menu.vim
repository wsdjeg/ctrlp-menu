
let g:ctrlp_menu_name = ''


function! s:menu(...) abort
    let g:ctrlp_menu_name = get(a:000, 0, '')
    if !empty(g:ctrlp_menu_name)
        call ctrlp#init(ctrlp#menu#id())
    endif
endfunction

command! -nargs=? CtrlPMenu call s:menu(<f-args>)
