---
title: OpenSUSE
tags:
  - tech/distros/openSUSE
  - tech/distros/openSUSE/zypper
visibility: public
---

- Codec H.264 problems, e.g. with Firefox: [install from Packman or VLC](https://en.opensuse.org/SDB:Firefox_MP4/H.264_Video_Support)
- Firewall
  - *firewalld*: [Set up firewalld @cyberciti.biz](https://www.cyberciti.biz/faq/set-up-a-firewall-using-firewalld-on-opensuse-linux/) #tech/firewall
  - [NFTables](https://news.opensuse.org/2021/03/17/Playing-along-with-NFTables/)


## Zypper

```bash
# Update without user-interaction and agree to licenses
sudo zypper dup -yl
# find package providing file
zypper se --provides [--match-exact]
```


# Log

- 2023-03-21: after update mouse buttons were swapped. Changed settings to left-handed, but that's stupid. Found an entry in `~/.config/kcminputrc` with `XLbInptLeftHanded=true` and deleted it. Hopefully this will not revert the mouse buttons to being swapped on reboot. #hw/mouse #os/openSUSE
- KDE bug Night Color not deactivating for primary screen
  > I can confirm this problem.
  >
  > Additionally, when I attach my 2 monitors the primary will have night color enabled, the secondary not.
  >
  > To reset clicking the widget does not work. Changing the color temperature does.
  >
  > OS info
  > OS: openSUSE Tumbleweed