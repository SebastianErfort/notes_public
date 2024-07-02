---
visibility: public
title: Zabbix
type: software
category:
  - Monitoring
---
# Zabbix

Compare previous disk usage to current to warn about filling disk
<https://www.zabbix.com/forum/zabbix-help/26120-monitoring-disk-space-usage>

```zabbix
((last("vfs.fs.size[c:,free]")) - ((last("vfs.fs.size[c:,free]",0,172800))-(last("vfs.fs.size[c:,free]"))))
```

My suggestion
$$r = (u(t_p) - u(t_c))/(t_c - t_p), \; t_\text{full} = - u(t_c) / r$$
with $r$: rate of disk filling/emptying, $u$: usage, $t_{p/c}$: previous/current time, $t_\text{full}$: time until full
