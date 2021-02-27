if exists('g:loaded_termrun')
  finish
endif
let g:loaded_termrun = 1

command -nargs=* -complete=dir TermRun call termrun#run(<f-args>)

nnoremap <Plug>(termrun) <cmd>call termrun#run()<CR>

if !hasmapto('<Plug>(termrun)')
   nmap <Leader>r <Plug>(termrun)
endif
