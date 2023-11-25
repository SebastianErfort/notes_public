---
visibility: public
title: CentOS
---
# Repositories & Packages: yum

[Package Management](https://wiki.centos.org/PackageManagement)

- packages in RPM (RedHat Package Manager) files
- package manager: `yum`

[Install GUI](https://cloudzy.com/knowledge-base/install-gui-on-centos-7/)

```bash
sudo yum update
sudo yum -y groups install "GNOME Desktop"
echo "exec gnome-session" >> ~/.xinitrc
startx
systemctl set-default graphical.target
```
