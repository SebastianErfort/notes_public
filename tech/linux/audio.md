---
visibility: public
title: "Linux: Audio"
---
## Pipewire

[Documentation](https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/home)

I switched to Pipewire, see <https://lists.opensuse.org/archives/list/factory@lists.opensuse.org/thread/VNROKVXVFICDVJXCXZQIB6UYHYVGFGFK/,`>

```bash
sudo zypper install pipewire pipewire-pulseaudio pipewire-alsa wireplumber-pulse
systemctl --user enable pipewire-pulse
systemctl --user start pipewire-pulse
```

which is working like a charm so far. I read that for some applications the sound quality is bad, but haven't encountered that yet.

### Config

- [What are those Analog Stereo and Digital Stereo (IEC958) profile?](https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/FAQ#what-are-those-analog-stereo-and-digital-stereo-iec958-profile)