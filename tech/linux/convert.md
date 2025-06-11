---
aliases:
  - ImageMagick
title: convert
---
Imagemagick (`convert`): [Command Line Options](https://imagemagick.org/script/command-line-options.php) | [Security Policy](https://imagemagick.org/script/security-policy.php)

```bash
convert -list font # list available fonts (names might differ from other sources, so check these)
# Draw text on image at 75% height (-25% from center)
local height=$(identify -format %h $bgimage)
convert -fill $color -pointsize $(( height/25 )) -gravity center -font "DejaVu-Sans"\
  -draw "text 0,$(( -height/4 )) '${message}'" \
  "$bgimage" "image.png" >/dev/null

```