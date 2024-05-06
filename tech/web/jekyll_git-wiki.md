---
status: rejected
title: Jekyll Git-Wiki
---
## Jekyll Page with Git-Wiki Theme

⚠ Obsolete, we're using MkDocs

1. clone [skeleton repo](https://github.com/Drassil/git-wiki-skeleton)

    ```bash
    git clone https://github.com/Drassil/git-wiki-skeleton.git
    ```

1. chose `Gemfile` from folder `.env-files`, e.g. `Gemfile.gitlab`, and copy/symlink to base folder. Then add missing gems

    ```ruby
    gem 'kramdown'
    gem 'kramdown-parser-gfm'
    gem 'webrick'
    ```

1. install gems with bundle

    ```bash
    bundle config set --local path '.bundle' # set gem installation folder
    bundle install
    ```

1. serve website locally for editing

    ```
    bundle exec jekyll serve
    ```

1. add note sources as Git submodules

    ```bash
    git submodule add URL wiki/submoddir
    ```

1. if building fails due to unsupported file names or metadata (YAML frontmatter), fix them
1. after editing locally, copy the `_site` folder and serve as static website wherever you want. Alternatively build directly with

    ```bash
    bundle exec jekyll build
    ```

#### Jekyll Issues

- [ ] doesn't support Wiki-links `[[...]]`, needs to be translated
- [ ] Jekyll dumps all HTML files in one directory instead of keeping the subdirectory structure. This breaks relative links.
- [x] Something in my notes (when integrated as Git submodule) makes Jekyll fail to serve with a `Liquid` error on sorting. Potential causes
    - `date` YAML key not in proper format (e.g. `yyyy-mm-dd`):
    `cit/Disk_encryption`, `lwp/AppArmor_vs_SELinux.md`
