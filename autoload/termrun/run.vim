" @param {...} = List " exec command
function termrun#run#run(...) abort
  let l:config = termrun#getconf()

  " If given an argument, run it with default(_) settings.
  if a:0 != 0 | call termrun#exec(a:000, l:config['_']['opts']) | return | endif

  let l:ft_cnf = get(l:config, &filetype, {})
  if l:ft_cnf != {}
    call termrun#exec(l:ft_cnf['run'] + [expand('%')], l:ft_cnf['opts'])
  endif
endfunction
