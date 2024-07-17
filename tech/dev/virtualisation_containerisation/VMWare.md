---
visibility: public
title: VMWare
tags:
  - sw/vmware
organisations:
  - "[[Broadcom]]"
down: "[[vsphere|ESXi]]"
aliases:
  - VMWare Fusion
  - VMWare Workstation
---

# VMWare

> [!warning]- License costs
> Especially since the acquisition through Broadcom, VMWare has been criticised for its subscription model. Broadening licenses to include more products that might not be required, has led to manifold costs for some businesses.[^arstechnica-vmware-critique]

- integrates well with [[vsphere|vSphere]] ecosystem

## VMWare Workstation and Fusion

- Windows: VMWare Workstation
- MacOS: VMWare Fusion
- reset free trial period: delete license file `/etc/vmware/license-ws-...` and run `sudo vmware` once.


### Configuration

- after creating a machine, set the the display to 1280x1024 and disable 3D accelleration  
- edit the .vmx file and add two keys:  

  ```toml
  smbios.assettag = "wks001001"  
  bios.forceSetupOnce = "TRUE"
  ```


## References

[^arstechnica-vmware-critique]: <https://arstechnica.com/information-technology/2024/04/broadcom-execs-say-vmware-price-subscription-complaints-are-unwarranted/>