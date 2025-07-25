---
title: Markdown: Benchmark MkDocs
---

# Markdown: Benchmark MkDocs

See [MkDocs Material documentation: Reference](https://squidfunk.github.io/mkdocs-material/reference/) and my [[markdown_benchmark|general Markdown Benchmark]].

Most non-standard Markdown features require extensions or plugins, configured in `mkdocs.yml`.

## Highlighting text

[Documentation: Highlight](https://facelessuser.github.io/pymdown-extensions/extensions/highlight/?h=highlight)

## Admonitions

!!! info "MkDocs admonitions"

    This highlighted block is an "admonition". In MkDocs the extension `admonition` is required in `mkdocs.yml`. MkDocs uses the syntax

    ```markdown
    !!! type "title"
        content

    ??? tip "collapsible, collapsed by default"

    ???+ tip "collapsible, expanded by default"
    ```

    This is problematic for various reasons and renders poorly in systems not supporting this extension.

## Tabbed Content

[Documentation: Tabbed](https://squidfunk.github.io/mkdocs-material/setup/extensions/python-markdown-extensions/?h=tabbed#tabbed)

`mkdocs.yml`

```yaml
markdown_extensions:
  - pymdownx.tabbed:
      alternate_style: true
```

Example:

=== "Tab 1"
    Markdown **content**.

    Multiple paragraphs.

=== "Tab 2"
    More Markdown **content**.

    - list item a
    - list item b

## Embedding

Using the extension `snippets`, files can be included.

Example: this project's `mkdocs.yml`

```yaml
--8<-- "mkdocs.yml"
```
