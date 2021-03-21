# vim-termrun

This is vim plugin to run command in terminal with Vim8.

## Features

* `TermRun` command executes any command and outputs the result to terminal window.
* `TermRunQuick` command executes a quick command for each filetype.
* `TermRunTest` command executes a test command for each filetype.

## Usage

### TermRun

Run the TermRun command as shown below.
The argument is executed as it is and the result is output to the Terminal window.

```vim
:TermRun ls -l
```

### TermRunQuick and TermRunTest

Executes the command set for each filetype.

* With no arguments, it will be executed with the preset contents.
  * `TermRunQuick` targets the current buffer.
  * The target of `TermRunTest` is specified by the setting.
* If an argument is given, it will be executed as an argument of each command.

### Suppourted FileType

| filetype | quick command | test command |
|----------|---------------|--------------|
| sh       | bash          | -            |
| go       | go run        | go test      |
| mardkwon | [glow][1]     | -            |

## Config

`g:termrun_config` is a dictionary with a step structure.
The following settings are examples and are the default settings.

```vim
let g:termrun_config = {
\ '_':  { 'opts': {} },
\ 'sh': { 
\   'quick': { 'cmd': ['bash'] },
\   'opts': {}
\  },
\ 'go': { 
\   'quick':{ 'cmd': ['go', 'run'] },
\   'test': { 'cmd': ['go', 'test'], 'target': '%:p:h' },
\   'opts': {} 
\ },
\ 'markdown': {
\   'quick': { 'cmd': ['glow'] },
\   'opts': {'vertical': v:true, 'term_cols': &columns/2}
\ }
\ }
```

* The first key is the filetype.
  * filetype `_` is used as a filetype independent setting.
* `quick` and `test` are dictionaries with the following keys.
  * `cmd` is List of execution commands and arguments.
  * `target` is String that test target directory or file.
    * The set character string is expanded with `expand()` in vim function.
* `opts` can have the same options as `term_start()`. See `:h term_start()`

## Inspired

* [thinca/vim-quickrun][2]
* [skywind3000/asyncrun.vim][3]

[1]: https://github.com/charmbracelet/glow
[2]: https://github.com/thinca/vim-quickrun
[3]: https://github.com/skywind3000/asyncrun.vim
