---
title: Networking
tags: net net/DHCP net/DNS
visibility: public
---


## IP Address, Mask, Gateway


### IPv4

Four 8-bit numbers `0-255.0-255.0-255.0-255`

- subnet mask
- gateway server: where to send packages?
- DNS server: resolve domain names to IPs


## Ports

[IANA (Internet Assigned Numbers Authority): Service Name and Transport Protocol Port Number Registry](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.txt) ^d2523a

Excerpt
```
socks              1080        tcp    Socks
socks              1080        udp    Socks
```

## Technologies and Protocols


### NFS

#tech/NFS
https://wiki.archlinux.org/title/NFS

#tech/pNFS (parallel NFS)
- [pnfs.com](http://www.pnfs.com/)
- [RedHat: pNFS](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/storage_administration_guide/nfs-pnfs)
- [linux-nfs.org: Configuring pNFS](https://wiki.linux-nfs.org/wiki/index.php/Configuring_pNFS/spnfsd)


#### ACLs (Access Control Lists)

Different models with interoperability problem: NFSv4, Windows and POSIX ACLsw
<https://wiki.linux-nfs.org/wiki/index.php/ACLs>
<https://wiki.archlinux.org/title/Access_Control_Lists>

- edit
  - `setfacl -m "u:user:permissions" file/dir`
  - `nfs4_editfacl file/dir`
- read
  ```bash
  getfacl <file/dir>
  # find files with ACLs beyond POSIX (-s) recursively (-R)
  getfacl -Rsp <dir> | grep '# file:' | cut -d" " -f3
  ```
- if `ls` shows a `+` for files/dirs, they have ACLs


### DHCP & DNS

Tags: #net/DHCP #net/DNS

Machines have an _A record_ to be indentified. It maps a domain name to the IP (4/6) address of the computer hosting the domain. Usually is the same as the _hostname_ for convenience and to avoid confusion. In addition there can be an arbitrary number of _CNAME_. Also see _FQDN_ (full qualifies domain name).
- [DNSSEC (DNS Security Extensions)](https://www.icann.org/resources/pages/dnssec-what-is-it-why-important-2019-03-05-en)

To reduce the amount of requests/traffic, usually a (local) cache is used.

DNS resolution config: `/etc/resolv.conf`

Tools: `host`, `nslookup`, `dig`


### Security

[[personal/tech/networking/security|Networking: Security]]

- [[personal/tech/networking/security#TLS|TLS]]
- [[personal/tech/networking/security#SSL|SSL]]
- [[personal/tech/networking/security#SASL|SASL]]


### TFTP

Tags: #net/TFTP

[fbtftp](https://github.com/facebookarchive/fbtftp): Facebook implementation of a TFTP server in Python3
[hooktftp](https://github.com/tftp-go-team/hooktftp): dynamic read-only TFTP server written in Go


### NTP
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


#### chrony

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


### Wake-on-LAN

Tags: #net/wol #net/wakeonlan

```bash
# check status
ethtool <nic name> | grep Wake
# see man page for options
# set value
ethtool -s eth0 wol g
```


## Network Managers


### Netplan

[Netplan documentation](https://netplan.readthedocs.io/en/latest/)

- [YAML configuration](https://netplan.readthedocs.io/en/latest/netplan-yaml/)


## Tools

`ip` #web/tools/ip

- network namespaces
  - create virtual route/network between VM and host ([K8s Documentation](https://docker-k8s-lab.readthedocs.io/en/latest/docker/netns.html))
    1. create network namespace for VM
      ```bash
      sudo ip netns add myns
      ip netns list
      ```
    2. execute command in new network namespace
      ```bash
      sudo ip netns exec myns ip addr
      ```
    3. create a virtual interface pair, it has two virtual interfaces which are connected by a virtual cable
      ```bash
      sudo ip link add veth-a type veth peer name veth-b
      ```
      move one interface to new namespace
      ```bash
      sudo ip link set veth-b netns test1
      ```
    4. assign IP addresses and bring interfaces up
      ```bash
      sudo ip addr add 192.168.1.1/24 dev veth-a
      sudo ip link set veth-a up
      sudo ip netns exec myns ip addr add 192.168.1.2/24 dev veth-b
      sudo ip netns exec myns ip link set dev veth-b up
      ```
      We should be able to ping interface `b`
      ```bash
      ping 192.168.1.2
      ```

`host`: DNS lookup utility
```bash
host name [server] # find IP or hostname, optionally specify DNS server
```

`netstat`: part of `net-tools` and considered deprecated, functionality is now provided by `ip` and `ss`
```bash
netstat -tlpn # show tcp listen with program and numeric addresses
```
[Alternatives to deprecated `net-tools` programs @StackExchange](https://unix.stackexchange.com/a/261224/247791)
- `arp` → `ip n` (`ip neighbor`)
- `ifconfig` → `ip a` (`ip addr`), `ip link`, `ip -s` (`ip -stats`)
- `iptunnel` → `ip tunnel`
- `iwconfig` → `iw`
- `nameif` → `ip link`, ifrename
- `netstat` → `ss`, `ip route` (for `netstat -r`), `ip -s link` (for `netstat -i`), `ip maddr` for `netstat -g`)

#net/nc (netcat): scan for (open) ports
```bash
nc [options] host port # usage
# scan for open ports
nc -z -v <IP-ADDRESS> 1-65535 2>&1 | grep -v refused
# -v: verbose
# -z: scan without sending data to port
```

#Linux/tools/lsof: list open (network) files, show ports and mappings
```bash
lsof -i -P -n
# -i: list files whose Internet address matches argument or all network files if no address is specified
# -n: inhibit conversion of network numbers to host names for network files
# -P: inhibit conversion of port numbers to names for network files
```

#net/tools/ss ^06f80a
```bash
ss | less  # get all connections
ss -t      # get tcp connections not in listen mode (server programs)
ss -u      # get udp connections not in listen mode
ss -x      # get unix socket pipe connections
ss -ta     # get all tcp connections
ss -au     # get all udp connections
ss -nt     # all tcp without host name
ss -ltn    # listening tcp without host resolution
ss -ltp    # listening tcp with PID and name
ss -s      # prints statstics
ss -tn -o  # tcp connection with domain host and show keepalive timer
ss -tl4    # ip4 connections
ss -tlp[n] # show TCP listening ports
```

_nmap:_ Network exploration tool and security / port scanner. Not commonly pre-installed.
> open source tool for network exploration and security auditing
- ping sweep
- https://stackoverflow.com/questions/14600466/how-to-ping-mac-address-in-linux
```bash
nmap -sn # no port scan/"ping scan": allows light reconnaissance of a target   network without attracting much attention
```

#net/tools/dnsmasq: A lightweight DHCP and caching DNS server

#net/tools/dig (Domain Information Groper): DNS lookup utility
- find CNAMEs and IPs for hostnames
  ```bash
  dig google.com [@1.0.0.1] # optionally specify DNS server with @
  ```

#net/tools/resolvctl: #Linux/systemd (not present on openSUSE)
> Send control commands to the network name resolution manager, or resolve domain names, IPv4 and IPv6 addresses, DNS records, and services.

Config at `/etc/resolv.conf` specifying DNS servers, but usually managed by some program, e.g. `netconfig`.

#net/tools/nslookup: (interactively) query Internet name servers
```bash
nslookup host [server]
```

`traceroute`: print the route packets trace to network host

```bash
traceroute <host>
```

#net/tools/wireshark: the world’s foremost and widely-used network protocol analyzer
[Website](https://www.wireshark.org/) | [Documentation](https://www.wireshark.org/docs/wsug_html_chunked/) | [Wiki](https://gitlab.com/wireshark/wireshark/-/wikis/home)

#net/tshark: Dump and analyze network traffic
[Man page](Dump and analyze network traffic)

## Security
See [[personal/tech/networking/security|my notes on networking security]]

[SSL Labs](ssllabs.com): Check website certificate, protocols, keys, etc.

### Authentication
![[personal/tech/security/security#Authentication]]


## References
- [Wikipedia: List of TCP and UDP port numbers](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers)
- [[Hardware#MAC Address|My notes on MAC addresses]]
- [Get public IP address DaveMcKay@HowToGeek](https://www.howtogeek.com/839170/how-to-get-your-public-ip-in-a-linux-bash-script/)

