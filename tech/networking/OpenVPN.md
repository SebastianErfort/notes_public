Split tunnel: route certain traffic

Edit ovpn file, something like[^askubuntu-split-vpn]

```
route-nopull ; route 10.0.0.0 255.0.0.0 ;
```
should do it (didn't work for me (yet))

[^askubuntu-split-vpn]: <https://askubuntu.com/questions/1246642/simplest-split-tunneling-solution-per-application-for-openvpn>