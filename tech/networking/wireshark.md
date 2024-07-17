---
title: Wireshark
type: software
category: networking
url: "https://www.wireshark.org/"
docs: "https://www.wireshark.org/docs/"
wiki: "https://wiki.wireshark.org/Home"
developer: Wireshark Foundation
desc-short: The world's most popular network protocol analyzer
tags:
  - tech/networking/wireshark
img: "<img src=\"https://www.wireshark.org/assets/img/wireshark-logo.png\" style=\"width: 80px;\"/>"
visibility: public
---
# `=this.title`

`=this.img` `= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")` | `= ("[Wiki](" + this.wiki + ")")`
[Sample captures wiki.wireshark.org](https://wiki.wireshark.org/SampleCaptures)
`= ("> " + this.desc-short)`
See also [[GK_Wireshark|my notes from a Wireshark course]].

Command line interface: [tshark](https://tshark.dev/). 


## Principles

How to use Wireshark

- create baseline, network captures of functioning program
- 3 application categories: transactional, streaming,

Structural approach

- top-down (application dev.)
- bottom-up: most robust
- (divide and conquer, not reliable)
- shoot-from-the-hip (experienced)

![[_networking#^0fd526]]


### Packets

![[_networking#Packet Problems]]
![[_networking#Packet Priority]]


### Ping and ICMP (Layer 3)

![[ICMP]]

![[traceroute]]



### DHCP

![[DHCP]]


### TCP

![[TCP]]

## Configuration

Columns

- new column *Delta Time* with type `Delta time displayed` to show time between request and reply, great for performance trouble shooting
- new column *Cumulative Bytes* to show session size packets add up to

Name resolution

- resolve transport names: resolve common port numbers
- uncheck `Use system's DNS settings for name resolution`: opening large capture files would result in huge amount of DNS traffic (also less active traffic from Wireshark)


## Captures

- scrub capture to remove sensitive information: free open source tools available

## References

- people, educational material (YT etc.)
    - Laura Chappell: Wireshark University
    - Chris Greer: security-focused
    - David Bombai: uses Wireshark to demonstrate things
    - Sake Blok
- [tshark.dev](https://tshark.dev/)
