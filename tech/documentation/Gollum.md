---
title: Gollum
type: software
category: Wiki
docs: "https://github.com/gollum/gollum/wiki"
url: "https://github.com/gollum/gollum"
docker-image: "gollumwiki/gollum:master"
github: "https://github.com/gollum/gollum"
visibility: public
---

## Markdown

[Markdown flavors](https://github.com/gollum/gollum#markdown-flavors)
> By default, Gollum ships with the `kramdown` gem to render Markdown. However, you can use any [Markdown renderer supported by github-markup](https://github.com/github/markup/blob/master/lib/github/markup/markdown.rb). This includes [CommonMark](https://commonmark.org/) support via the `commonmarker` gem. The first installed renderer from the list will be used (e.g., `redcarpet` will NOT be used if `github/markdown` is installed). Just `gem install` the renderer of your choice.

## Running Gollum via Docker

See [Documentation](https://github.com/gollum/gollum/wiki/Gollum-via-Docker)

- [via Docker compose](https://github.com/gollum/gollum/wiki/Gollum-via-docker-compose)

2023-05-03: fails for me with error

```
Rugged::ConfigError at /
repository path '/wiki/' is not owned by current user`
```

The problem seems to be that I'm running Docker rootless, so my user doesn't match `root`, used in the container. For now I am using

```bash
sudo env DOCKER_HOST=unix:///run/user/1000/docker.sock docker run --user 0 --rm -p 4567:4567 --name gollum -v ~/git/wiki.wiki:/wiki gollumwiki/gollum:master --mathjax
```

## Issues

- search includes content of files such as SVG images
- doesn't render `:...:` emojis
