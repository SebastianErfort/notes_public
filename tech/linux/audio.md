---
visibility: public
title: Audio
---
I switched to Pipewire, see <https://lists.opensuse.org/archives/list/factory@lists.opensuse.org/thread/VNROKVXVFICDVJXCXZQIB6UYHYVGFGFK/,`>

```bash
sudo zypper install pipewire pipewire-pulseaudio pipewire-alsa wireplumber-pulse
systemctl --user enable pipewire-pulse
systemctl --user start pipewire-pulse
```

which is working like a charm so far. I read that for some applications the sound quality is bad, but haven't encountered that yet.
