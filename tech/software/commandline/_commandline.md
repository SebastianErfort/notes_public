---
aliases:
  - Terminal
  - Command Line
  - commandline
title: Commandline
---
Record command output as *typescript* (color and other ANSI formatting codes)
```
script -q /dev/null -c "$command" > output.txt
```
Convert ANSI to HTML
```
cat "$file" | ansi2html > output.html
```