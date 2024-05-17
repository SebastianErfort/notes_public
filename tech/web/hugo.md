---
title: Hugo
visibility: public
url: "https://gohugo.io/"
---
# Hugo

[Installation](https://gohugo.io/installation/linux/)
```sh
sudo snap install hugo
```

Documentation

- Config
    - [All Configuration Settings](https://gohugo.io/getting-started/configuration/#all-configuration-settings)
    - [Configure Front Matter](https://gohugo.io/getting-started/configuration/#configure-front-matter)
    - [Imaging](https://gohugo.io/content-management/image-processing/#imaging-configuration)
- site/repo structure
    - [Page Bundles](https://gohugo.io/content-management/page-bundles/)


## Configuration

### Taxonomies, Categories and Tags

[Keep taxonomy case](https://discourse.gohugo.io/t/issue-with-preservetaxonomynames-and-capitalization/5717)
```toml
preserveTaxonomyNames = true
```

### Themes

- [Themes](https://themes.gohugo.io/)


Name | Links | Description
-|-|-
Book | [GitHub](https://github.com/alex-shpak/hugo-book) [Demo](https://hugo-book-demo.netlify.app/) | Simple and clean documentation style sites
Clarity | [GitHub](https://github.com/chipzoller/hugo-clarity) [Demo](https://neonmirrors.net/) | A technology-minded theme for Hugo based on VMware's open-source [Clarity Design System](https://clarity.design/) featuring rich code support, dark/light mode, mobile support, and much more
DocuAPI | [GitHub](https://github.com/bep/docuapi) [Demo](https://docuapi.netlify.app/) | **DocuAPI** is a beautiful multilingual API documentation theme for [Hugo](http://gohugo.io/). This theme is built on top of the beautiful work of [Robert Lord](https://github.com/lord) and others on the [Slate](https://github.com/slatedocs/slate) project ([Apache 2 License](https://github.com/slatedocs/slate/blob/master/LICENSE)). The JS part has recently been rewritten from Jquery to [AlpineJS](https://alpinejs.dev/).
Doks |  [Website](https://getdoks.org/) | Modern Documentation Theme
Hugoplate | [GH](https://github.com/zeon-studio/hugoplate) | free starter template built with Hugo and TailwindCSS that will save you hours of work
LoveIt | [GitHub](https://github.com/dillonzq/LoveIt) | clean, elegant but advanced blog theme
Stack | [GitHub](https://github.com/CaiJimmy/hugo-theme-stack) [Demo](https://demo.stack.jimmycai.com/) | Card-style blog, dark mode (switchable), tags, archives


#### Clarity

[My fork](https://github.com/SebastianErfort/hugo-clarity)


### Extensions and Add-ons


- [hugo-easy-gallery](https://github.com/Darthagnon/hugo-easy-gallery/tree/production): Automagical css image gallery in Hugo using shortcodes, with optional lightbox/carousel gadget using PhotoSwipe and jQuery.
- [Add scrolling TOC to sidebar](https://www.nodinrogers.com/post/2023-04-06-add-floating-toc-in-hugo-clarity-theme/)
- <https://hugocodex.org/add-ons/>
    - [Breadcrumbs](https://hugocodex.org/add-ons/breadcrumbs/)
- [Floating sidebar table of contents][Floating TOC] through HTML and SASS


## Writing Pages

- [Front matter](https://gohugo.io/content-management/front-matter/
- [Shortcodes](https://gohugo.io/content-management/shortcodes/)


## Layout


### Pages


### Page Resources

- [Blog post on Page Resources and Page Bundles](https://www.regisphilibert.com/blog/2018/01/hugo-page-resources-and-how-to-use-them/) (2024-03-17)

[Page bundles](https://gohugo.io/content-management/page-bundles/)
  > Page Bundles are a way to group Page Resources.
  > A Page Bundle can be one of:
  >
  > - Leaf Bundle (leaf means it has no children)
  > - Branch Bundle (home page, section, taxonomy terms, taxonomy list)

### Templates and Partials

> [!tip]- [resize image](https://discourse.gohugo.io/t/resize-images-in-partial-html-file/22811/3)
>
> ```css
> {{ range (where .Pages “Section” “gallery”) }}
>   {{ range .Resources.ByType "image" }}
>     {{ $resized_image := .Resize "400x" }}
>     <img src="{{ $resized_image.RelPermalink }}" />
>   {{ end }}
> {{ end }}
> ```


## Hosting and Deployment


### GitHub Pages

<https://gohugo.io/hosting-and-deployment/hosting-on-github/>


## Examples

- [my website using Hugo-clarity theme](sebastianerfort@github.io)


## References

- [roneo.org](https://roneo.org/en/): Thinking out loud about Linux, Git, Hugo and the Jamstack.
    - [Edit YAML Front Matter of multiple Markdown files](https://roneo.org/en/hugo-edit-yaml-files-from-the-cli-with-yq/) using [[yq]]

[Floating TOC]: [https://www.nodinrogers.com/post/2023-04-06-add-floating-toc-in-hugo-clarity-theme/#modify-the-singlehtml-file](Blog nodinrogers: Adding a floating TOC to the Hugo-Clarity theme) (4 February 2024)
