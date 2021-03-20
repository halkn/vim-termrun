if exists('g:loaded_termrun')
  finish
endif
let g:loaded_termrun = 1

command -nargs=* -complete=dir TermRun call termrun#run#run(<f-args>)

nnoremap <Plug>(termrun-run) <cmd>call termrun#run#run()<CR>

if !hasmapto('<Plug>(termrun-run)')
   nmap <Leader>r <Plug>(termrun-run)
endif
