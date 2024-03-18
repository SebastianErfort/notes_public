---
visibility: public
title: Github
---
# GitHub

See also my notes on [[git]]

[Explore](https://github.com/explore) | [Topics](https://github.com/topics) | [Trending](https://github.com/trending) | [Collections](https://github.com/collections)

> [!warning] Consider **not** using GitHub: [article Give Up GitHub! @sfconservancy.org](https://giveupgithub.org/)

## To Do

[Issues](https://github.com/issues) | [Pull Requests](https://github.com/pulls) | [Notification Subscriptions](https://github.com/notifications/subscriptions)

## Projects

[Github Projects quick start](https://docs.github.com/en/issues/planning-and-tracking-with-projects/learning-about-projects/quickstart-for-projects)

## Config

### Customisation

##### .github repository

<https://towardsdev.com/setting-up-default-github-files-with-github-repository-75fd23d71161>
Special repository with templates etc. for new issues, pull requests etc.

## Dev

### GitHub packages

<https://github.com/features/packages>
> Safely publish and consume packages within your organization or with the entire world

Package software, e.g. in a [[Docker]] container, and make it available from <https://ghcr.io>

Examples

- [[markdownlint|markdownlint-cli]]

## CI/CD

Tags: #dev/CICD

- [Article: Provisioning self-hosted GitHub Actions runners on demand ](https://github.com/readme/guides/github-runners-philips)
    GitHub repo [terraform-aws-github-runner](https://github.com/philips-labs/terraform-aws-github-runner) | [Docs](https://philips-labs.github.io/terraform-aws-github-runner/)
- [Dependabot](https://docs.github.com/en/code-security/dependabot): Monitor vulnerabilities in dependencies used in your project and keep your dependencies up-to-date #dev/security

## READMEs and Markdown

GitHub uses [**kramdown**](Markdown.md#kramdown) for Markdown conversion, [**Rouge**](http://rouge.jneen.net/) syntax highlighting, and incremental building disabled.

## GitHub Pages

- [Creating a GitHub Pages site](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site)
- [Configuring a publishing source for your GitHub Pages site](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)
- [Using environments for deployment](https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment)
