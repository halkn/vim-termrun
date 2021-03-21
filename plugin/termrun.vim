if exists('g:loaded_termrun')
  finish
endif
let g:loaded_termrun = 1

command -nargs=* -complete=dir TermRun call termrun#run#command(<f-args>)
command -nargs=* -complete=dir TermRunQuick call termrun#run#quick(<f-args>)
command -nargs=* -complete=dir TermRunTest call termrun#run#test(<f-args>)

nnoremap <Plug>(termrun-quick) <cmd>call termrun#run#quick()<CR>
nnoremap <Plug>(termrun-test)  <cmd>call termrun#run#test()<CR>
