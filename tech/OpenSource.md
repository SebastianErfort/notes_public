---
title: Open Source
visibility: public
aliases:
  - Open Software
  - FOSS
---

See also

- [[openscience|Open Science]]
- [[ospo]]


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
category AS "Category"
WHERE type = "software" AND (contains(license,"opensource") OR contains(license,"open-source"))
```
<!--
GROUP BY category
broken because category now array?
-->


## Hardware

- Open Source Hardware Association (OSHWA)
- [libreplanet.org: F/Right to Repair](https://libreplanet.org/wiki/Group:FSF/Fight-to-Repair): organisations, resources, successes


## Organisations

Tags: #cio/opensource

- [Free Software Foundation (FSF)](https://www.fsf.org)
    - [Protest Against DRM](https://www.fsf.org/news/worldwide-community-of-activists-protest-overdrive-and-others-forcing-drm-upon-libraries): [https://defectivebydesign.org](https://defectivebydesign.org/) #tech/drm
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


## People

- Bryce Adelstein Lelbach: C++, US standards committee for programming languages
- Samuel Mbuthia: leads the WHO [[OSPO]]


## Glossary

Term/Acronym | Description
-|-
DPG | Digital Public Good


## News

- [Article ](https://www.theregister.com/2023/12/27/bruce_perens_post_open/) by (people:: [[Bruce Perensen]]) @TheRegister


- https://opensource.guide/
- [gnu.org: What is Free Software?](https://www.gnu.org/philosophy/free-sw.html)
