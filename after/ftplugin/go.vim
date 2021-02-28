if exists('b:vim_termrun_ftplugin_loaded')
  finish
endif
let b:vim_termrun_ftplugin_loaded = 1

command! -buffer -nargs=* -complete=dir TermRunGoRun call termrun#go#run(<f-args>)
command! -buffer -nargs=* -complete=dir TermRunGoTest call termrun#go#test(<f-args>)
command! -buffer TermRunGoTestAll call termrun#go#test('./...')
command! -buffer TermRunGoTestPackage call termrun#go#test('./' .. expand('%:h'))
command! -buffer TermRunGoTestFunc call termrun#go#testfunc()

nnoremap <Plug>(termrun-go-run) <cmd>call termrun#go#run()<CR>
nnoremap <Plug>(termrun-go-test-all) <cmd>call termrun#go#test('./...')<CR>
nnoremap <Plug>(termrun-go-test-pkg) <cmd>call termrun#go#test('./' .. expand('%:h'))<CR>
nnoremap <Plug>(termrun-go-test-func) <cmd>call termrun#go#testfunc()<CR>
