---
title: Linux - Hardware
visibility: public
related:
  - "[[partitions_filesystems]]"
---
# Hardware

## Disks, Blockdevices, Storage

```bash
dmesg # monitor change of state udev
udevadm monitor # udev
lsusb # list usb devices
inxi -D
lshw -class disk
smartctl -i /dev/sdX # detailed vendor and model info
```

## RAM

```sh
cat /proc/meminfo
sudo dmidecode --type 17
inxi -m
```
    
## Audio

- Default: Pulse Audio
- New projects
    - [Pipewire](https://pipewire.org/) | [Documentation](https://docs.pipewire.org/)
- Bluetooth: [opensuse.org](https://en.opensuse.org/SDB:Bluetooth)
    - Headset
      [[../../../rug/journal/today#16/01/2022|See failed attempts.]] I switched to Pipewire, see <https://lists.opensuse.org/archives/list/factory@lists.opensuse.org/thread/VNROKVXVFICDVJXCXZQIB6UYHYVGFGFK/,`>

      ```bash
      sudo zypper install pipewire pipewire-pulseaudio pipewire-alsa wireplumber-pulse
      systemctl --user enable pipewire-pulse
      systemctl --user start pipewire-pulse
      ```

      which is working like a charm so far. I read that for some applications the sound quality is bad, but haven't encountered that yet.
      Switch profile between playback only (*A2DP*, high quality) and headset mode (*HSP/HFP*)


## GPU

```sh
lspci -v | less # and search vor `VGA`
sudo lshw -numeric -C display
```

- NVIDIA: `nvidia-smi`
    - find correct driver (version)
        - [NVIDIA driver website](https://www.nvidia.com/Download/index.aspx?lang=en-us)
        - `ubuntu-drivers device`
    - load kernel module without reboot

        ```bash
        # check if there is someone logged in
        ps ax | grep -i X
        # stop lightdm
        systemctl stop lightdm
        # stop everything that might be using nvidia
        for f in /sys/class/vtconsole/vtcon*/bind; do echo 0 > $f; done
        # remove old nvidia module
        rmmod nvidia_uvm nvidia_drm nvidia_modeset nvidia
        # load new nvidia module
        modprobe nvidia
        # check if nvidia is working
        nvidia-smi
        # start lightdm
        systemctl start lightdm
        ```


## Other

```bash
lspci # list PCI devices
```

## Udev

[ArchLinux Wiki](https://wiki.archlinux.org/title/Udev) | [Debian Wiki](https://wiki.debian.org/udev)

1. find device (information) for example with

   ```
   # udevadm monitor --environment --udev
   # dmesg
   ```

2. Get device attributes

   ```
   # udevadm info --atribute-walk --name="/dev/input/by-path/..."
   ```

3. add rule to `/etc/udev/rules.d/??.rules` and point to script, for example in `/usr/local/bin`,
4. create script to run commands
5. Reload `udev` rules

   ```
   # udevadm control --reload-rules
   ```

Examples

- [[docs/seb/Yubikey]]: lock/unlock computer when removing/inserting key

## MAC Address

#### Spoofing

<https://www.xmodulo.com/spoof-mac-address-network-interface-linux.html>
<https://arvdl.github.io/posts/mac-address-linux/>

- temporary ^8a2c0a

  ```bash
  sudo ip link set dev eth0 down
  sudo ip link set dev eth0 address 00:00:00:00:00:01
  sudo ip link set dev eth0 up
  ```

- permanent
    - with NetworkManager: edit `/etc/NetworkManager/dispatcher.d/00-changemac`

      ```bash
      #!/bin/sh
      if [ "$IFACE" = eth0 ]; then
        ip link set dev "$IFACE" address 00:00:00:00:00:01
      fi
      ```

      and change permissions `sudo chmod 755 /etc/NetworkManager/if-up.d/00-changemac`
    - with Systemd: edit `/etc/systemd/network/eth0.link`

      ```conf
      [Match]
      MACAddress=xx:xx:xx:xx:xx:xx

      [Link]
      MACAddressPolicy=random
      NamePolicy=kernel database onboard slot path
      ```

## Devices

### USB

```sh
lsusb
```

- set what USB devices are allowed to wake from sleep/hibernate, see [here](https://askubuntu.com/questions/848698/wake-up-from-suspend-using-wireless-usb-keyboard-or-mouse-for-any-linux-distro). Edit `/sys/bus/usb/devices/usb*/power/wakeup` with content `disabled` or `enabled`

### Keyboard

- Change layout
    - command line: `sudo loadkeys en_US`
    - X: `setxkbmap en_US`
- if not waking up after device was suspended try <https://askubuntu.com/a/949679> ^bf1df0
    - find device ID in `lsusb`
    - edit `/etc/default/grub` and add to `GRUB_CMDLINE_LINUX_DEFAULT`:

      ```bash
      usbhid.quirks=0x*ID_before_colon*:0x*ID_after_colon*:0x00000008
      # or try
      atkbd.reset # might need sudo modprobe psmouse if touchpad stops working
      ```

    - update grub on boot device: `update-config` (doesn't exist as a command in openSUSE, use `sudo grub2-mkconfig -o /boot/grub2/grub.cfg` instead)
- [OpenRGB](https://gitlab.com/CalcProgrammer1/OpenRGB): Open source RGB lighting control that doesn't depend on manufacturer software

