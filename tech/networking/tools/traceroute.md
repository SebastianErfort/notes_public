---
title: traceroute
type: tool
category: networking
visibility: public
---

# Traceroute

Windows (see capture files [tracecert.pcapng](file://edu/gk_wireshark/tracecert.pcapng) and [tracecert-8-8-8-8.pcapng](file://edu/gk_wireshark/tracecert.pcapng))

- ICMP packets of increasing TTL to force routers on the route to report an error with some information
- stupid implementation, repeatedly using weird protocols (LLMNR, NBNS, MDNS) in serial

Linux

- uses UDP packets
- significantly faster
- immediately try to resolve information when available, no retries with weird backup mechanisms