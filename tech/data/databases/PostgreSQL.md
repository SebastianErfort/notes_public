---
name: PostgreSQL
type: software
category: database
url: "https://www.postgresql.org/"
docs: "https://www.postgresql.org/docs/"
developer: PostgreSQL Global Development Group
docker-image: postgres
desc-short: |
  PostgreSQL, often simply "Postgres", is an object-relational database management system (ORDBMS) with an emphasis on extensibility and standards-compliance.
tags:
  - tech/db
  - tech/db/PostgreSQL
  - tech/db/Postgres
wikipedia: "https://en.wikipedia.org/wiki/PostgreSQL"
visibility: public
title: PostgreSQL
---
`= ("[Website](" + this.website + ")")` |  `= ("[Github](" + this.github + ")")`
`= ("> " + this.desc-short)`

## Configuration

- [Host-based authentication: pg_hba.conf](https://www.postgresql.org/docs/current/auth-pg-hba-conf.html)


## Docker

```bash
docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres
```
