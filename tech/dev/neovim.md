---
title: neovim
type: software
category:
  - editor
aliases:
  - nvim
  - neovim
  - NeoVIM
url: "https://neovim.io/"
visibility: public
---
# NeoVIM

See also

- my notes on [[dev/vim|vim]] and [[Editors]]
- [my config repo][nvim-config-repo]

## To-Do

Tags: #TODO/nvim

- [ ] Plugins
    - [ ] [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

## Installation

- from distro repos
- from archive
    1. download [archive](https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz)
    2. extract and move files for example to `~/.local`

## Config

Quick start with pre-made config

1. delete old config

    ```bash
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    ```

2. install base config
    - [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim):
        > A launch point for your personal nvim configuration. Just clone the repository as the nvim config and the next time you start nvim an automatic setup is started. ^kickstart-nvim
        - [Video *Effective Neovim: Instant IDE*](https://www.youtube.com/watch?v=stqUbv-5u2s) by TJ DeVries (developer of [[#^telescope|telescope.nvim]] and more)
    - [LazyVim](A launch point for your personal nvim configuration):
        > Neovim setup powered by [💤 lazy.nvim](https://github.com/folke/lazy.nvim) to make it easy to customize and extend your config
    - [NvChad](https://nvchad.com/): [Source](https://github.com/NvChad/NvChad)
        > Blazing fast Neovim config providing solid defaults and a beautiful UI, enhancing your neovim experience

3. edit config, transfer VIM settings


### Using vim config: .vimrc

<https://github.com/nanotee/nvim-lua-guide#runtime-files>
Most vim config can be used just as well in neovim. Just change your runtime path and source your vimrc.

```vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```

### Lua files

See [nvim Lua Guide](https://github.com/nanotee/nvim-lua-guide).

[Modules](https://github.com/nanotee/nvim-lua-guide#modules)
Config can be split up by including (lua) files. The tree structure should be something like

```
📂 ~/.config/nvim
├── 📂 lua
│   └─ config.lua
└── init.vim
```

allowing includes in your `init.vim` like

```vim
lua require('config')
```

[Sourcing Lua files](https://github.com/nanotee/nvim-lua-guide#sourcing-lua-files)
> Neovim provides 3 Ex commands to source Lua files
> `:luafile`
> `:source`

### LSP

- [LSP docs](https://neovim.io/doc/user/lsp.html)
- [[#Filetype|LSP plugins]]

## Plugins

See [awesome-neovim](https://github.com/rockerBOO/awesome-neovim) for a comprehensive list of categorised plugins.


Plugin managers

- [lazy.nvim](https://github.com/folke/lazy.nvim)
    > 💤 A modern plugin manager for Neovim
- [vim-plug]

### UI

- statusbar
    - [lualine](https://github.com/nvim-lualine/lualine.nvim)
- file explorer
    - [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua):
        > A file explorer tree for neovim written in lua
    - [neotree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim):
        > Neovim plugin to manage the file system and other tree like structures
- buffers/tabs
    - [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
    - [barbar]:
        > The neovim tabline plugin
- icons
    - [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [hologram.nvim](https://github.com/edluffy/hologram.nvim):
    > 👻 A cross platform terminal image viewer for Neovim. Extensible and fast, written in Lua and C. Works on macOS and Linux.
- [Noice](https://github.com/folke/noice.nvim):
    > 💥 Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu
- [NvUI (NvChad UI + Base46)](https://nvchad.com/news/nvui/)
- [Volt](https://nvchad.com/news/volt/)
  > Volt is a Neovim plugin to create interactive UIs within Neovim!

### Editing

- comment
    - [Comment.nvim](https://github.com/numToStr/Comment.nvim):
        > 🧠 💪 Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
- [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim):
    > EditorConfig plugin for Vim
- snippets
    - [vim-snippets](https://github.com/honza/vim-snippets)
- auto-completion
    - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp):
        > A completion plugin for neovim coded in Lua
    - [nvim-autopairs](https://github.com/windwp/nvim-autopairs):
        > A super powerful autopair plugin for Neovim that supports multiple characters.
- [true-zen.nvim](https://github.com/Pocco81/true-zen.nvim):
    > Clean and elegant distraction-free writing for NeoVim
- [nvim-osc52](https://github.com/ojroques/nvim-osc52):
    > copy text to the system clipboard using the ANSI OSC52 sequence

### Dev

- [telescope](https://github.com/nvim-telescope/telescope.nvim): `telescope.nvim` is a highly extendable fuzzy finder over lists. Built on the latest awesome features from `neovim` core. Telescope is centered around modularity, allowing for easy customization. ^telescope
- [trouble](https://github.com/folke/trouble.nvim):
    > 🚦 A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
- [nvim-docker](https://github.com/dgrbrady/nvim-docker):
    > Docker management right inside Neovim
- [gitlab.vim](https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim): official editor extension
- [oversee.nvim](https://github.com/stevearc/overseer.nvim)
    > A task runner and job management plugin for Neovim

### Filetype

- [nvim-markdown](https://github.com/ixru/nvim-markdown)
- [Mason](https://github.com/williamboman/mason.nvim): simplify installation of LSP servers, linters, formatters, etc.
    > Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.

### Productivity

- [Telekasten](https://github.com/renerocksai/telekasten.nvim):
    > A Neovim (lua) plugin for working with a markdown zettelkasten / wiki and mixing it with a journal, based on telescope.nvim
    - Demo/set-up: <https://dev.to/2kabhishek/i-made-a-video-about-taking-notes-in-neovim-2l5i>

## References

- [This Week in Neovim](https://this-week-in-neovim.org/)
- [Auto-run command (after save) @YouTube](https://www.youtube.com/watch?v=9gUatBHuXE0)
    - <https://github.com/stevearc/overseer.nvim>
- [lemmy-help: vim help doc from lua plugin](https://github.com/numToStr/lemmy-help)

[nvim-config-repo]: <https://github.com/SebastianErfort/kickstart.nvim>
[barbar]: <https://github.com/romgrk/barbar.nvim>
