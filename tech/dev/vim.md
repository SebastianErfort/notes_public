---
title: VIM
aliases: vim
tags: dev/vim dev/programming dev/editor
visibility: public
---

[<img src="file:///home/erfort/rsrc/VIM_reference_poster.png" style="width:80%"/>](file:///home/erfort/rsrc/VIM_reference_poster.png)
See also [[neovim|my notes on neovim]] and [[Editors]].


# Basics


## Registers

- list: `:registers`
- `"a-z`: named registers


## Search

- find lines longer than n characters: `/\%>80v.\+`


## Files, buffers, ...

- [Modeline](https://vim.fandom.com/wiki/Modeline_magic): VIM settings in file itself
  - for `root` usually disabled for security
  Example:
    ```bash
    # vim: ft=yaml tw=4 sw=4
    ```

_Remote file editing_
```bash
vim scp://user@host[:port]//path/to/file
```
also supports `sftp`, `http` (read-only), `rsync`


# Commands

## Auto-commands

```vim
" execute script after writing file (https://stackoverflow.com/a/4628210/16096134) or use inotify
:autocmd BufWritePost * !run_tests.sh <afile>
```


# Plugins

Plugin managers

- [vim-plug](https://github.com/junegunn/vim-plug/master/plug.vim)
- [vim-pathogen](https://github.com/tpope/vim-pathogen)


## Config

- [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim): use https://editorconfig.org files


## Editing

- YouCompleteMe
  - Needs compilation
    - dependencies: `cmake`, `pythonXX-devel`
    - then run `./install.py` in the plugin's directory
- [sideways](https://github.com/AndrewRadev/sideways.vim): move function arguments (and other delimited-by-something items) left and right
- Programming languages
  - ruby
    - [vim-ruby](https://github.com/vim-ruby/vim-ruby)
  - HTML
    - [tagalong.vim](https://github.com/AndrewRadev/tagalong.vim): Change an HTML(ish) opening tag and take the closing one along as well
- [vim-pandoc](https://github.com/vim-pandoc/vim-pandoc): pandoc integration and utilities for vim
- [vim-tabular]():
    - [article](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/): gist for automatic indentation/tabularisation when typing for example `|`


# Aesthetics, customisation

[Color scheme highlight groups](https://github.com/norcalli/nvim-base16.lua/blob/master/lua/base16.lua#L102)
Show highlight group used for code under cursor:
```vim
:command! SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
```

_Fancy font with fancy icons_
Plugin `iryanoasis/vim-devicons` with patched font as described in `iryanoasis/nerd-fonts`.
For example font Hack

- download patched font files (ttf) from repo and copy them to a directory that is checked for fonts, for example `~/.fonts`  or `/usr/share/fonts`
- rebuild font cache `fc-cache -f -v`