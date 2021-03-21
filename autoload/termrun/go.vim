function! termrun#go#testfunc() abort
  let l:test = search('func \(Test\|Example\)', "bcnW")

  if l:test == 0
    echo "[termrun] no go test found immediate to cursor"
    return
  end

  let l:line = getline(test)
  let l:name = split(split(line, " ")[1], "(")[0]

  let l:opts = get(get(termrun#getconf(), 'go'), 'opts')
  let l:opts['cwd'] = './' .. expand('%:h')
  call termrun#exec(['go', 'test', '-v', '-run', l:name], l:opts)
endfunction
