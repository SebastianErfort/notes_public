---
title: Firefox
type: software
category: ""
# url: ""
# docs: ""
# source: ""
# developer: ""
# desc-short: |
#   ...
tags: []
visibility: public
---
`=this.img` `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

## Extensions

### FoxyProxy

Allows to use multiple proxy servers, selected by wildcard or regex patterns.

For example set up usage of a (SSH) SOCKS proxy[^1]

1. set up connection to SOCKS proxy, e.g. with port 1080 (standard port for SOCKS)
2. configure proxy
   IP address: 127.0.0.1
   port: 1080
3. edit patterns to match websites you want to access via proxy

![|300](FoxyProxy_config.png "FoxyProxy proxy configuration")
![|300](FoxyProxy_patterns.png "FoxyProxy proxy patterns")
![|200](FoxyProxy_extension_popup.png "FoxyProxy extension pop-up")

[^1]: [[ssh#SOCKS proxy]]
