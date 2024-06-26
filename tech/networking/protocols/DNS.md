---
title: Domain Name System (DNS)
acronym: DNS
type: protocol
desc: Translates (host) names into corresponding IP addresses.
visibility: public
category:
  - networking/routing
full-name: Domain Name System
related:
  - "[[DHCP]]"
---
# DNS

Domain Name System (DNS) #tech/networking/DNS

*DNS*: hierarchical and distributed naming system

*mDNS*: multicast DNS for local networks

Machines have an _A record_ to be identified. It maps a domain name to the IP (4/6) address of the computer hosting the domain. Usually is the same as the _hostname_ for convenience and to avoid confusion. In addition there can be an arbitrary number of _CNAME_. Also see _FQDN_ (full qualifies domain name).

To reduce the amount of requests/traffic, usually a (local) cache is used.

DNS resolution config: `/etc/resolv.conf`

Tools: `host`, `nslookup`, `dig`

[DNSSEC (DNS Security Extensions)](https://www.icann.org/resources/pages/dnssec-what-is-it-why-important-2019-03-05-en)

IP address | Provider | Description
-|-|-
1.1.1.1 | Cloudflare |
1.1.1.2 | Cloudflare | location based filtering providing some security
1.1.1.3 | Cloudflare | additional adult content filtering
8.8.8.8 | Google | d
: DNS servers


## Tools

- [Dnsmasq]: "Dnsmasq provides network infrastructure for small networks: DNS, DHCP, router advertisement and network boot."
    - [[RaspberryPi#^pihole|Pihole]]

## References

[dnsmasq]: <https://dnsmasq.org/doc.html>