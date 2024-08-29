---
title: Data
related:
  - "[[research_data|Research Data]]"
  - "[[tech/opensource|Open Source]]"
---
# Data

| Reference | Links                         |
| --------- | ----------------------------- |
| See also  | `=(join(this.related, ", "))` |

## Databases

```dataview
TABLE WITHOUT ID
file.link AS "Name",
("[Website](" + this.url + ")") AS "Links"
WHERE type = "software" and contains(category, "database")
```


## Tools and Technologies


```dataview
TABLE WITHOUT ID
file.link AS "Name",
("[Website](" + this.url + ")") AS "Links",
(join(tags, ", ")) AS "Tags"
WHERE contains(category, "data")
```

## References

- [Office for National Statitics (ONS) UK: open data publishing principles](https://digitalblog.ons.gov.uk/2017/01/06/some-open-data-publishing-principles/)
- [W3C organisation Web Best Practices](https://www.w3.org/TR/dwbp/)


## References

- [Terms of Use for Datasets @DCC RUG](https://www.rug.nl/digital-competence-centre/research-data/archive-and-publish/terms-of-use-v3.pdf)
