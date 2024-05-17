---
name: Multipass
type: software
category: virtualisation
developer: canonical
visibility: public
title: Multipass
---

## Installation

```bash
snap install multipass
snap info multipass
```

## Commands

```bash
multipass find # show available images
multipass launch <image name> [--name <instance name>] # launch instance with specific image
```

## Issues

On openSuse launching an instance gets stuck indefinitely.

## Examples

- [[2023-04-18#^936a8e|project using Multipass by Remco]]
