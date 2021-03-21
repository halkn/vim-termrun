if exists('b:vim_termrun_ftplugin_loaded')
  finish
endif
let b:vim_termrun_ftplugin_loaded = 1

command! -buffer TermRunGoTestFunc call termrun#go#testfunc()
nnoremap <Plug>(termrun-gotest-func) <cmd>call termrun#go#testfunc()<CR>
