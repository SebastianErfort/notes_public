---
title: KDE
visibility: public
---

## KDE Plasma

- Fix task manager panel disappearing when disconnecting external monitor: edit `~/.config/plasma-org.kde.plasma.desktop-appletsrc`: `lastScreen=0`
  and execute

  ```bash
  nohup kquitapp5 plasmashell && kstart5 plasmashell >/dev/null 2>&1 &
  ```

### Plasma Widgets - Plasmoids

[Tutorial](https://develop.kde.org/docs/extend/plasma/widget/)

## KWin

- scripts
    - [Polonium](https://zeroxoneafour.github.io/polonium/): tiling window manager, extending [[KWin]] ($\geq$ 5.27), for [[Wayland]] only
      [GitHub](https://github.com/zeroxoneafour/polonium) ^bee181

## Software

- Konsole terminal emulator ^57973e
