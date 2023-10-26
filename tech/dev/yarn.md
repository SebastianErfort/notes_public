---
title: Yarn
type: software
category: package-manager
url: "https://classic.yarnpkg.com/en/"
docs: "https://classic.yarnpkg.com/en/docs"
source: "https://github.com/yarnpkg"
desc-short: |
  Fast, reliable, and secure dependency management
tags:
  - dev/javascript
  - dev/nodejs
---
`=this.img` `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`
## Directories

```bash
~/.config/yarn/global # installation directory for `global add` directory
```

## Commands

```bash
yarn install # install from package.json
yarn [global] add # install specific package by name
yarn global dir # show "global" installation path
```