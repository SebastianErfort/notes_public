---
title: AppArmor
---
# `=this.title`

[AppArmor Wiki](https://gitlab.com/apparmor/apparmor/-/wikis/home) | [AppArmor Documentation](https://gitlab.com/apparmor/apparmor/-/wikis/Documentation)

- *Included in Debian, openSUSE, Ubuntu* among others. Partially included since Linux kernel 2.6.36, since 2009 supported by Canoncial.
- confines individual programs to a set of files, capabilities, network access and rlimits (`profile`)
- complain (deny only logged) and enforce mode
- Includes a monitoring mode, logging programs' behaviour, to help create a profile.
- profiles are in `/etc/apparmod.d`
    - Debian
        - [Package apparmor-profiles (experimental, complain mode)](https://packages.debian.org/search?keywords=apparmor-profiles)
        - [Package apparmor-profiles-extra](https://packages.debian.org/search?keywords=apparmor-profiles-extra)
    - [Ubuntu AppArmor profiles]
- Some packages install their own profile and automatically enable them, but usually they default to `complain` mode instead of `enforce` mode
- Log/audit
    - Depending on system AppArmor events can be seen in `/var/log/syslog`, `/var/log/audit´.log`, `/var/log/kern.log` or `journald`
    - ALLOWED (logged when a profile in complain mode violates the policy)
    - DENIED (logged when a profile in enforce mode actually blocks an operation)


## Commands

```bash
# show programs with an (active) AppArmor profile
sudo aa-status
# set AppArmor to complain mode for this profile
sudo aa-complain /etc/apparmor.d/example.profile
# disable a profile temporarily
sudo aa-disable /etc/apparmor.d/usr.bin.example
# after testing, re-enable it in complain mode
sudo aa-complain /etc/apparmor.d/usr.bin.example
# or in enforce mode
sudo aa-enforce /etc/apparmor.d/usr.bin.example
# list processes with tcp or udp ports w/o AppArmor profiles loaded
sudo aa-unconfined
```

> [!example]- Output of `aa-status`
> 
> ```
> 37 profiles are loaded.  
> 34 profiles are in enforce mode.
> ...
> 3 profiles are in complain mode.
> ...
> 10 processes have profiles defined.  
> 4 processes are in enforce mode.
>    /usr/sbin/chronyd (654) 
>    ...
>    /usr/sbin/cupsd (3152066)
> 6 processes are in complain mode.
> ...
> 0 processes are unconfined but have a profile defined.
> ```

- Profile enforcement:
    - [apparmor_parser](http://manpages.ubuntu.com/manpages/precise/en/man8/apparmor_parser.8.html)
    - [aa-audit](http://manpages.ubuntu.com/manpages/precise/en/man8/aa-audit)
    - [aa-enforce](http://manpages.ubuntu.com/manpages/precise/en/man8/aa-enforce.8.html)
    - [aa-complain](http://manpages.ubuntu.com/manpages/precise/en/man8/aa-complain.8.html)
- Monitoring tools:
    - [aa-status](http://manpages.ubuntu.com/manpages/precise/en/man8/aa-status.8.html)
    - [aa-notify](http://manpages.ubuntu.com/manpages/precise/en/man8/aa-notify)
    - [aa-unconfined](http://manpages.ubuntu.com/manpages/precise/en/man8/aa-unconfined.8.html)
- Profile development:
    - [aa-autodep](http://manpages.ubuntu.com/manpages/precise/en/man8/aa-autodep.8.html)
    - [aa-logprof](http://manpages.ubuntu.com/manpages/precise/en/man8/aa-logprof.8.html)
    - [aa-genprof](http://manpages.ubuntu.com/manpages/precise/en/man8/aa-genprof.8.html)
    - [mod_apparmor](http://manpages.ubuntu.com/manpages/precise/en/man8/mod_apparmor.8.html)
    - [aa_change_hat](http://manpages.ubuntu.com/manpages/precise/en/man2/aa_change_hat.2.html)
    - [aa_change_profile](http://manpages.ubuntu.com/manpages/precise/en/man2/aa_change_profile.2.html)
    - [PAM plugin](/apparmor/apparmor/-/wikis/pam_apparmor)


- more
    - [Debian external links](https://wiki.debian.org/AppArmor#External_links)


## Profiles

To generate a profile ensure the package `apparmor-utils` is installed and run

```bash
sudo aa-genprof /path/to/program
```

- `aa-logprof /path/to/program` starts scan
- logs are checked during start-up and usage
- profile can be generated interactively from program behaviour
- test profile
- save and enforce

Edit profiles

```bash
sudo apparmor_parser -r /etc/apparmor.d/example.profile
```

then restart application and check logs.

*Note*: the parser silently ignores rules that are not supported by the running kernel. To check which rules are actually enforced, pass the `--warn=rules-not-enforced` `--warn=rule-downgraded` options to `apparmor_parser`

As of 3.? it is possible to make the attachment conditional upon the user or executable owner

  ```
  profile name owner=jj /example/attachment { }
  profile name user=foo /example/attachment { }
  ```

Additional (experimental) profiles can be installed with the package `apparmor-profiles`.

Profiles can have wildcards and file globbing is then used to match programs, directories or files

See [AppArmor Wiki QuickProfileLanguage](https://gitlab.com/apparmor/apparmor/-/wikis/QuickProfileLanguage)

- [Profiles](https://gitlab.com/apparmor/apparmor/-/wikis/QuickProfileLanguage#profiles)
- Rules: [capability](https://gitlab.com/apparmor/apparmor/-/wikis/QuickProfileLanguage#capability-rules), [network](https://gitlab.com/apparmor/apparmor/-/wikis/QuickProfileLanguage#network-rules), [files](https://gitlab.com/apparmor/apparmor/-/wikis/QuickProfileLanguage#file-rules)
- [File permissions](https://gitlab.com/apparmor/apparmor/-/wikis/QuickProfileLanguage#file-permissions)


### Permissions

The following file permissions are supported:

Code | Effect
-|-
`r` | read
`w` | write
`a` | append (implied by w)
`x` | execute
`ux` | Execute unconfined (preserve environment) -- WARNING: should only be used in very special cases
`Ux` | Execute unconfined (scrub the environment)
`px` | Execute under a specific profile (preserve the environment) -- WARNING: should only be used in special cases
`Px` | Execute under a specific profile (scrub the environment)
`pix` | as px but fallback to inheriting the current profile if the target profile is not found
`Pix` | as Px but fallback to inheriting the current profile if the target profile is not found
`pux` | as px but fallback to executing unconfined if the target profile is not found
`Pux` | as Px but fallback to executing unconfined if the target profile is not found
`ix` | Execute and inherit the current profile
`cx` | Execute and transition to a child profile (preserve the environment)
`Cx` | Execute and transition to a child profile (scrub the environment)
`cix` | as cx but fallback to inheriting the current profile if the target profile is not found
`Cix` | as Cx but fallback to inheriting the current profile if the target profile is not found
`cux` | as cx but fallback to executing unconfined if the target profile is not found
`Cux` | as Cx but fallback to executing unconfined if the target profile is not found
`m` | memory map executable
`k` | lock (requires r or w, AppArmor 2.1 and later)
`l` | link


### Example

`/etc/apparmor.d/evince`

> [!example]- Examples from AppArmor Wiki
> ```
> /dir/file - match a specific file
> /dir/*    - match any files in a directory (including dot files)
> /dir/a*   - match any file in a directory starting with <b>a</b>
> /dir/*.png - match any file in a directory ending with <b>.png</b>
> /dir/[^.]* - match any file in a directory except dot files
>  /dir/ - match a directory
> /dir/*/ - match any directory within /dir/
> /dir/a*/ - match any directory within /dir/ starting with a
> /dir/*a/ - match any directory within /dir/ ending with a
>  /dir/** - match any file or directory in /dir/ or any directory below /dir/
> /dir/**/ - match any directory in /dir/ or any directory below /dir/
> /dir/**[^/] - match any file in /dir/ or any directory below /dir/
> ```


## Pros & Cons AppArmor

Pro

- comes with Ubuntu and Debian
- easier to manage

Con

- minor: The Ubuntu 20.04 apparmor package is only version 2.13 and there have been substantial changes with 3.x such as `aa-unconfined` (fnd processes with network access). Hirsute (21.04) has version 3.0.0 and Impish (21.10) has 3.0.3.
- less fine-grained and deep control


## Customisation

The main question is how we determine what profiles we need or want.

1. What specific programs or files are there that we want to confine or protect?
2. What is installed in the [[#Default package profiles]] and not yet activated, that we might want?
3. What [[#Extra profiles]] are there that we should use? For example from the package `apparmor-profiles-extra`
4. Some programs might already install profiles, possibly only in complain mode though

Once we have identified some program that we want to confine or files/diretories to protect we can set up a profile using for example `aa-logprof` to generate a profile in complain mode, check the logs and modify the profile as needed. I'm not sure this works for files and not just programs.


### 1. Programs and files to be managed

- we could activate more distro package profiles in enforce mode
- CIS security benchmarks as an *extensive* reference (see [our gitlab](https://git.lwp.rug.nl/lwp/lwp-overleg/-/tree/master/security) | [local file](file:///home/erfort/manuals/security/CIS_Ubuntu_Linux_18.04_LTS_Benchmark_v2.0.1.pdf))
- > [!example]- `aa-unconfined` on my laptop
  >
  > ```bash
  > sudo aa-unconfined
  > 2001 /usr/sbin/avahi-daemon confined by 'avahi-daemon (enforce)'
  > 2308 /usr/sbin/cupsd not confined
  > 2342 /usr/sbin/sshd (sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups) not confined
  > 2560 /usr/sbin/wpa_supplicant not confined
  > 3559 /usr/sbin/dhclient (/sbin/dhclient) not confined
  > 3975 /opt/google/chrome/chrome (/opt/google/chrome/chrome --enable-crashpad) not confined
  > 4023 /opt/google/chrome/chrome (/opt/google/chrome/chrome --type=utility --utility-sub-type=network.mojom.NetworkService --field-trial-handle=9070260436861465072,1032411029720252195,131072 --lang=en-GB --service-sandbox-type=none --enable-crashpad --crashpad-handler-pid=0 --enable-crash-reporter=2ec8d964-9ff6-40d4-b256-c0a2890faa53, --change-stack-guard-on-fork=enable --shared-files=v8_context_snapshot_data:100 --enable-crashpad) not confined
  > ```


### 2. Default package profiles

> [!info]- Debian Bullseye package content for `apparmor-profiles`
> 
> ```
> /etc/apparmor.d/apache2.d/phpsysinfo
> /etc/apparmor.d/bin.ping
> /etc/apparmor.d/sbin.klogd
> /etc/apparmor.d/sbin.syslog-ng
> /etc/apparmor.d/sbin.syslogd
> /etc/apparmor.d/usr.sbin.avahi-daemon
> /etc/apparmor.d/usr.sbin.dnsmasq
> /etc/apparmor.d/usr.sbin.identd
> /etc/apparmor.d/usr.sbin.mdnsd
> /etc/apparmor.d/usr.sbin.nmbd
> /etc/apparmor.d/usr.sbin.nscd
> /etc/apparmor.d/usr.sbin.smbd
> /etc/apparmor.d/usr.sbin.smbldap-useradd
> /etc/apparmor.d/usr.sbin.traceroute
> /usr/share/apparmor/extra-profiles/README
> /usr/share/apparmor/extra-profiles/bin.netstat
> /usr/share/apparmor/extra-profiles/etc.cron.daily.logrotate
> /usr/share/apparmor/extra-profiles/etc.cron.daily.slocate.cron
> /usr/share/apparmor/extra-profiles/etc.cron.daily.tmpwatch
> /usr/share/apparmor/extra-profiles/sbin.dhclient
> /usr/share/apparmor/extra-profiles/sbin.dhclient-script
> /usr/share/apparmor/extra-profiles/sbin.dhcpcd
> /usr/share/apparmor/extra-profiles/sbin.portmap
> /usr/share/apparmor/extra-profiles/sbin.resmgrd
> /usr/share/apparmor/extra-profiles/sbin.rpc.lockd
> /usr/share/apparmor/extra-profiles/sbin.rpc.statd
> /usr/share/apparmor/extra-profiles/usr.NX.bin.nxclient
> /usr/share/apparmor/extra-profiles/usr.bin.acroread
> /usr/share/apparmor/extra-profiles/usr.bin.apropos
> /usr/share/apparmor/extra-profiles/usr.bin.evolution-2.10
> /usr/share/apparmor/extra-profiles/usr.bin.fam
> /usr/share/apparmor/extra-profiles/usr.bin.gaim
> /usr/share/apparmor/extra-profiles/usr.bin.man
> /usr/share/apparmor/extra-profiles/usr.bin.mlmmj-bounce
> /usr/share/apparmor/extra-profiles/usr.bin.mlmmj-maintd
> /usr/share/apparmor/extra-profiles/usr.bin.mlmmj-make-ml.sh
> /usr/share/apparmor/extra-profiles/usr.bin.mlmmj-process
> /usr/share/apparmor/extra-profiles/usr.bin.mlmmj-receive
> /usr/share/apparmor/extra-profiles/usr.bin.mlmmj-recieve
> /usr/share/apparmor/extra-profiles/usr.bin.mlmmj-send
> /usr/share/apparmor/extra-profiles/usr.bin.mlmmj-sub
> /usr/share/apparmor/extra-profiles/usr.bin.mlmmj-unsub
> /usr/share/apparmor/extra-profiles/usr.bin.opera
> /usr/share/apparmor/extra-profiles/usr.bin.passwd
> /usr/share/apparmor/extra-profiles/usr.bin.procmail
> /usr/share/apparmor/extra-profiles/usr.bin.skype
> /usr/share/apparmor/extra-profiles/usr.bin.spamc
> /usr/share/apparmor/extra-profiles/usr.bin.svnserve
> /usr/share/apparmor/extra-profiles/usr.bin.wireshark
> /usr/share/apparmor/extra-profiles/usr.bin.xfs
> /usr/share/apparmor/extra-profiles/usr.lib.GConf.2.gconfd-2
> /usr/share/apparmor/extra-profiles/usr.lib.RealPlayer10.realplay
> /usr/share/apparmor/extra-profiles/usr.lib.bonobo.bonobo-activation-server
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.anvil
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.auth
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.config
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.deliver
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.dict
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.dovecot-auth
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.dovecot-lda
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.imap
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.imap-login
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.lmtp
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.log
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.managesieve
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.managesieve-login
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.pop3
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.pop3-login
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.script-login
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.ssl-params
> /usr/share/apparmor/extra-profiles/usr.lib.dovecot.stats
> /usr/share/apparmor/extra-profiles/usr.lib.evolution-data-server.evolution-data-server-1.10
> /usr/share/apparmor/extra-profiles/usr.lib.firefox.firefox
> /usr/share/apparmor/extra-profiles/usr.lib.firefox.firefox.sh
> /usr/share/apparmor/extra-profiles/usr.lib.firefox.mozilla-xremote-client
> /usr/share/apparmor/extra-profiles/usr.lib.man-db.man
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.anvil
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.bounce
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.cleanup
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.discard
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.dnsblog
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.error
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.flush
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.lmtp
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.local
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.master
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.nqmgr
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.oqmgr
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.pickup
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.pipe
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.postscreen
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.proxymap
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.qmgr
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.qmqpd
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.scache
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.showq
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.smtp
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.smtpd
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.spawn
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.tlsmgr
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.trivial-rewrite
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.verify
> /usr/share/apparmor/extra-profiles/usr.lib.postfix.virtual
> /usr/share/apparmor/extra-profiles/usr.lib64.GConf.2.gconfd-2
> /usr/share/apparmor/extra-profiles/usr.sbin.dhcpd
> /usr/share/apparmor/extra-profiles/usr.sbin.dovecot
> /usr/share/apparmor/extra-profiles/usr.sbin.httpd2-prefork
> /usr/share/apparmor/extra-profiles/usr.sbin.imapd
> /usr/share/apparmor/extra-profiles/usr.sbin.in.fingerd
> /usr/share/apparmor/extra-profiles/usr.sbin.in.ftpd
> /usr/share/apparmor/extra-profiles/usr.sbin.in.ntalkd
> /usr/share/apparmor/extra-profiles/usr.sbin.ipop2d
> /usr/share/apparmor/extra-profiles/usr.sbin.ipop3d
> /usr/share/apparmor/extra-profiles/usr.sbin.lighttpd
> /usr/share/apparmor/extra-profiles/usr.sbin.nmbd
> /usr/share/apparmor/extra-profiles/usr.sbin.oidentd
> /usr/share/apparmor/extra-profiles/usr.sbin.popper
> /usr/share/apparmor/extra-profiles/usr.sbin.postalias
> /usr/share/apparmor/extra-profiles/usr.sbin.postdrop
> /usr/share/apparmor/extra-profiles/usr.sbin.postmap
> /usr/share/apparmor/extra-profiles/usr.sbin.postqueue
> /usr/share/apparmor/extra-profiles/usr.sbin.sendmail
> /usr/share/apparmor/extra-profiles/usr.sbin.sendmail.postfix
> /usr/share/apparmor/extra-profiles/usr.sbin.sendmail.sendmail
> /usr/share/apparmor/extra-profiles/usr.sbin.smbd
> /usr/share/apparmor/extra-profiles/usr.sbin.spamd
> /usr/share/apparmor/extra-profiles/usr.sbin.squid
> /usr/share/apparmor/extra-profiles/usr.sbin.sshd
> /usr/share/apparmor/extra-profiles/usr.sbin.useradd
> /usr/share/apparmor/extra-profiles/usr.sbin.userdel
> /usr/share/apparmor/extra-profiles/usr.sbin.vsftpd
> /usr/share/apparmor/extra-profiles/usr.sbin.xinetd
> /usr/share/bug/apparmor-profiles/presubj
> /usr/share/doc/apparmor-profiles/changelog.Debian.gz
> /usr/share/doc/apparmor-profiles/copyright
> /usr/share/lintian/overrides/apparmor-profiles
> ```

This implies some "extra profiles" are already included in this package. `apparmor-profiles-extra` contains only very few profiles.


### 3. External profiles


### Creating/adjusting profiles

- `aa-genprof`: profile generation utility
    - set the profile to complain mode
    - write a mark to the system log
    - instruct the user to start the application to be profiled in another window and exercise its functionality
- Profiles can have wildcards and file globbing is then used to match programs, directories or files
    <details><summary>Examples from AppArmor Wiki</summary>

    ```
    /dir/file - match a specific file
    /dir/*    - match any files in a directory (including dot files)
    /dir/a*   - match any file in a directory starting with <b>a</b>
    /dir/*.png - match any file in a directory ending with <b>.png</b>
    /dir/[^.]* - match any file in a directory except dot files
     /dir/ - match a directory
    /dir/*/ - match any directory within /dir/
    /dir/a*/ - match any directory within /dir/ starting with a
    /dir/*a/ - match any directory within /dir/ ending with a
     /dir/** - match any file or directory in /dir/ or any directory below /dir/
    /dir/**/ - match any directory in /dir/ or any directory below /dir/
    /dir/**[^/] - match any file in /dir/ or any directory below /dir/
    ```

    </details>


### Problems

- The Ubuntu 20.04 AppArmor package is only version 2.13 and doesn't seem to have `aa-unconfined` (list processes with tcp or udp ports w/o AppArmor profiles loaded), even though it should according to the man page. Also 3.x series is a significant expansion. Hirsute (21.04) has version 3.0.0 and Impish (21.10) has 3.0.3.


## References

- [Debian links on AppArmor](https://wiki.debian.org/AppArmor#External_links)
