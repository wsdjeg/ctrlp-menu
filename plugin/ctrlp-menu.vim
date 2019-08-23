""
" @section Introduction, intro
" @stylized ctrlp-menu
" @library
" @order intro version dicts functions exceptions layers api faq
" ctrlp-menu is a plugin for ctrlp, which can read the menu informations from
" unite and denite.

let g:ctrlp_menu_name = ''


function! s:menu(...) abort
    let g:ctrlp_menu_name = get(a:000, 0, '')
    if !empty(g:ctrlp_menu_name)
        call ctrlp#init(ctrlp#menu#id())
    else
        call ctrlp#init(ctrlp#listmenu#id())
    endif
endfunction

""
" List all menus or open specific menu
command! -nargs=? CtrlPMenu call s:menu(<f-args>)
