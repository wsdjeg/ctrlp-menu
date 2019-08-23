if exists('g:loaded_ctrlp_menu') && g:loaded_ctrlp_menu
  finish
endif
let g:loaded_ctrlp_menu = 1

let s:register_var = {
      \  'init':   'ctrlp#menu#init()',
      \  'exit':   'ctrlp#menu#exit()',
      \  'accept': 'ctrlp#menu#accept',
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

function! ctrlp#menu#init()
  let s:menu_name = g:ctrlp_menu_name
  let s:menu_action = {}
  let menu = get(g:unite_source_menu_menus, s:menu_name, {})
  if has_key(menu, 'command_candidates')
    let rt = []
    for item in menu.command_candidates
      call add(rt, item[0])
      call extend(s:menu_action, {item[0] : item[1]}, 'force')
    endfor
    return rt
  else
    return []
  endif
endfunc

function! ctrlp#menu#accept(mode, str)
  call ctrlp#exit()
  let action = get(s:menu_action, a:str, '')
  exe action
endfunction

function! ctrlp#menu#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#menu#id()
  return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2
