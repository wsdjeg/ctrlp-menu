if exists('g:loaded_ctrlp_listmenu') && g:loaded_ctrlp_listmenu
  finish
endif
let g:loaded_ctrlp_listmenu = 1

let s:register_var = {
      \  'init':   'ctrlp#listmenu#init()',
      \  'exit':   'ctrlp#listmenu#exit()',
      \  'accept': 'ctrlp#listmenu#accept',
      \  'lname':  'menu',
      \  'sname':  'menu',
      \  'type':   'menu',
      \  'sort':   0,
      \}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:register_var)
else
  let g:ctrlp_ext_vars = [s:register_var]
endif

function! ctrlp#listmenu#init()
  return keys(g:unite_source_menu_menus)
endfunc

function! ctrlp#listmenu#accept(mode, str)
  call ctrlp#exit()
  exe 'CtrlPMenu ' . a:str
endfunction

function! ctrlp#listmenu#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#listmenu#id()
  return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2

