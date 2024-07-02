---
title: RPM (RedHat Package Manager)
type: packaging
category:
  - manager
---
```sh
# display size of installed rpm package
rpm --queryformat='%12{SIZE} %{NAME}\n' -q java-11-openjdk-headless
```