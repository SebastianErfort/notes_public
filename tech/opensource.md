---
title: Open Source
visibility: public
aliases:
  - Open Software
  - FOSS
related:
  - "[[OSPO]]"
  - "[[openscience|Open Science]]"
  - "[[data/index|Data]]"
---
# Open Source

|           |                                                             |
| --------- | ----------------------------------------------------------- |
| See also  | [[OSPO]], [Open Science](openscience)                       |
| Overviews | [awesome-open-source], [awesome-selfhosted], [awesome-ospo] |

## Motivation

- [presentation HPC Collab. Source & Standards, B. Lelbach (NVIDIA)](https://indico.cern.ch/event/1327562/contributions/5614154/attachments/2760998/4808099/hpc_collaborative_source_and_standards_at_nvidia__r0.pdf)
    - users
        - Allow modification to suit their needs.
        - Facilitate collaboration and innovation.
        - Ensure portability.
        - Guarantee long-term support.
        - Enable result reproduction
    - developers
        - Greater adoption of our products.
        - Insight into how our product is used.
        - Insight into who uses our product.
        - Enable result reproduction.
        - *My amendment: community contributions* (speaker on q from audience: at least in their case not too many contributions and requires work to incorporate PRs)


## Software

- [awesome-selfhosted]: A list of Free Software network services and web applications which can be hosted on your own servers
- [Free Software Directory @FSF](https://directory.fsf.org/wiki/Main_Page)
- [gnu.org](https://www.gnu.org/)
- <https://www.fossology.org/>: FOSSology is a open source license compliance software system and toolkit ^1a1526
- [Research Software Alliance: Guidelines](https://www.researchsoft.org/guidelines/)
- [[OSPO|Open Source Program Offices]]
- [OW2 IT infrastructure](https://www.ow2.org/view/IT_Infrastructure/): RocketChat, GitLab, SonarQube, Collabora

```dataview
TABLE WITHOUT ID
file.link AS "Name",
url AS "Website",
(join(category,", ")) AS "Category"
WHERE type = "software" AND (contains(license,"opensource") OR contains(license,"open-source"))
```


### Contributing

- [Article First Open Source Contribution][first-os-contrib]


## Hardware

- Open Source Hardware Association (OSHWA)
- [libreplanet.org: F/Right to Repair](https://libreplanet.org/wiki/Group:FSF/Fight-to-Repair): organisations, resources, successes


## Organisations

Tags: #check/opensource

See also [awesome-open-source] > organisations.

- [Open Source Initiative (OSI)](https://opensource.org)
    - [OSI Approved Licenses](https://opensource.org/licenses)
- [Free Software Foundation (FSF)](https://www.fsf.org)
    - [Protest Against DRM](https://www.fsf.org/news/worldwide-community-of-activists-protest-overdrive-and-others-forcing-drm-upon-libraries): [https://defectivebydesign.org](https://defectivebydesign.org/) #tech/drm
- [Free Software Foundation Europe (FSFE)](https://fsfe.org/index.en.html)
- [LibrePlanet](https://libreplanet.org)
- [CHAOSS](https://chaoss.community/): Community Health Analytics in Open Source Software
    CHAOSS is a Linux Foundation project focused on creating metrics, metrics models, and software to better understand open source community health on a global scale.
- [Software in the Public Interest (SPI)](https://www.spi-inc.org/)
- [Open and Free Technology Community (OFTC)](https://www.oftc.net/) (member of SPI) ^4c4450
  > The Open and Free Technology Community aims to provide stable and effective collaboration services to members of the community in any part of the world, while closely listening to their needs and desires.
- [OW2](https://www.ow2.org)
  > OW2 is an independent, global, open-source software community. We are not academics, we are not researchers, we are not lobbyists, we foster open source projects and we actually deliver software, and we claim to be the only such non-profit open source organisation of EU origin and DNA.
- Open Source Hardware Association (OSHWA)
- GitHub
- [[WHO#OSPO|WHO OSPO]]
- DPGA (Digital Public Goods Alliance)
    - https://socialimpact.github.com/insights/what-are-digital-public-goods-and-DPGA/
- [Open Source Initiative](https://opensource.org/osd/)
- [disroot.org](https://disroot.org): platform providing online services based on principles of freedom, privacy, federation and decentralization
- [GOV.UK Open Standards principles](https://www.gov.uk/government/publications/open-standards-principles/open-standards-principles)


## People

- Bryce Adelstein Lelbach: C++, US standards committee for programming languages
- Samuel Mbuthia: leads the WHO [[OSPO]]


## Glossary

| Term/Acronym | Description         |
| ------------ | ------------------- |
| DPG          | Digital Public Good |
| OSPO         | Open Source Program Office                    |


## News

- [Article ](https://www.theregister.com/2023/12/27/bruce_perens_post_open/) by (people:: [[Bruce Perensen]]) @TheRegister


## Events

Lists, overviews, etc.

- https://foss.events/

Past

- [LibrePlanet 2024 event by FSF](https://libreplanet.org/2024/): May 4 & 5, 2024

## References

- https://opensource.guide/
- [gnu.org: What is Free Software?](https://www.gnu.org/philosophy/free-sw.html)

[first-os-contrib]: <https://github.com/readme/guides/first-oss-contribution>
[awesome-open-source]: <https://github.com/cornelius/awesome-open-source>
[awesome-selfhosted]: <https://github.com/awesome-selfhosted/awesome-selfhosted>
[awesome-ospo]: <https://github.com/todogroup/awesome-ospo>
