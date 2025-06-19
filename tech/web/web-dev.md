---
visibility: public
title: Web Development
---
# Web Development

| Resource    | References                                                    |
| ----------- | ------------------------------------------------------------- |
| Design      | [notes](design), [icons](design#icons), [fonts](design#fonts) |
| Development | [[HTML]], [[CSS]]                                             |

## Website

Consider providing `robots.txt` and [[humans.txt|`humans.txt`]] providing website info in a standardised colophon.

### Static Site Hosting

> [!details]- [Cloudflare Pages](https://pages.cloudflare.com/)
> Free $0
> - 1 build at a time
> - 500 builds per month
> - 100 custom domains per project
> - Unlimited sites
> - Unlimited static requests
> - Unlimited bandwidth

#### GitLab Pages

See [[public/tech/dev/git/GitLab#GitLab Pages|notes on GitLab Pages]].

### Frameworks

- [Docusaurus](https://docusaurus.io/): open-source, powered by [[MDX]], built using [[React]], supports translations
    ⚠ Facebook development. [GitHub](https://github.com/facebook/docusaurus)
- themes
    - [Jamstack: Themes for Hugo, Jekyll, ...](https://jamstackthemes.dev/)

- [[_hugo|Hugo]]
- [[hexo]]
- [[jekyll]]
- [[public/tech/documentation/MkDocs|MkDocs]]
- [[wowchemy]]
- [[publii]]
- [[Open SDG Platform]]
- [[astro]]
- [[Gatsby]]
- [[Pelican]]
- [[Bootstrap]]

## Assets

- [favicon.io](https://favicon.io/)
  > Quickly generate your favicon from an image by uploading your image below. Download your favicon in the most up to date formats.


## Embed

- [oEmbed format](https://oembed.com/): format for API supported by a number of websites, e.g. Flickr. Get standard reply with data required for embedding.

## Meta Data

- [Schema.org](https://schema.org/)
  > Schema.org is a collaborative, community activity with a mission to create, maintain, and promote schemas for structured data on the Internet, on web pages, in email messages, and beyond.
- [[humans.txt]]

## Domains

[[DDNS]]

## Security

### Authentication

<https://openid.net/what-is-openid/>
<https://goteleport.com/>

### Certificates

<https://smallstep.com/>

### Protocolls

#### HTTP(S)

[CORS (Cross-origin Resource Sharing)](https://web.dev/cross-origin-resource-sharing/?utm_source=devtools)

### Tools

[Can I use _ ?][can-i-use] check availability of features for different browsers

[OWASP ZAP](https://www.zaproxy.org) | [Github]((<https://github.com/zaproxy/zaproxy>)
> The OWASP Zed Attack Proxy (ZAP) is one of the world’s most popular free security tools and is actively maintained by a dedicated international team of volunteers. It can help you automatically find security vulnerabilities in your web applications while you are developing and testing your applications. It's also a great tool for experienced pentesters to use for manual security testing.


## References

- [*js-cookie*](https://github.com/js-cookie/js-cookie): A simple, lightweight JavaScript API for handling browser cookies

[can-i-use]: <https://caniuse.com/>