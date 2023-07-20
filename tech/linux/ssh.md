---
title: SSH
tags: tech/SSH
visibility: public
---

## Config

### General
```ssh_config
Host xyz x* WhatEverYouWannaCallIt
  HostName 123.456.78.90
  User Durp
  IdentityFile ~/.ssh/super-secret-key
```
- `Host` can be any identifier, even regular expressions
- `HostName` is the public hostname or IP address of your remote machine
- `User` is the username for this connection
- `IdentityFile` is the SSH private key for this connection

### ControlMaster
use an open connection for subsequent connections, so you don't have to enter credentials again and it's faster
```ssh_config
host *
    # Only one connection per host
    # Check connection status: > ssh -S ~/.ssh/$socket -O check <bogus arg>
    ControlMaster auto
    ControlPersist 1
    ControlPath ~/.ssh/controlmaster/%r@%h:%p
```
 Check status
  ```bash
  ssh -S /path/to/socket -O check <bogus arg>
  ```

### Forwarding
forward private keys, so they can be used on the remote host
	```ssh_config
	Host xyz
		ForwardAgent yes
	```
### Proxy Command
SSH-tunneling through intermediate host
	```
	Host xyz
		ProxyCommand ssh proxy.host nc -w1 %h %p
	```

## Commands
Edit remote files
```bash
program scp://user@server[:port]//path/to/file
# supported protocols depend on program: sftp, rsync, https, ...
```

[Run local script on remote host (DaveMcKay@HowToGeek)](https://www.howtogeek.com/825102/how-to-run-a-local-script-on-a-remote-linux-server/)
  ```bash
  ssh user@host "bash -s" -- < local_script.sh arg1 arg2 ...
```

## SOCKS proxy
#tech/SSH/SOCKS
SSH config
```
Host awp
    User lastn001
    HostName %h3.rcupw.rug.nl
    # socks proxy
    RemoteForward 12345
```
then configure browser to use that Socks proxy: manual SOCKS
  Host: localhost, port from ssh config, no proxy for *.rug.nl aka 129.125.0.0/16 range or auto-detect*
