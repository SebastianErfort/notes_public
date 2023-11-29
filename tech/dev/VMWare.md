---
visibility: public
title: VMWare
tags: [sw/vmware]
---

# VMWare

Reset free trial period: delete license file `/etc/vmware/license-ws-...` and run `sudo vmware` once.


## Configuration

- after creating a machine, set the the display to 1280x1024 and disable 3D accelleration  
- edit the .vmx file and add two keys:  

  ```toml
  smbios.assettag = "wks001001"  
  bios.forceSetupOnce = "TRUE"
  ```
