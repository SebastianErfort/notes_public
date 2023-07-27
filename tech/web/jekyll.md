---
name: Jekyll
title: Jekyll
type: software
category: ""
url: "https://jekyllrb.com/"
docker-image: ""
desc-short: |
  ...
tags: ""
visibility: public
---
`= ("[Website](" + this.website + ")")` |  `= ("[Github](" + this.github + ")")`
`= ("> " + this.desc-short)`
[Github Pages](github#Github Pages)

# YAML Front matter
Available keys/options are
```yaml
---
title: "Title"
last_modified_at: 2022-03-09T16:20:02-05:00
excerpt_separator: "<!--more-->"
search: false
categories:
  - category1
tags:
  - tag1
header:
  teaser: /assets/images/my-awesome-post-teaser.jpg
  image:
  caption:
gallery:
  - url: /assets/images/gallery-image-1.jpg
    image_path: /assets/images/gallery-image-1-th.jpg
    alt: "image 1"
    title: "Image 1 title caption"
---
```

<!--more-->
This post has a manual excerpt `<!--more-->` set after the second paragraph. The following YAML Front Matter has also be applied:
```yaml
excerpt_separator: "<!--more-->"
```

# Templates, Snippets and Examples
- [Create table from CSV file](https://jekyllrb.com/tutorials/csv-to-table/#next-steps)

# Customisation
[FontAwesome icon search](https://fontawesome.com/v5/search)

## Themes
http://jekyllthemes.org/

### Minimal Mistakes
- [Github](https://github.com/mmistakes/minimal-mistakes)
- [Website](https://mmistakes.github.io/minimal-mistakes/)
  - [Configuration](https://mmistakes.github.io/minimal-mistakes/docs/configuration/)
  - [Sample Collections]()
  - [Sample Posts](https://mmistakes.github.io/minimal-mistakes/year-archive/)
    - [Sample post: gallery](https://mmistakes.github.io/minimal-mistakes/post%20formats/post-gallery/)
    - [Markup: HTML Tags and Formatting](https://raw.githubusercontent.com/mmistakes/minimal-mistakes/master/docs/_posts/2013-01-11-markup-html-tags-and-formatting.md): forms, buttons, etc.
    - [Header Image Overlay](https://mmistakes.github.io/minimal-mistakes/layout/uncategorized/layout-header-overlay-image/)

### Git-Wiki
[Demo](https://www.drassil.org/git-wiki/main_page) | [![|20](github.png)](https://github.com/Drassil/git-wiki-theme)

### LibDoc
[Website](https://olivier3lanc.github.io/Jekyll-LibDoc/) | [![|20](github.png)](https://olivier3lanc.github.io/Jekyll-LibDoc/) | [Demo](https://jamstackthemes.dev/demo/theme/jekyll-libdoc/)

### Just the Docs
[Website](https://just-the-docs.github.io/just-the-docs/) | [![|20](github.png)](https://github.com/just-the-docs/just-the-docs)

### Chirpy
[Github](https://github.com/cotes2020/jekyll-theme-chirpy/) | [Website](https://chirpy.cotes.page/)
![](http://jekyllthemes.org/thumbnails/chirpy.png)
> [!info]- Features
> - Localized Layout
> - Dark/Light Theme Mode
> - Pinned Posts
> - Hierarchical Categories
> - Last Modified Date for Posts
> - Table of Contents
> - Auto-generated Related Posts
> - Syntax Highlighting
> - Mathematical Expressions
> - Mermaid Diagram & Flowchart
> - Disqus/Utterances/Giscus Comments
> - Search
> - Atom Feeds
> - Google Analytics
> - GA Pageviews Reporting
> - SEO & Performance Optimization

### Yet Another Theme (YAT)
[Github](https://github.com/jeffreytse/jekyll-theme-yat/) | [Website](https://jeffreytse.github.io/jekyll-theme-yat/)
![](http://jekyllthemes.org/thumbnails/jekyll-theme-yat.png)

### Kross
[Github](https://github.com/themefisher/kross-jekyll-portfolio-template) | [Website](https://demo.themefisher.com/kross/)
![](http://jekyllthemes.org/thumbnails/kross-portfolio-template.jpg)

### Zolan
[Github](https://github.com/artemsheludko/zolan) | [Website](https://artemsheludko.github.io/zolan/)
![https://artemsheludko.github.io/zolan/](http://jekyllthemes.org/thumbnails/zolan.png)
Features
-   100% responsive and clean theme
-   Optimized for mobile devices
-   Minimal design
-   Valid HTML5 code
-   Post sharing
-   Subscription form
-   Supports Disqus Comments
-   Instagram Feed
-   Ionicons Icons
-   Google Fonts
