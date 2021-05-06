if exists('g:loaded_termrun')
  finish
endif
let g:loaded_termrun = 1

command -nargs=* -complete=file TermRun call termrun#run#command(<f-args>)
command -nargs=* -complete=file TermRunQuick call termrun#run#quick(<f-args>)
command -nargs=* -complete=file TermRunTest call termrun#run#test(<f-args>)
command -nargs=* -complete=file TermRunClose call termrun#close()
command TermRunResume call termrun#resume()

nnoremap <Plug>(termrun-quick)  <cmd>call termrun#run#quick()<CR>
nnoremap <Plug>(termrun-test)   <cmd>call termrun#run#test()<CR>
nnoremap <Plug>(termrun-close)  <cmd>call termrun#close()<CR>
nnoremap <Plug>(termrun-resume) <cmd>call termrun#resume()<CR>
