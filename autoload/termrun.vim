" Define default config
let s:default = {
\ '_': {
\   'opts': {'vertical': v:false, 'size': &lines/2}
\ },
\ 'sh': {
\   'command': ['bash'], 
\   'opts': {'vertical': v:true, 'size': 80}
\ },
\ 'go': {
\   'command': ['go', 'run'],
\   'opts': {'vertical': v:true, 'size': 80}
\ },
\ 'markdown': {
\   'command': ['glow'],
\   'opts': {'vertical': v:true, 'size': &columns/2}
\ }
\ }

let s:config = {}
function termrun#getconf() abort
  if s:config != {} | return s:config | endif

  let s:config = s:default

  " If user config is defeined, Overwide default.
  let l:conf = get(g:, 'termrun_config', {})
  if l:conf != {}
    for ft in keys(l:conf)
      let s:config[ft] = l:conf[ft]
    endfor
  endif
  return s:config
endfunction

" @param {...} = List " exec command
function termrun#run(...) abort
  let l:config = termrun#getconf()

  " If given an argument, run it with default(_) settings.
  if a:0 != 0 | call termrun#exec(a:000, l:config['_']['opts']) | return | endif

  let l:ft_cnf = get(l:config, &filetype, {})
  if l:ft_cnf != {}
    call termrun#exec(l:ft_cnf['command'] + [expand('%')], l:ft_cnf['opts'])
  endif
endfunction

let s:termrun_bufnr = -1

" @param {cmd} = List " exec command
" @param {conf} = dict " see s:default
function termrun#exec(cmd, opts) abort
  let l:run_win_nr = bufwinnr(s:termrun_bufnr)
  if l:run_win_nr != -1
    silent! execute l:run_win_nr .. 'wincmd c'
  endif

  let l:opts = {'norestore': v:true, 'term_kill': 'kill'}
  if get(a:opts, 'vertical', v:false)
    let l:opts['term_cols'] = a:opts['size']
    let l:opts['vertical'] = v:true
  else
    let l:opts['term_rows'] = a:opts['size']
  endif
  for key in keys(filter(copy(a:opts), 'v:key != "size" && v:key != "vertical"'))
    let l:opts[key] = a:opts[key]
  endfor

  let s:termrun_bufnr = term_start(a:cmd, l:opts)
  silent! execute('wincmd p')
endfunction
