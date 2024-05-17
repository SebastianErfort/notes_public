---
title: Authentication
aliases:
  - Authentication
category: ""
---
# Authentication

## Protocolls and Technologies

```dataview
TABLE WITHOUT ID
file.link AS "Name",
desc-short AS "Description"
WHERE contains(category, "authentication") AND type != "software"
```

## Tools

- [auth0] | [Docs](https://auth0.com/docs)
- [lucia]
  > Lucia is an auth library written in TypeScript that abstracts away the complexity of handling sessions. It works alongside your database to provide an API that's easy to use, understand, and extend.

```dataview
TABLE WITHOUT ID
file.link AS "Name",
desc-short AS "Description"
WHERE contains(category, "authentication") AND type = "software"
```

[auth0]: <https://auth0.com/>
[lucia]: <https://github.com/lucia-auth/lucia>