---
visibility: public
title: Presenting
---

## Audience Interaction

- [Poll Everywhere](https://pollev.com/home): easily create polls
- > [!tip]- [Strawpoll](https://strawpoll.com/): Create your poll in seconds
  > - standard polls
  > - schedule
  > - advanced
  > - comments
  > - duplicate detection
  >   Seems to work better in [[revealjs]] presentations.

```dataview
TABLE WITHOUT ID
file.link AS "Name",
url AS "Website"
WHERE type = "software" AND contains(category, "present") OR contains(file.folder, "present")
SORT file.mdate
```

## Publication

- https://www.slideshare.net/

## Tools & Technologies

- see also [[video#Tools|Hardware > Video # Tools]]
- [reveal.js](https://revealjs.com/): HTML presentation framework | [Github](https://github.com/hakimel/reveal.js)
    - [Slides.com](https://slides.com/): online editor to create slide decks based on *reveal.js*

## References

- <https://hakim.se/> ([[revealjs]])
    - [Textify.it](https://lab.hakim.se/textify/): redraw images from characters (e.g. binary 0,1)
