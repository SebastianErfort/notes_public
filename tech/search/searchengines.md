---
visibility: public
title: Searchengines
---
```dataview
TABLE WITHOUT ID
  file.link AS "Name",
  ("[Website](" + url + ")" + " | [Documentation](" + docs + ")" + " | [Source](" + source + ")") AS Links
WHERE type = "software" and category = "search"
```

[iresearch](https://github.com/iresearch-toolkit/iresearch): cross-platform, high-performance document oriented search engine library written entirely in C++ with the focus on a pluggability of different ranking/similarity models

# Google

[Google Advanced Search Features @lifewire](https://www.lifewire.com/advanced-google-search-3482174)
