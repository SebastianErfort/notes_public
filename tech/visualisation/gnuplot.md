---
title: Gnuplot
type: software
category: visualisation
url: "http://gnuplot.info/"
---

[Documentation](http://gnuplot.info/documentation.html)

- [Palette](http://gnuplot.info/docs_5.5/loc13465.html)

Common file extensions[^1]: `.gp`, `.gnu`, `.gnuplot`, `.plot`, `.plt`

[^1]: <https://stackoverflow.com/a/10053805>

## Config

See `help startup`and `show loadpath` for info on the config file and startup. On Unix systems Gnuplot will look for `~/.gnuplot` for user settings.

## My Stuff

I created a [gnuplot Git repo](https://github.com/SebastianErfort/gnuplot) a while ago to house my files, settings, scripts, functions etc.

To set it up clone the repo to the loadpath directory specified in `gnuplotrc` (for example `~/.config/gnuoplot`) or create a symlink and copy/link the rc file to `~/.gnuplot` (standard path Gnuplot uses for its config)
