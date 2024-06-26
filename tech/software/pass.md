---
title: pass
aliases:
  - passwordstore
type: software
category:
  - password-manager
url: "http://www.passwordstore.org/"
docs: "https://git.zx2c4.com/password-store/about/"
source: ""
developer: Jason A. Donenfeld <Jason@zx2c4.com>
desc-short: the standard unix password manager
tags: ""
desc: |
  Password management should be simple and follow Unix philosophy. With pass, each password lives inside of a gpg encrypted file whose filename is the title of the website or resource that requires the password. These encrypted files may be organized into meaningful folder hierarchies, copied from computer to computer, and, in general, manipulated using standard command line file management utilities.
  pass makes managing these individual password files extremely easy. All passwords live in ~/.password-store, and pass provides some nice commands for adding, editing, generating, and retrieving passwords. It is a very short and simple shell script. It's capable of temporarily putting passwords on your clipboard and tracking password changes using git.
  You can edit the password store using ordinary unix shell commands alongside the pass command. There are no funky file formats or new paradigms to learn. There is bash completion so that you can simply hit tab to fill in names and commands, as well as completion for zsh and fish available in the completion folder. The very active community has produced many impressive clients and GUIs for other platforms as well as extensions for pass itself.
visibility: public
up:
  - "[[gpg]]"
---

# `=this.title`

`=this.img` `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`
