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

function! termrun#run#test(...) abort
  let l:ft_cnf = get(termrun#getconf(), &filetype, {})
  if !s:is_supported(l:ft_cnf) | return | endif

  let l:test = get(l:ft_cnf, 'test', {})
  if !s:is_supported(l:test) | return | endif

  " If the argument is present, use it to run the test command.
  if a:0 != 0
    call termrun#exec(l:test['cmd'] + a:000, l:ft_cnf['opts'])
  else
    call termrun#exec(l:test['cmd'] + [expand(l:test['target'])] , l:ft_cnf['opts'])
  endif
endfunction

function! s:is_supported(conf) abort
  if a:conf == {}
    echo '[termrun] UnSuppouted for filetype: ''' .. &filetype .. ''''
    return v:false
  endif
  return v:true
endfunction
