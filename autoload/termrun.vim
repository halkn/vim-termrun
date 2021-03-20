let s:config = {}
function termrun#getconf() abort
  if s:config != {} | return s:config | endif

  " This is defalult config.
  let s:config = {
  \ '_':  { 'opts': {} },
  \ 'sh': { 'run': ['bash'], 'opts': {} },
  \ 'go': { 'run': ['go', 'run'], 'opts': {} },
  \ 'markdown': {
  \   'run': ['glow'],
  \   'opts': {'vertical': v:true, 'term_cols': &columns/2}
  \ }
  \ }

  " If user config is defeined, Overwide default.
  let l:conf = get(g:, 'termrun_config', {})
  for ft in keys(l:conf)
    let s:config[ft]['run'] = get(l:conf[ft], 'run', s:config[ft]['run'])
    let s:config[ft]['opts'] = get(l:conf[ft], 'opts', s:config[ft]['opts'])
  endfor
  return s:config
endfunction

let s:termrun_bufnr = -1
" @param {cmd} = List " exec command
" @param {conf} = dict " see s:config
function termrun#exec(cmd, opts) abort
  let l:run_win_nr = bufwinnr(s:termrun_bufnr)
  if l:run_win_nr != -1
    silent! execute l:run_win_nr .. 'wincmd c'
  endif

  let l:opts = {'norestore': v:true, 'term_kill': 'kill'}
  for key in keys(a:opts)
    let l:opts[key] = a:opts[key]
  endfor

  let s:termrun_bufnr = term_start(a:cmd, l:opts)
  silent! execute('wincmd p')
endfunction
