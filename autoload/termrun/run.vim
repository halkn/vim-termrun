" @param {...} = List " exec command
function! termrun#run#command(...) abort
  if a:0 == 0 | return | endif
  call termrun#exec(a:000, termrun#getconf()['_']['opts'])
endfunction

" @param {...} = List " args for quick command
function termrun#run#quick(...) abort
  let l:ft_cnf = get(termrun#getconf(), &filetype, {})
  if !s:is_supported(l:ft_cnf) | return | endif

  let l:quick = get(l:ft_cnf, 'quick', {})
  if !s:is_supported(l:quick) | return | endif

  " If the argument is present, use it to run the quick command.
  if a:0 != 0
    call termrun#exec(l:quick['cmd'] + a:000, l:ft_cnf['opts'])
  else
    call termrun#exec(l:quick['cmd'] + [expand('%')], l:ft_cnf['opts'])
  endif
endfunction

" @param {...} = List " args for test command
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
    echo printf("[termrun] UnSuppouted filetype: '%s'", &filetype )
    return v:false
  endif
  return v:true
endfunction
