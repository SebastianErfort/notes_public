---
visibility: public
title: HTML
desc-short: HTML (Hyper Text Markup Language)
related:
  - "[[CSS]]"
  - "[[writing/Markdown|Markdown]]"
---
# HTML

See also my notes on [[CSS|CSS]] | [[Markdown|Markdown]]

## Language


### Tags

HTML tag: `<tag>Content</tag>` (some don't require a closing tag)

References

- [tag id vs name](https://stackoverflow.com/questions/5319754/cross-reference-named-anchor-in-markdown/7335259#7335259)


### Special Characters - Entities

HTML entities: reserved characters in HTML must be replaced with entities[^1]

> [!info]- [HTML Characters Entities cheatsheet (QuickRef.ME)](https://quickref.me/html-char.html#html-character-entity-references)
> <iframe title="" src="https://quickref.me/html-char.html#html-character-entity-references" width="100%" height="600"></iframe>

Additional

| Character | Code      | Description        |
| --------- | --------- | ------------------ |
| &blank;   | `&blank;` | Symbol for a space |

[^1]: <https://www.w3schools.com/HTML/html_entities.asp>


# Snippets, templates, etc

- Font
    - Specify font in tag with fallback `serif`

        ```html
        <div style="font-family: DejaVu Sans, serif;">Example text</div>
        ```

- overlay
    - filter
        - blur
            - <https://stackoverflow.com/questions/27583937/how-can-i-make-a-css-glass-blur-effect-work-for-an-overlay>


# References

- [W3C: World-Wide Web Consortium](https://www.w3.org/)
- [CanIUse.com](https://caniuse.com/): check feature/code compatibility
- [htmlreference.io](https://htmlreference.io/)
- [HTML character codes](https://www.rapidtables.com/web/html/html-codes.html) (symbols etc.): e.g. `&amp;`
