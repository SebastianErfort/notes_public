---
tags:
  - dev/markdown
  - tech/presentation
  - dev/html
visibility: public
title: Revealjs
---
[Homepage](https://revealjs.com/) | [Github](https://github.com/hakimel/reveal.js) | [Config](https://revealjs.com/config/)

> Create Stunning Presentations on the Web
> reveal.js is an open source HTML presentation framework. It's a tool that enables anyone with a web browser to create fully-featured and beautiful presentations for free.

- [Slides.com](https://slides.com/): online editor to create slide decks based on [[revealjs|reveal.js]]
- [Markdown](https://revealjs.com/markdown/)

## Configuration

- [Themes](https://revealjs.com/themes/)
- [Configuration](https://revealjs.com/config/)
- [Backgrounds](https://revealjs.com/backgrounds/)

## Features

Example files

- [Example Presentation reveal.js](file://rsc/revealjs/presentation_revealjs.md)
- [Collection of features by J. Reagle (bit outdated)](file://rsc/markdown/revealjs_features_JReagle.md) ([source](https://reagle.org/joseph/talks/2014/exemplar.md))

### Fragments

[Documentation](https://revealjs.com/fragments/)
<iframe title="" src="https://revealjs.com/fragments/" width="100%" height="400"></iframe>
> [!info]- List of all available fragments
>
> Name | Effect
> -|-
> fade-out | Start visible, fade out
> fade-up | Slide up while fading in
> fade-down | Slide down while fading in
> fade-left | Slide left while fading in
> fade-right | Slide right while fading in
> fade-in-then-out | Fades in, then out on the next step
> current-visible | Fades in, then out on the next step
> fade-in-then-semi-out | Fades in, then to 50% on the next step
> grow | Scale up
> semi-fade-out | Fade out to 50%
> shrink | Scale down
> strike | Strike through
> highlight-red | Turn text red
> highlight-green | Turn text green
> highlight-blue | Turn text blue
> highlight-current-red | Turn text red, then back to original on next step
> highlight-current-green | Turn text green, then back to original on next step
> highlight-current-blue | Turn text blue, then back to original on next step

[Custom Fragments](https://revealjs.com/fragments/#custom-fragments)

```css
.fragment.blur {
  filter: blur(5px);
}
.fragment.blur.visible {
  filter: none;
}
.fragment.blur.current-fragment {
  filter: none;
}
```

## Integration

- [[Pandoc]]
- [Automate build and publish to Pages with Travis CI - GH GIST](https://gist.github.com/jonashackt/85f9df62986db4e70396e3c494e26b76)
- reveal-hugo: [Github](https://github.com/dzello/reveal-hugo)
  A Hugo theme for [Reveal.js](https://revealjs.com/) that makes authoring and customization a breeze. With it, you can turn any properly-formatted Hugo content into a HTML presentation.
