---
title: Packaging
---

## Flatpak

- tend to bloat
    - improper clean-up after uninstall
      ```bash
      # try
      flatpack uninstall --unused
      flatpack repair
    ```
    - temporary files in `/var/tmp` or `/var/lib/flatpak/repo/tmp` (e.g. case of [[SoaresGirao_Willian|customer]])
    - forum threads as old as 2017 w/o proper solution, suggesting automated clean-up/manual deleting


## References

- [flatpak.org: Under the Hood](https://docs.flatpak.org/en/latest/under-the-hood.html)