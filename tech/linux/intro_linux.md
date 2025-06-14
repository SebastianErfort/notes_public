---
title: Introduction to Linux
---

[[linux/linux|Linux]]

- [[linux/linux#Command Line|command line]]
    - terminal emulators: GUI programs to access terminal, e.g. [[alacritty]]
    - shells: POSIX
        - sh
        - [[bash]]
            - config: `$HOME/.bashrc`, `$HOME/.inputrc` etc.
        - [[zsh]] (default on MacOS)
    - commands/programs
        - [`man` pages](https://www.kernel.org/doc/man-pages/)
        - [[bash#History|command history]]
        - cheat sheets and command line tools: [[unix_command_reference.pdf|Unix cheat sheet]], [cheat] CLI tool
    - remote access: [[ssh]]
- [[linux/linux#System|system]]
    - [[linux#Kernel|Linux Kernel]]
    - [[linux#Files & Directories|files and directories, permissions]]

        ```bash
        cd         # change directory
        mv         # move/rename files
        ls [-hlaF] # list files/dir.s
        tree       # files/dir. tree
        grep       # search file contents
        find       # search files/dir.s (and do something with them)
        ```

    - [[linux#Users & Groups|users and groups]]
        - `root` (uid = 0)
        - users (uid >= 1000)
        - show user groups: `groups [uid]`
    - [[linux#Partitions, File Systems and Swap|disks, partitions and filesystems]]

        ```bash
        df          # disk filesystem usage
        du          # directory disk usage
        lsblk       # disk, parition and fs info (w/o root)
        sudo parted # info and editing - changes written immediately
        sudo fdisk  # info and editiong - no changes until 'write'
        ```

    - processes
        - background processes
        - process management

            ```bash
            top
            ps
            kill
            pkill
            ```

    - services and units
        - [[systemd]] (most distributions) vs. [[initd]] (rare these days)
        - units: services (often *daemons*), sockets, ...

            ```bash
            systemctl list-units [--type service]
            systemctl status/start/stop/enable/disable <unit>
            ```

    - logs
        - generally in `/var/log/`
        - `journalctl [-b] [--since <date>] [-t <identifier>]`
    - config
        - system: mostly `/etc`
        - user: `$HOME/.*rc`, `$HOME/.config/`
    - [[_networking|networking]]
        - many network management tools: NetworkManager, netplan, ...
- [[linux/linux#Distributions|distributions (OS)]]
    - [[public/tech/linux/Debian]]
        - [[Ubuntu]]
    - [[RedHat]]
        - CentOS (end of life)
        - [[Rocky]]
        - Alma
        - Fedora
    - SUSE
        - [[openSUSE]]
    - Arch
- desktops (UI)
    - Gnome
    - XFCE
    - [[KDE]] (Plasma)


## References

[cheat]: <https://github.com/cheat/cheat/>
