# vim-termrun

This is vim plugin to run command in terminal with Vim8.

## Features

* `TermRun` command executes any command and outputs the result to terminal window.
* `<Plug>(termrun-run)` is mapping to execute editing file.
  * default mapping is `<leader>r`.

## Usage

Run the TermRun command as shown below.
The argument is executed as it is and the result is output to the Terminal window.

```vim
:TermRun ls -l
```

With no arguments or when use mapping `<Plug>(termrun-run)`, execute editing file.
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
\ '_':  { 'opts': {} },
\ 'sh': { 'run': ['bash'], 'opts': {} },
\ 'go': { 'run': ['go', 'run'], 'opts': {} },
\ 'markdown': {
\   'run': ['glow'],
\   'opts': {'vertical': v:true, 'term_cols': &columns/2}
\ }
\ }
```

* filetype `_` is used as a file type independent setting.
* `opts` can have the same options as `term_start()`. See `:h term_start()`

## Inspired

* [thinca/vim-quickrun][2]
* [skywind3000/asyncrun.vim][3]

[1]: https://github.com/charmbracelet/glow
[2]: https://github.com/thinca/vim-quickrun
[3]: https://github.com/skywind3000/asyncrun.vim
