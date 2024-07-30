---
title: Shorewall
tags:
  - security/firewall
  - tech/networking/tools/iptables
type: software
category: firewall
code: open source
license: GNU GPLv2+
website: "https://shorewall.org/"
desc-short: "Shorewall is a gateway/firewall configuration tool for GNU/Linux.\nFor a high level description of Shorewall, see the [Introduction to Shorewall](https://shorewall.org/Introduction.html). To review Shorewall functionality, see the [Features Page](https://shorewall.org/shorewall_features.htm).\n"
visibility: public
---
- using [[iptables]], but much more convenient

```bash
shorewall safe-restart
shorewall restart -f
shorewall clear # resets stuff
```