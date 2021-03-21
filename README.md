# vim-termrun

This is vim plugin to run command in terminal with Vim8.

## Features

* `TermRun` command executes any command and outputs the result to terminal window.
* `<Plug>(termrun-run)` is mapping to execute editing file.
  * default mapping is `<leader>r`.
* `TermRunTest` command executes a test command for each filetype.

## Usage

### `TermRun`

Run the TermRun command as shown below.
The argument is executed as it is and the result is output to the Terminal window.

```vim
:TermRun ls -l
```

With no arguments or when use mapping `<Plug>(termrun-run)`, execute editing file.

### `TermRunTest`

Run the `TermRunTest` command as shown below.
The argument is executed as it is and the result is output to the Terminal window.
The example below is a command to execute all tests under the current directory in Golang.

```vim
:TermRunTest ./...
```

With no arguments, run the default test command set in `g:termrun_config`.

### Suppourted FileType

| filetype | run command | test command |
|----------|-------------|--------------|
| sh       | bash        | -            |
| go       | go run      | go test      |
| mardkwon | [glow][1]   | -            |

## Config

`g:termrun_config` is a dictionary with a step structure.
The following settings are examples and are the default settings.

```vim
let g:termrun_config = {
\ '_':  { 'opts': {} },
\ 'sh': { 'run': ['bash'], 'opts': {} },
\ 'go': { 
\   'run': ['go', 'run'],
\   'test': { 'cmd': ['go', 'test'], 'target': '%:p:h' },
\   'opts': {} 
\ },
\ 'markdown': {
\   'run': ['glow'],
\   'opts': {'vertical': v:true, 'term_cols': &columns/2}
\ }
\ }
```

* filetype `_` is used as a file type independent setting.
* `opts` can have the same options as `term_start()`. See `:h term_start()`
* The `target` item in `test` is expanded with `expand()` in vim function.

## Inspired

* [thinca/vim-quickrun][2]
* [skywind3000/asyncrun.vim][3]

[1]: https://github.com/charmbracelet/glow
[2]: https://github.com/thinca/vim-quickrun
[3]: https://github.com/skywind3000/asyncrun.vim
