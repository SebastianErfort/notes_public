---
title: Network Time Protocol (NTP)
acronym: NTP
type: protocol
category: networking/timedate
desc-short: Synchronise time over networks
aliases:
  - NTP
visibility: public
full-name: Network Time Protocol
---

# NTP

<dl>
<dt>Network Time Protocol</dt>
<ul>
<li>Time in seconds from 1900-01-01. Roll-over in 2036, but not a problem since it works with differences</li>
<li>accounts for round-trip time and processing time</li>
</ul>
<dt>Strata</dt>
<dd>Levels of accuracy where level 0 are certain atomic clocks. Stratum 16 is considered unsynched.</dd>
<dt>Synchronisation</dt>
<dd>
Slewing: done in steps of 0.5ms or less
</dd>
<dt>VMs</dt>
<dd>No reliable system clocks, but hypervisors can provide paravirtualised clocks to VMs. One can run a NTP serve on the host machine.</dd>
<dt>Linux</dt>
<dd>
<code>ntpd</code>
<ul>
<li>supports all NTP4 modes (unlike `chronyd`)</li>
<li>broadcast</li>
<li>multicast</li>
<li>manycast</li>
</ul>
<code>chronyd</code>
<ul>
<li>better in intermittent networks</li>
<li>works in isolated networks</li>
<li>synchronises faster than ntpd</li>
<li>uses less memory than ntpd</li>
</ul>
<dt>Configure using NTP</dt>
<dd><code>timedatectl set-ntp true</code></dd>
</dl>

## chrony

Configure server: in `/etc/chrony.conf`

- activate NTP server functionality: allow NTP client access from local network
- allow `chronyc` to control `chronyd`: add line `cmdallow 192.168.1.0/24`
- peers: add to each other's config
- fall back to peers, then local, if remote isn't available

Configure client: in `/etc/chrony.conf` add
`server x.x.x.x iburst`

Ensure using NTP
`sudo timedatectl set-ntp true`

Add exceptions to firewall, e.g.

```bash
sudo firewall-cmd --permanent --zone-public --add-service ntp
sudo firewall-cmd --reload # reload with new config
sudo firewall-cmd --list-all # check
sudo systemctl restart chronyd # restart NTP service
```

Check client status

```bash
chronyc sources -v # show NTP server info
chronyc tracking # show time sync info
```
