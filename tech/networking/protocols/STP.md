---
title: Spanning Tree Protocol (STP)
acronym: STP
type: protocol
desc-short: builds a loop-free logical topology for Ethernet networks
visibility: public
category: networking
full-name: Spanning Tree Protocol
wikipedia: https://en.wikipedia.org/wiki/Spanning_Tree_Protocol
---

# Spanning Tree Protocol (STP)

[Wikipedia](https://en.wikipedia.org/wiki/Spanning_Tree_Protocol)

- more talkative protocol, e.g. every 2s (delta time)
- In contrast to [OSPF](https://en.wikipedia.org/wiki/Open_Shortest_Path_First) it's preemptive, meaning changes get immediately implemented, but this means it's sensitive
  Default priority for root is lower MAC address (usually older device) - ⚠ introducing a lower MAC address switch might lead to rearranging network, may take down network for 30s
- default priority is 32768, but properly set up/configured networks should have priorities set

See also [[GK_Wireshark#STP (Spanning Tree)|course on Wireshark]].