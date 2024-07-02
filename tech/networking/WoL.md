### Wake-on-LAN

Tags: #tech/networking/wol #tech/networking/wakeonlan

```bash
# check status
ethtool <nic name> | grep Wake
# see man page for options
# set value
ethtool -s eth0 wol g
```