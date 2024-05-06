---
title: Packaging
visibility: public
---
See also

- [[dev#Licensing|Development > Licensing]]

## Package Repositories

- [[Pulp]]


## Package Types

### [[Snap]]

### [[Flatpak]]

- tend to bloat
    - improper clean-up after uninstall

      ```bash
      # try
      flatpack uninstall --unused
      flatpack repair

      ```

    - temporary files in `/var/tmp` or `/var/lib/flatpak/repo/tmp`
    - forum threads as old as 2017 w/o proper solution, suggesting automated clean-up/manual deleting

## References

- [flatpak.org: Under the Hood](https://docs.flatpak.org/en/latest/under-the-hood.html)
