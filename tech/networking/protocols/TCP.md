---
title: Transmission Control Protocol (TCP)
acronym: TCP
type: networking/protocol
desc: "One of the main protocols of the Internet protocol suite. It originated in the initial network implementation in which it complemented the Internet Protocol (IP). Therefore, the entire suite is commonly referred to as TCP/IP.\n\n*[Wikipedia: Transmission Control Protocol](https://en.wikipedia.org/wiki/Transmission_Control_Protocol)*"
aliases:
  - TCP
  - Transmission Control Protocol
visibility: public
---
 
> [!quote] `= ("[Wikipedia](" + wikipedia + ")")`
> `= this.desc`



### TCP (Transport Control Protocol)

[TCP @Wikiedia](https://en.wikipedia.org/wiki/Transmission_Control_Protocol)

- usually used for three-way handshake `SYN - SYN, ACK - ACK`
- session can be ended with `FIN`, not always acknowledged for efficiency
- TCP reset is being abused to end session

*Window Size*

- used to stream control
- 16 bits in header -> max. size 65535, but window scaling can be used to negotiate a larger size through a multiplier (up to x8)
- missing window scaling info hints at old hardware (Win XP or so) or suspicious port-scanning
- window size 0 usually means busy, don't send for a moment