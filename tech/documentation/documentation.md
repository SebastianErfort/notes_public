---
title: Documentation
visibility: public
---

## Solutions

```dataview
LIST WITHOUT ID
(file.link + ": [Website](" + url + ")"+ " | [Documentation](" + docs + ")")
WHERE contains(file.folder, "tech/documentation") and type = "software"
SORT title
```


## References

- [A beginner’s guide to writing documentation @writethedocs(https://www.writethedocs.org/guide/writing/beginners-guide-to-docs/)]