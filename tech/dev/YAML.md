---
title: YAML
visibility: public
tags: [dev/yaml]
---

[YAML 1.2 Revision 1.2.2](https://yaml.org/spec/1.2.2/)

```query
#dev/yaml
```


## References
<https://yaml-multiline.info/>: YAML multi-line (string) syntax explained, with examples

## Linting
yamllint: [Documentation](https://yamllint.readthedocs.io/en/stable/index.html) | [![|20](github.png) GitHub](https://github.com/adrienverge/yamllint)

### Examples
```yaml
# |2 will preserve leading white space by telling yaml there are 2 spaces of
# additional indentation
host_config: |2
    "host": "server.domain.com"
# ignore linebreaks until next key
description: >-
  Tasted a lot like banana
  with a slight sour note.
```
