---
title: Internet Control Message Protocol (ICMP)
acronym: ICMP
type: protocol
category: networking
desc: The Internet Control Message Protocol (ICMP) is a supporting protocol in the Internet protocol suite. It is used by network devices, including routers, to send error messages and operational information indicating success or failure when communicating with another IP address, for example, an error is indicated when a requested service is not available or that a host or router could not be reached.
aliases:
  - ping
visibility: public
full-name: Internet Control Message Protocol
desc-short: Supporting protocol, send error messages and operational information
---

Tags: #tech/networking/icmp
[ICMP @Wikipedia](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol)

- diagnostic and error reports
- ping uses ICMP
- can help to divide and conquer, if ping works it shouldn't be a network issue => higher layer
- but it's not that easy, pings are often blocked or dropped

ICMP type 3 codes

- 3/0
- ...
- 3/3 port unreachable: can hint at software issue
- 3/13: `Communication administratively filtered` hints at firewall block