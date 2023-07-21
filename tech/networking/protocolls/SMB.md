---
title: Server Message Block (SMB)
wikipedia: "https://en.wikipedia.org/wiki/Server_Message_Block"
tags: tech/printing
visibility: public
---
> [!info] `= ("[Wikipedia](" + wikipedia +")")`:
> Server Message Block (SMB) enables [file sharing](https://en.wikipedia.org/wiki/File_sharing "File sharing"), [printer sharing](https://en.wikipedia.org/wiki/Print_server "Print server"), network browsing, and [inter-process communication](https://en.wikipedia.org/wiki/Inter-process_communication "Inter-process communication") (through [named pipes](https://en.wikipedia.org/wiki/Named_pipe)) over a [computer network](https://en.wikipedia.org/wiki/Computer_network "Computer network"). SMB serves as the basis for Microsoft's [Distributed File System](https://en.wikipedia.org/wiki/Distributed_File_System_(Microsoft) "Distributed File System (Microsoft)") implementation.
>
> SMB relies on the [TCP](https://en.wikipedia.org/wiki/Transmission_Control_Protocol "Transmission Control Protocol") and [IP](https://en.wikipedia.org/wiki/Internet_Protocol "Internet Protocol") protocols for transport. This combination potentially allows file sharing over [complex, interconnected networks](https://en.wikipedia.org/wiki/Internetworking "Internetworking"), including the public Internet. The SMB [server component](https://en.wikipedia.org/wiki/Client%E2%80%93server_model "Client–server model") uses [TCP](https://en.wikipedia.org/wiki/Transmission_Control_Protocol "Transmission Control Protocol") [port](https://en.wikipedia.org/wiki/Port_(computer_networking) "Port (computer networking)") 445.
>
> SMB uses the [Kerberos](https://en.wikipedia.org/wiki/Kerberos_(protocol) "Kerberos (protocol)") protocol to authenticate users against [Active Directory](https://en.wikipedia.org/wiki/Active_Directory "Active Directory") on [Windows domain](https://en.wikipedia.org/wiki/Windows_domain "Windows domain") networks. On simpler, peer-to-peer networks, SMB uses the [NTLM](https://en.wikipedia.org/wiki/NTLM "NTLM") protocol.

# Implementations

## Samba
See [[Samba|notes on Samba]]