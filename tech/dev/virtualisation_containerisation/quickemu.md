---
title: "quickemu"
owner: "quickemu-project"
source: "https://github.com/quickemu-project/quickemu"
website: "/topics/windows"
description: "Quickly create and run optimised Windows, macOS and Linux virtual machines"
stars: 12
tags:
  - "github"
  - "repo"
  - "windows"
  - "macos"
  - "linux"
  - "virtualization"
  - "spice"
  - "kvm"
  - "qemu"
  - "hackintosh"
  - "tpm"
  - "hacktoberfest"
  - "efi"
  - "9p"
  - "virtio"
  - "virgl"
  - "virglrenderer"
created: 2025-06-18
---
# `= this.title`
`= ("> " + this.description)`

- [02 Create Linux virtual machines](https://github.com/quickemu-project/quickemu/wiki/02-Create-Linux-virtual-machines)
- [05 Advanced quickemu configuration](https://github.com/quickemu-project/quickemu/wiki/05-Advanced-quickemu-configuration)

## Examples

### MacOS

https://itsfoss.com/macos-linux-vm/

## Troubleshooting

Display: issues accessing in VM
- tried [[Spice]] with limited success - mouse and keyboard not working in [[Proxmox]] Spice console
    ```
    --display                         : Select display backend. 'sdl' (default), 'gtk', 'none', 'spice' or 'spice-app'
    ```

## References

- https://itsfoss.com/macos-linux-vm/
- https://commandmasters.com/commands/quickemu-linux/