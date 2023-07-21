---
title: neovim
type: software
category: editor
aliases: nvim
url: "https://neovim.io/"
visibility: public
---

See also my notes on [[vim]] and [[Editors]].

## To-Do
#TODO/nvim
- [ ] Plugins
  - [ ] [![|20](github.png) nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

### Links
[This Week in Neovim](https://this-week-in-neovim.org/)

- [Auto-run command (after save) @YouTube](https://www.youtube.com/watch?v=9gUatBHuXE0)
  - https://github.com/stevearc/overseer.nvim
- [lemmy-help: vim help doc from lua plugin](https://github.com/numToStr/lemmy-help)
- [Blog-entry switching from CoC to neovim native LSP](https://www.vikasraj.dev/blog/lsp-neovim-retrospective)
- [reddit discussion about neovim plugins and configuration overhead](https://www.reddit.com/r/neovim/comments/wehqqr/some_constructive_criticism_for_the_hard_working/)

## Config

- [Video *Effective Neovim: Instant IDE*](https://www.youtube.com/watch?v=stqUbv-5u2s) by TJ DeVries (developer of [[#^34282b|telescope.nvim]] and more): [[#^f8af35|kickstart.nvim]] config repo

### Using vim config: .vimrc
https://github.com/nanotee/nvim-lua-guide#runtime-files
Most vim config can be used just as well in neovim. Just change your runtime path and source your vimrc.
```vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```

### Lua files
https://github.com/nanotee/nvim-lua-guide

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
>   `:luafile`
>   `:source`

### LSP

https://neovim.io/doc/user/lsp.html

## Plugins

See [awesome-neovim](https://github.com/rockerBOO/awesome-neovim) for a comprehensive list of categorised plugins.

Quick start with premade config

1. delete old config
    ```bash
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    ```
2. install base config
    - [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim): A launch point for your personal nvim configuration. Just clone the repository as the nvim config and the next time you start nvim an automatic setup is started. ^f8af35
    - [LazyVim](A launch point for your personal nvim configuration): Neovim setup powered by [💤 lazy.nvim](https://github.com/folke/lazy.nvim) to make it easy to customize and extend your config
    - [NvChad](https://nvchad.com/) Blazing fast Neovim config providing solid defaults and a beautiful UI, enhancing your neovim experience
            [Website](https://github.com/NvChad/NvChad)
3. edit config, transfer VIM settings

Plugin managers
- [lazy.nvim](https://github.com/folke/lazy.nvim): ![zzz|20](https://github.githubassets.com/images/icons/emoji/unicode/1f4a4.png) A modern plugin manager for Neovim
- [vim-plug]

### UI
- [Noice](https://github.com/folke/noice.nvim): ![boom|20](https://github.githubassets.com/images/icons/emoji/unicode/1f4a5.png) Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu
- file explorer
    - [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua): A file explorer tree for neovim written in lua
    - [neotree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim): Neovim plugin to manage the file system and other tree like structures
- buffers/tabs
    - [barbar](): The neovim tabline plugin
    - [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- icons
    - [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [hologram.nvim](https://github.com/edluffy/hologram.nvim): ![ghost|20](https://github.githubassets.com/images/icons/emoji/unicode/1f47b.png) A cross platform terminal image viewer for Neovim. Extensible and fast, written in Lua and C. Works on macOS and Linux.

### Editing

- comment
    - [Comment.nvim](https://github.com/numToStr/Comment.nvim): ![brain|20](https://github.githubassets.com/images/icons/emoji/unicode/1f9e0.png) ![muscle|20](https://github.githubassets.com/images/icons/emoji/unicode/1f4aa.png) // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
- [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim): EditorConfig plugin for Vim
- [nvim-osc52](https://github.com/ojroques/nvim-osc52): copy text to the system clipboard using the ANSI OSC52 sequence
- [true-zen.nvim](https://github.com/Pocco81/true-zen.nvim): Clean and elegant distraction-free writing for NeoVim
- snippets
    - [vim-snippets](https://github.com/honza/vim-snippets)
- auto-completion
    - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): A completion plugin for neovim coded in Lua
    - [nvim-autopairs](https://github.com/windwp/nvim-autopairs): A super powerful autopair plugin for Neovim that supports multiple characters.
### Dev

- [telescope](https://github.com/nvim-telescope/telescope.nvim): `telescope.nvim` is a highly extendable fuzzy finder over lists. Built on the latest awesome features from `neovim` core. Telescope is centered around modularity, allowing for easy customization. ^34282b
- [trouble](https://github.com/folke/trouble.nvim): ![vertical_traffic_light|20](https://github.githubassets.com/images/icons/emoji/unicode/1f6a6.png) A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
- [nvim-docker](https://github.com/dgrbrady/nvim-docker): Docker management right inside Neovim

### Filetype

- https://github.com/ixru/nvim-markdown

### LSP

- https://github.com/artempyanykh/marksman
- LSP/auto-completion
  - [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim): configure `nvim-lspconfig` and `nvim-cmp`
- [![|20](github.png) lsp-colors](https://github.com/folke/lsp-colors.nvim): ![rainbow|20](https://github.githubassets.com/images/icons/emoji/unicode/1f308.png) Plugin that creates missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin LSP client.
- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim): Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  - [Builtins](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#vale)

### Productivity

- [Telekasten](https://github.com/renerocksai/telekasten.nvim): A Neovim (lua) plugin for working with a markdown zettelkasten / wiki and mixing it with a journal, based on [[#^34282b|telescope.nvim]]
  - Demo/set-up: https://dev.to/2kabhishek/i-made-a-video-about-taking-notes-in-neovim-2l5i