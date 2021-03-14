# vim-termrun

This is vim plugin to run command in terminal with Vim8.

## Features

* `TermRun` command executes any command and outputs the result to terminal window.
* `<Plug>(termrun)` is mapping to execute editing file.
  * default mapping is `<leader>r`.

## Usage

Run the TermRun command as shown below.
The argument is executed as it is and the result is output to the Terminal window.

```vim
:TermRun ls -l
```

With no arguments or when use mapping `<Plug>(termrun)`, execute editing file.
The currently supported file types are:

| filetype | execute command |
|----------|-----------------|
| sh       | bash            |
| go       | go run          |
| mardkwon | [glow][1]       |

## Config

`g:termrun_config` is a dictionary with a step structure.
The following settings are examples and are the default settings.

```vim
let g:termrun_config = {
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
```

* filetype `_` is used as a file type independent setting.
* you can set two basic items in opts.
  * `vertical` is bool, if true the output window will be split vertically.
  * `size` is number for output window size

## Inspired

* [thinca/vim-quickrun][2]
* [skywind3000/asyncrun.vim][3]

[1]: https://github.com/charmbracelet/glow
[2]: https://github.com/thinca/vim-quickrun
[3]: https://github.com/skywind3000/asyncrun.vim
