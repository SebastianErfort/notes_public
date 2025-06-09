---
title: Linux
tags:
  - linux
  - dev/bash
visibility: public
---
# Linux

Installation

- [Microsoft: Install Linux](https://learn.microsoft.com/en-us/linux/install)

## Command Line

- shells: [[bash]], [[zsh]]
- terminal emulators (GUI, often with tabs, split view and customisation): for example [[alacritty]] and [[kitty]]
- editors: for example [[dev/vim|vim]] and [[neovim]]
- environment
    - [Environment modules](https://modules.sourceforge.net/)
- cheat sheets and CLI tools
    - [[UbuntuServerCLI_cheatsheet.pdf|Ubuntu Server CLI Cheatsheet]] | [download](https://github.com/canonical-web-and-design/ubuntu.com/files/3989524/Ubuntu.Server.CLI.pro.tips.1.pdf)
    - [cheat] CLI tool
- multiplexing (multiple terminal sessions in one window, e.g. split screen): [[tmux]], [GNU screen][screen]

### Keyboard

See [readline man page](https://www.man7.org/linux/man-pages/man3/readline.3.html).

| Shortcut                  | Description                                                                                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <kbd>ctrl+c</kbd>         | Interrupt program.                                                                                                                                                  |
| <kbd>ctrl+d</kbd>         | Exit e.g. program or shell.                                                                                                                                         |
| <kbd>ctrl+a</kbd>         | Move to the start of the line. Same as **Home**.                                                                                                                    |
| <kbd>ctrl+e</kbd>         | Move to the end of the line. Same as **End**.                                                                                                                       |
| <kbd>ctrl+f</kbd>         | Move forward through the line _one letter_ at a time. Same as **Right Arrow**.                                                                                      |
| <kbd>ctrl+b</kbd>         | Move backward through the line _one letter_ at a time. Same as **Left Arrow**.                                                                                      |
| <kbd>alt+f</kbd>          | Move forward through the line _one word_ at a time. Same as **Ctrl+Right Arrow**.                                                                                   |
| <kbd>alt+b</kbd>          | Move backward through the line _one word_ at a time. Same as **Ctrl+Left Arrow**.                                                                                   |
| <kbd>ctrl+u</kbd>         | Delete from the cursor position to the start of the line.                                                                                                           |
| <kbd>ctrl+k</kbd>         | Delete from the cursor position to the end of the line.                                                                                                             |
| <kbd>ctrl+w</kbd>         | Delete a word to the left. Same as **Alt+Backspace**.                                                                                                               |
| <kbd>alt+d</kbd>          | Delete a word to the right.                                                                                                                                         |
| <kbd>ctrl+/</kbd>         | Undo. Yes, the command line has an undo option.                                                                                                                     |
| <kbd>ctrl+r</kd>          | Search history                                                                                                                                                      |
| <kbd>ctrl+x, ctrl+e</kbd> | editing mode in default editor to enter commands like you would in a script, executed upon save+close. Also great when pasting (longer) scripts into your terminal. |


## Commands & Tools

[The Linux _man-pages_ project](https://www.kernel.org/doc/man-pages/)
[tldr pages](https://tldr.sh/)
[How to create a man page](https://www.golinuxcloud.com/create-man-page-template-linux-with-examples/)

### Files & Directories

- Files

    ```sh
      stat <file> # file (system) info
    ```

- *Permissions*
    - `umask`: modify file/directory permissions, subtracted from default permissions [davemckay@howtogeek](https://www.howtogeek.com/812961/umask-linux/)
- *Searching & Navigation*
    - `find`

        ```shell
        find work -type d -execdir echo "In:" {} \; # find directories and print names
        find work -name "*.txt" -type f -execdir echo "Found:" {} \; # find .txt files
        find . -inum file/pattern -exec rm {} + # delete files by inode
        ```

    - `tree`: show file/directory tree

        ```bash
        tree -d # only show directories
        tree -L 2 # set level up to  which branches are shown
        ```

        *Sparse Files*
[Sparse files @ArchWiki](https://wiki.archlinux.org/title/sparse_file)
[Find sparse files](https://www.thegeekdiary.com/how-to-find-all-the-sparse-file-in-linux/) (includes a lot of files with sparseness 0 in `/`, e.g. buses)

```bash
ll -h file # show apparent size
du -h file # show actual size
find /var/log -type f -printf "%S\t%p\n" | gawk '$1 < 1.0 && $1 > 0.0 {print}'
## 0.957347        /var/log/journal/59c5fd0e8f8f4098999a0294185c5a04/system@cfc3c6cd1b3e47ceac5de67a2ee443d1-000000000002d055-0005dc4be7e8ffa8.journal
## 0.960842        /var/log/journal/59c5fd0e8f8f4098999a0294185c5a04/system@cfc3c6cd1b3e47ceac5de67a2ee443d1-0000000000051b70-0005de2bd9b8a8c5.journal
## 0.069997        /var/log/lastlog
```

### Users & Groups

- files: `/etc/{passwd,group,shadow}`
- `getent` command: `getent passwd USERNAME/ID` , `getent group GROUPNAME/ID`
- passwords
    - `chage`: change user password expiry information

        ```bash
        chage -l username # show expiry info for user's password
        chage -M num_days username # change password expiry duration
        ```

    - expire users' password and force setting a new one at next login: `passwd --expire username`

Groups

```bash
# add user to group
sudo usermod -aG <group name> <user name>
# activate new group membership without logging out
newgrp <group name>
# check group membership
groups [<user>]
id <user>
```

### File/stream processing/manipulation

- [[awk]]
- [[sed]]
- head/tail
- cut

### Partitions, File Systems and Swap

![[partitions_filesystems]]

### Network, remote

See also [[_networking|Networking]].

- [wget vs. curl @howtogeek](https://www.howtogeek.com/816518/curl-vs-wget/)
- [[bullhorn/ssh]]

[@howtogeek](https://www.howtogeek.com/813741/linux-arping-command/)

Tags: #linux/systemd network adapter naming: <https://systemd.io/PREDICTABLE_INTERFACE_NAMES/>)

- disable through kernel parameter ``net.ifnames=0``
- [Netplan.io](https://netplan.io/)
- [custom alternative network adapter names](https://lwn.net/Articles/794289/)
- [run commands on remote machine through SSH](https://www.howtogeek.com/825102/how-to-run-a-local-script-on-a-remote-linux-server/) #tech/ssh

```bash
ssh user@host "bash -s" < script.sh
ssh user@host "bash -s" -- < script.sh "First" "Second" # pass arguments
## run part of script remote
ssh -T user@host << _remote_commands
cd /home/dave/Documents
## Finally, update the timestamp file
echo "userscript.sh:" $(date) >> ~/timestamp.txt
_remote_commands
```

### Passwords & Security

Create password hash

```bash
mkpasswd [-m algorithm, e.g. sha-512] [-S $salt]
```

Tags: #sw/pass: generate password with hopefully save set of special characters

```bash
PASSWORD_STORE_CHARACTER_SET="[a-zA-Z0-9]"'\!@#$%^&*()-_=+[]{};:.<>\/|' pass generate name length
```

base64-encoding: (SSL) certificates, (Kubernetes) secrets, store multi-line strings in variables, etc.
<https://www.redhat.com/sysadmin/base64-encoding>

```bash
CONFIG=$(base64 -w 0 config.yaml) # convert multi-line file to base64 string w/o newlines in immediate output (-w 0)
echo $CONFIG | base64 -d # decode
```

### Processes: Monitoring and Analysis

- `(h)top`
- `ps`

    ```bash
    ps -fC cmd # find processes for command cmd
    ```

- detach/disown a process from the current terminal (so it keeps running when you close it)

    ```bash
    # ctrl+z to stop the process
    bg %<job number> # continue job in background
    disown %<job number> # detach from current terminal
    ```

    To move a process to a different terminal, consider [reptyr](https://github.com/nelhage/reptyr).

- System Signals: [Snippets](file://rsc/bash/trap_signal.sh)
    - [Linux Signals davemckay@howtogeek](https://www.howtogeek.com/814925/linux-signals-bash/)
    - list Signals: `trap -l`
    - print set Signal traps: `trap -p`
    - common case: ctrl+c sends `SIGINT`, so trap it and clean up before exiting

        ```bash
        trap graceful_shutdown SIGINT SIGQUIT SIGTERM
        graceful_shutdown() {
          echo -e "\nRemoving temporary file:" $temp_file
          rm -rf "$temp_file"
          exit
        }
        ```

- processes using GPU: `lsof /dev/nvidia` #tech/graphics #tech/GPU #tech/nvidia
- *Cronjobs*
    - [Crontab Generator](https://crontab-generator.org/)

### Images, Videos

- (image) file conversion
    - decode QR code: `zbarimg -q --nodbus qrcode.png`
    - encode text to QR code: `qrencode -o qrcode.png 'STRING'`
        *exiftools*
- [change metadata @linuxconfig.org](https://linuxconfig.org/how-to-get-and-change-image-metadata-in-linux)
- man page examples
    - change metadata for entire folder, using metadata as variables: `exiftool '-comment<ISO=$exif:iso Exposure=${shutterspeed}' dir`

### Software
>
> [!info]- [[_software#Linux|Linux Software]]
> ![[_software#Linux]]

## System


### Configuration

The system configuration is mostly in `/etc`, system-wide user configuration in `/usr` and users' personal configuration in `$HOME/.config` or (hidden) `rc` files `$HOME/.*rc`.


### Kernel

- show kernel version: `uname -r`
- list installed kernels
    - Debian/Ubuntu: `dpkg --list | grep linux-image`


### Sudo

> [!info]- [[sudo]]
> ![[sudo]]


### Mounting

```bash
## root
mount
umount
## user
udisksctl mount -b /dev/sda # user-mount block device w/o root perm.
udisksctl unmount -b /dev/sda # unmount
## SSHFS
sshfs user@host:<path> <target> # use fuse and SSH to mount remote directory
fusermount -u <target> # unmount directory
```

### Time and Date

```bash
timedatectl # show time and date info
timedatectl list-timezones
timedatectl set-timezone Europe/Berlin # change timezone
timedatectl set-time hh:mm:ss
timedatectl set-time yyyy-mm-dd
timedatectl set-ntp true # activate using NTP
## if timedatectl shows NTP synchronized: no
systemctl restart systemd-timedated
```

See also [[_networking#NTP|NTP]].

### Hostname

`/etc/{hosts,hostname}`

```bash
hostname
hostnamectl
hostnamectl set-hostname new_hostname
```

### Locale

`locale`, `localectl [status]`, `/etc/default/locale`
change locale

```bash
$ sudo update-locale LANG=LANG=en_IN.UTF-8 LANGUAGE
## OR
$ sudo localectl set-locale LANG=en_IN.UTF-8
```

Keyboard layout

```bash
loadkeys <local> # for command line
setxkbdmap <locale> # for X
```

### Fonts

See also [[design#Fonts]].

Custom fonts can be put for example in `~/.local/share/fonts`, then edit/create file `~/.fonts.conf` with content

```xml
<?xml version="1.0"?><!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <dir>~/.local/share/fonts</dir>
</fontconfig>
```

Commands

```bash
fc-list [pattern [element... ]] # list available fonts
fc-cache -f -v [dir]            # refresh fonts
```

### Display

- Xauthority file `~/.Xauthority`: cookies allowing use of displays
    - read with `$ xauth`
    - ensure environment variable `$XAUTHORITY` is set

### Files and Directories

#### Temporary Files

- Systemd [tmpfiles.d](https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html): Configuration for creation, deletion and cleaning of volatile and temporary files

## Daemons and Services

### Systemd
>
> [!info]- [[docs/seb_public/tech/linux/systemd]]
> ![[docs/seb_public/tech/linux/systemd]]

### supervisord

[Documentation](http://supervisord.org)
> Supervisor is a client/server system that allows its users to monitor and control a number of processes on UNIX-like operating systems.

Written in Python

## Important files and directories

### Logs

- `/var/log{auth,syslog}`
- `journalctl`

    ```sh
    journalctl --no-pager --since today \
    --grep 'fail|error|fatal' --output json|jq '._EXE' | \
    sort | uniq -c | sort --numeric --reverse --key 1
    ```

### SSH

`~/.ssh/config`, `/etc/ssh/ssh_config`, `/etc/ssh/sshd_config`

### Grub

`/etc/default/grub`, `/boot/grub/grub.cfg` (maintained through command `update-grub` and such, from files in `/etc/grub.d`, see [README](file:///etc/grub.d/README))

### EFI

if the directory `/sys/firmware/efi` exists, the system uses UEFI boot #tech/uefi


## Security

- <https://www.csoonline.com/article/567855/top-linux-antivirus-software.html>


## [[Hardware]]

- [[partitions_filesystems|Disks, Partitions and Filesystems]]
- Touchscreens: <http://tuxmobil.org/tablet_unix.html>

## Software & Repositories

Package types

- distribution-specific, e.g. `.deb`, `.rpm`, ...
- [[linux#Snap|snap]]
- flatpack
- AppImage: [List of AppImage apps](https://appimage.github.io/apps/)

[Comparison Snap, Flatpack and AppImage](https://phoenixnap.com/kb/flatpak-vs-snap-vs-appimage)

Change default application/command ^eb9a0b

```bash
sudo update-alternatives --install <link> <name> <path> <priority>
## for example changing python version
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
```

Package managers

- [[RPM]] (RedHat, Fedora, openSUSE, ...)
- apt (Debian/Ubuntu)

### Debian/Ubuntu

[[public/tech/linux/Debian#Repositories & Packages|Debian: Repositories and Packages]]

- [[public/tech/linux/Debian#apt|apt]]
- [[public/tech/linux/Debian#dpkg|dpkg]]

### Snap

<https://snapcraft.io/>

- [Network requirements](https://snapcraft.io/docs/network-requirements)

    *Installation*

- openSUSE: <https://snapcraft.io/docs/installing-snap-on-opensuse>

Home directory outside of `/home`: `snap` currently requires a workaround

1. bind-mount home directory under `/home/<username>`

    ```bash
    sudo mount --bind /path/to/homedir /home/<username>
    ```

1. and update the user's entry in `/etc/passwd`

## Distributions

### [[public/tech/linux/Debian]]

### [[Ubuntu]]

### [[openSUSE]]

### Fedora

- ![|50](https://fedoraproject.org/assets/images/coreos-logo-dark.png) [Fedora CoreOS][fcos]: container optimized OS

### Others

- [Asahi Linux](https://asahilinux.org): Linux on Apple Silicon (M1 ARM processor)
- [OpenWrt](https://openwrt.org/): The OpenWrt Project is a Linux operating system targeting embedded devices. Instead of trying to create a single, static firmware, OpenWrt provides a fully writable filesystem with package management.
- [Free GNU/Linux distributions](https://www.gnu.org/distros/free-distros.html)
    - [Guix](https://guix.gnu.org/) (also a package and system manager): Guix System is a distribution of the [GNU operating system](https://gnu.org/). It uses the [Linux-libre](https://gnu.org/software/linux-libre) kernel, and support for [the Hurd](https://gnu.org/software/hurd) is being worked on. As a GNU distribution, it is committed to respecting and enhancing [the freedom of its users](https://gnu.org/philosophy/free-sw.html). As such, it adheres to the [GNU Free System Distribution Guidelines](https://gnu.org/distros/free-system-distribution-guidelines.html).
        GNU Guix provides [state-of-the-art package management features](https://guix.gnu.org/manual/en/html_node/Features.html) such as transactional upgrades and roll-backs, reproducible build environments, unprivileged package management, and per-user profiles. It uses low-level mechanisms from the [Nix](https://nixos.org/nix/) package manager, but packages are [defined](https://guix.gnu.org/manual/en/html_node/Defining-Packages.html) as native [Guile](https://gnu.org/software/guile) modules, using extensions to the [Scheme](http://schemers.org) language—which makes it nicely hackable.


## Desktops

Environment variable with current desktop: `$XDG_CURRENT_DESKTOP`

![[KDE#KDE Plasma]]

### Desktop Files

- file extension `.desktop`
See <https://wiki.archlinux.org/title/desktop_entries>

```bash
desktop-file-validate
desktop-file-install --dir=$HOME/.local/share/applications /path/to/app.desktop
update-desktop-database ~/.local/share/applications
```

## Window Systems

To find out whether your desktop is using [[x11]] or [[wayland]], check the value of `$XDG_SESSION_TYPE`

### Window Managers

- [dwm](https://dwm.suckless.org/):  a dynamic window manager for X. It manages windows in tiled, monocle and floating layouts.

## Tools

[Modern replacements for classic tools @RedHat](https://www.redhat.com/sysadmin/linux-tool-replacements)

- `grep`: `ripgrep` (faster)
- top: `htop`, `glances`
- dig, nslookup: `drill`

    ```shell
    drill @8.8.8.8 mx nasa.org
    ```

- show file contents with highlighting for various formats: `rich`

    ```
    pip install --user rich-cli
    ```

[_Cheat_](https://github.com/cheat/cheat): [@RedHat](https://www.redhat.com/sysadmin/linux-cheat-command)
> allows you to create and view interactive cheatsheets on the command-line

- _qpdf_: combine/merge PDFs | [Documentation](https://qpdf.readthedocs.io/en/stable/index.html)

    ```bash
    qpdf --empty --pages first.pdf second.pdf -- combined.pdf
    qpdf --empty --pages first.pdf 1-2 second.pdf 1 -- combined # specify page ranges
    qpdf --empty --pages large.pdf 1-3,7,11,18-21,55 -- summary.pdf  # specify specific pages and ranges
    qpdf summary.pdf page.pdf --split-pages # split/burst pages
    qpdf --rotate=+90:1 summary.pdf rotated1.pdf # rotate pages
    qpdf --encrypt hen.rat.squid goose.goat.gibbon 256 -- summary.pdf secret.pdf # encrypt with user (read) and owner (change password/permissions) passwords
    qpdf --decrypt --password=goose.goat.gibbon secret.pdf unlocked.pdf # decrypt
    ```

#### tmux

[tmuxcheatsheet.com](https://tmuxcheatsheet.com/)
Config: `~/.tmux.conf`
Plugin-manager

```bash
## ~/.tmux.conf:
set -g @plugin 'tmux-plugins/tpm' # plugin manager. required!
## tmux plugin manager: keep this line at the very bottom of tmux.conf
## install: git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
run '~/.tmux/plugins/tpm/tpm'
```

- move window/change number: `:move-window -t 3`
- reorder window, swap window number 2(src) and 1(target:):  `swap-window -s 2 -t 1`
- SSH-agent (forwarding)
    - <https://blog.testdouble.com/posts/2016-11-18-reconciling-tmux-and-ssh-agent-forwarding/>
    - [TMUX and SSH auto-login with ssh-agent](https://robinwinslow.uk/tmux-and-ssh-auto-login-with-ssh-agent-finally)

    - Script by Heiko to re-start sessions

        ```bash
        #!/bin/bash

        #eval $(ssh-agent)
        ssh-add ~/.ssh/srv/id_rsa

        serverlist=$HOME/.tmux/tmux_list
        # contents for example
        # server1
        # server2
        # as defined in SSH config
        session=$1

        tmux new-session -d -s $session

        for server in $(cat $serverlist) ; do
            tmux new-window -a -t $session -d -c ~ -n $server "ssh ${server}"
        done

        tmux select-window -t ${session}:0
        tmux attach-session -t $session
        ```

### ImageMagick

[Text](https://www.imagemagick.org/Usage/text/)
[Fred's Scripts](http://www.fmwconcepts.com/imagemagick/index.php)

## Misc

Reset root password by changing #linux/Grub entry, booting into single-user mode
<https://www.layerstack.com/resources/tutorials/Resetting-root-password-for-Linux-Cloud-Servers-by-booting-into-Single-User-Mode#Debian&Ubuntu>

1. add `init=/bin/bash` to kernel parameters to get a (root) shell
2. (re-)mount root directory: `mount -o remount,rw /`
3. change password: `passwd`

## News

- [Kernel 5.19 features/improvements](https://www.techrepublic.com/article/linux-kernel-5-19-networking-improvements/)

[fcos]: <https://fedoraproject.org/coreos/>
[screen]: <https://www.gnu.org/software/screen/>
[cheat]: <https://github.com/cheat/cheat/>
