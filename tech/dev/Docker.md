---
title: Docker
type: software
category: container
tags:
  - dev/Docker
url: "https://docker.com"
docs: "https://docs.docker.com/"
visibility: public
---
# Docker

`= ("[Website](" + this.url + ")")` | `= ("[Documentation](" + this.docs + ")")` | `= ("[Source](" + this.source + ")")`

> [!tip] Important Commands
>
> ```bash
> docker pull $image # pull image from registry
> docker ps # list containers
> docker container ls # list (running) containers
> docker run -d -it $image_name # start persistent container
> docker exec -it $container_id /bin/bash # get a shell
> ```


## Images

Using an image checksum in the definition can be used to verify integrity and downloading a modified container.[^gldocs-docker-image-security-checksum]

- [[github#GitHub packages|Publish image as GitHub Package]]


## Installation

- [Debian from `apt` repo](https://docs.docker.com/engine/install/debian/#install-using-the-repository)

### Rootless

<https://docs.docker.com/engine/security/rootless/>

- creates a new context
- running root and rootless Docker concurrently shouldn't be a problem anymore, but the context might have to be specified, as the rootless setup makes rootless Docker default[^2]

[^2]: https://serverfault.com/questions/1085738/docker-and-rootless-docker-side-by-side-is-it-allowed

Keep user containers alive after logout

```bash
sudo loginctl enable-linger $(id -u)
export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock
export XDG_RUNTIME_DIR=/run/user/$(id -u)
systemctl --user status docker.service
# if still dead try
systemctl --user restart docker.service
```

^4d425a

#### Disadvantages and Limitations

<https://docs.docker.com/engine/security/rootless/#known-limitations>

<https://linuxhandbook.com/rootless-docker/>
Using [Slirp4netns](https://github.com/rootless-containers/slirp4netns?ref=linuxhandbook.com) mode solves this problem, and shows the original address of the request. But it also has two problems.

- IPv6 not supported.
- speed is much slower (about 7Gbps).


#### openSUSE

- `newuidmap` and `newgidmap` already available, package `uidmap` doesn't exist
- installed `fuse-overlayfs` as recommended
- Docker package from distro repos didn't have script `dockerd-rootless-setuptool.sh`, so I am trying to install a package provided by Docker
- run (see [openSUSE forum](https://forums.opensuse.org/t/how-can-i-request-the-official-repository-provides-tools-for-rootless-docker/164199))

  ```bash
  sudo zypper install docker rootlesskit
  sudo systemctl --now disable docker.service
  curl -fsSL https://get.docker.com/rootless | sh
  systemctl --user --now enable docker.service
  ```

The [[openSUSE]] package `rootlesskit` doesn't include all the scripts other repo's packages provide.


## Glossary

Term | Description | Similar | Example
-|-|-|-
image |
registry | place to store images | harbor
context | like an environment (incl. endpoint) | | [docs](https://docs.docker.com/engine/context/working-with-contexts/)

## References

- [How to Assign a Static IP to a Docker Container](https://www.howtogeek.com/devops/how-to-assign-a-static-ip-to-a-docker-container/)
- repos & templates
    - [HariSekhon/Dockerfiles](https://github.com/HariSekhon/Dockerfiles)

[^gldocs-docker-image-security-checksum]: <https://docs.gitlab.com/ee/ci/docker/using_docker_images.html#use-checksum-to-keep-your-image-secure>