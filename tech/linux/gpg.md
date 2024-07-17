---
visibility: public
title: Gpg
---
From the man page

> Note that on larger installations, it is useful to put predefined files into the directory `/etc/skel/.gnupg` so that newly created  users  start  up with a working configuration.

# Commands

- list keys: `gpg --list-secret-keys --keyid-format LONG`
- export/backup and restoring^[https://www.howtogeek.com/816878/how-to-back-up-and-restore-gpg-keys-on-linux/]

See also [cheatsheet](file://.config/cheat/cheatsheets/personal/gpg).

```bash
gpg --list-secret-keys --keyid-format LONG
# export/backup and restoring (https://www.howtogeek.com/816878/how-to-back-up-and-restore-gpg-keys-on-linux/)
gpg --export --export-options backup --output public.gpg [user@email.com]
gpg --export-secret-keys --export-options backup --output private.gpg
gpg --export-ownertrust > trust.gpg
# restore backup/import
gpg --import public.gpg
gpg --import private.gpg
gpg --import-ownertrust trust.gpg
# [read key ID from key without import](https://security.stackexchange.com/questions/43348/extracting-the-pgp-keyid-from-the-public-key-file)
gpg --dry-run --import --import-options show-only pubkey.gpg
# receive public key from keyserver
gpg --recv-keys $fingerprint

# Retrieve key from keyserver
wget https://host.domain.tld/<keyfile>
file <keyfile>
# gpg supports a number of key formats, so if your key is in a different format, convert it by importing it into a temp keyring, then exporting it again:
gpg --no-default-keyring --keyring ./temp-keyring.gpg --import <keyfile>
gpg --no-default-keyring --keyring .*/temp-keyring.gpg --export --output /usr/share/keyrings/<keyfile>.gpg
rm temp-keyring.gpg

# For ASCII type keys do it in this form:
wget -O- https://example.com/key/repo-key.gpg | gpg --dearmor | sudo tee */usr/share/keyrings/*<myrepository>-archive-keyring.gpg
# or
curl [<https://example.com/key/repo-key.gpg>](https://example.com/key/repo-key.gpg) | gpg --dearmor > */usr/share/keyrings/*<myrepository>-archive-keyring.gpg
# For non-ASCII type keys do it in this form:
wget -O- [<https://example.com/key/repo-key.gpg>](https://example.com/key/repo-key.gpg) | sudo tee */usr/share/keyrings/*<myrepository-archive-keyring.gpg>
# Or you can get your keys from a keyserver like so:
sudo gpg --no-default-keyring --keyring */usr/share/keyrings/*<myrepository>-archive-keyring.gpg --keyserver <hkp://keyserver.ubuntu.com:80> --recv-keys <fingerprint>
# All keys will be stored in */usr/share/keyrings/* folder. You can use those keys when you add your repo with the signed-by option to your sources.list file:
# deb [signed-by=*/usr/share/keyrings/*<myrepository>-archive-keyring.gpg] [<https://repository.example.com/debian/ stable main>](https://repository.example.com/debian/stablemain)
# Or you can add the arch=amd64 in the same fashion:
# deb [arch=amd64 signed-by=*/usr/share/keyrings/*<myrepository>-archive-keyring.gpg] [<https://repository.example.com/debian/ stable main>](https://repository.example.com/debian/stablemain)

# Deprecated
wget -qO - [http://example.com/archive.key](http://example.com/archive.key) | apt-key add -
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
```

