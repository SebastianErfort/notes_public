---
title: Design
visibility: public
tags:
  - dev/design
aliases:
  - Fonts
---
# Design

## UI

- [Patternfly]
    > PatternFly is an open source design system that enables teams to create consistent and scalable enterprise products. PatternFly is sponsored and maintained by Red Hat, but is open to all.
- [9 Graphic Design courses](https://www.codingem.com/best-graphic-design-courses/)

### Fonts

Tags: #dev/design/fonts
See also (related:: [[linux#Fonts]])

- [Nerd Fonts](https://www.nerdfonts.com)
    - [Cheatsheet](https://www.nerdfonts.com/cheat-sheet): find symbols/glyphs
- [JetBrains](https://www.jetbrains.com/lp/mono/) | [Nerd Font Patch](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)
- Futura
- Alegreya: [typographica.org review](https://typographica.org/typeface-reviews/alegreya-ht/)
- <https://www.cufonfonts.com/>
- [Google API: Fonts](https://developers.google.com/fonts/docs/getting_started)
    for example add stylesheet link to request web font(s)

    ```html
    <link rel="stylesheet"  href="https://fonts.googleapis.com/css?family=Font+Name">
    ```

- <https://home.unicode.org/>
- <https://www.stixfonts.org/>: The mission of the Scientific and Technical Information Exchange (STIX) font creation project is the preparation of a comprehensive set of fonts that serve the scientific and engineering community in the process from manuscript creation through final publication, both in electronic and print formats

Tools

- font identification
    - [Font finder](https://www.fontspring.com/matcherator): Upload an image of text, find what the font is
    - <https://www.myfonts.com/pages/whatthefont>


### Icons

- FontAwesome Icons: [Search free icons](https://fontawesome.com/search?o=r&m=free) | [Github](https://github.com/FortAwesome/Font-Awesome)
    - CSS: download and import as

        ```html
        <link rel="stylesheet" href="font-awesome/css/fontawesome.css">
        ```

    - [Documentation](https://fontawesome.com/docs/web/)
        - [animation](https://fontawesome.com/docs/web/style/animate)
- Feather icons: [GitHub](https://github.com/feathericons/feather) | <a href="https://feathericons.dev/">feathericons.dev</a>
- [Icons8](https://icons8.com/)
- <https://iconduck.com/>
- GitLab: [[rug/lwp/GitLab#^8b2ea8|GitLab icon SVGs]]
- [Lucide open source icons](https://lucide.dev/) [source](https://github.com/lucide-icons/lucide)
    - used by [[obsidian]]
- <https://super.so/icons>

### Colours

<https://coolors.co/?home>
<https://www.colourlovers.com/>

### Illustrations

- [storyset](https://storyset.com/): free customizable illustrations

### Qt

<https://doc.qt.io/>
[[linux#Plasma Widgets - Plasmoids|Plasma Widgets - Plasmoids]]

## Tools

- [[Inkscape]]: free vector graphics program
- [Figma](https://www.figma.com/): collaborative design tool (has free version)

## Help

### Command Line

[docopt](http://docopt.org/): Pythonic command-line interface description language - deprecated, but useful as reference for layout
Example:

```
Naval Fate.

Usage:
  naval_fate -h | --help
  naval_fate --version

Options:
  -h --help     Show this screen.
  --version     Show version.
```


## References

[patternfly]: <https://www.patternfly.org/>
