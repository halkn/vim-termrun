let s:opts = get(get(termrun#getconf(), 'go'), 'opts')

function termrun#go#run(...) abort
  if a:0 == 0 | call termrun#run#run() | return | endif
  call termrun#exec(['go', 'run'] + a:000, s:opts)
endfunction

function termrun#go#test(...) abort
  if a:0 == 0
    let l:pkgs = ['./']
  else
    let l:pkgs = a:000
  endif
  call termrun#exec(['go', 'test'] + l:pkgs, s:opts)
endfunction

function! termrun#go#testfunc() abort
  let l:test = search('func \(Test\|Example\)', "bcnW")

  if l:test == 0
    echo "[termrun] no go test found immediate to cursor"
    return
  end

  let l:line = getline(test)
  let l:name = split(split(line, " ")[1], "(")[0]

  let l:opts = deepcopy(s:opts)
  let l:opts['cwd'] = './' .. expand('%:h')
  call termrun#exec(['go', 'test', '-v', '-run', l:name], l:opts)
endfunction
