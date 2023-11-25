---
title: Docker
type: software
category: container
tags:
  - dev/Docker
url: https://docker.com
docs: https://docs.docker.com/
visibility: public
---
`= ("[Website](" + this.url + ")")` | `= ("[Documentation](" + this.docs + ")")` | `= ("[Source](" + this.source + ")")`

## Commands

```bash
docker pull <image> # pull image from registry
docker container ls # list (running) containers
docker exec -it <container-id> /bin/bash # get a shell
docker run -it <image name> /bin/bash # get a shell
docker ps # list containers
```


## Images

Using an image checksum in the definition can be used to verify integrity and downloading a modified container.[^1]

[^1]: <https://docs.gitlab.com/ee/ci/docker/using_docker_images.html#use-checksum-to-keep-your-image-secure>

- [[Github#GitHub packages|Publish image as GitHub Package]]


## Rootless

<https://docs.docker.com/engine/security/rootless/>

- creates a new context
- running root and rootless Docker concurrently shouldn't be a problem anymore, but the context might have to be specified, as the rootless setup makes rootless Docker default[^2]

[^2]: https://serverfault.com/questions/1085738/docker-and-rootless-docker-side-by-side-is-it-allowed


### openSUSE

- `newuidmap` and `newgidmap` already available, package `uidmap` doesn't exist
- installed `fuse-overlayfs` as recommended
- Docker package from official repos didn't have script `dockerd-rootless-setuptool.sh`, so I am trying to install a package provided by Docker
- run (see [openSUSE forum](https://forums.opensuse.org/t/how-can-i-request-the-official-repository-provides-tools-for-rootless-docker/164199))

  ```bash
  sudo zypper install docker rootlesskit
  sudo systemctl --now disable docker.service
  curl -fsSL https://get.docker.com/rootless | sh
  systemctl --user --now enable docker.service
  ```

The [[openSUSE]] package `rootlesskit` doesn't include all the scripts other repo's packages provide.


### Disadvantages and Limitations

<https://docs.docker.com/engine/security/rootless/#known-limitations>

<https://linuxhandbook.com/rootless-docker/>
Using [Slirp4netns](https://github.com/rootless-containers/slirp4netns?ref=linuxhandbook.com) mode solves this problem, and shows the original address of the request. But it also has two problems.

- IPv6 not supported.
- speed is much slower (about 7Gbps).


# Glossary

Term | Description | Similar | Example
-|-|-|-
image |
registry | place to store images | harbor
context | like an environment (incl. endpoint) | | [docs](https://docs.docker.com/engine/context/working-with-contexts/)


## References

- [How to Assign a Static IP to a Docker Container](https://www.howtogeek.com/devops/how-to-assign-a-static-ip-to-a-docker-container/)
