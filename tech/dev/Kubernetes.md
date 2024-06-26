---
title: Kubernetes
visibility: public
tags:
  - dev/kubernetes
  - dev/k8s
  - dev/k3s
type: container
category:
  - orchestration
---
# Kubernetes

aka K8s (K-8 letters-s)
[Documentation](https://kubernetes.io/docs/home/)

[How to run Kubernetes workloads in systemd with Podman @RedHat](https://www.redhat.com/sysadmin/kubernetes-workloads-podman-systemd): Use Kubernetes YAML with Podman template to spin up pods/containers through [[linux#systemd|systemd]].

### Helm

[Documentation](https://helm.sh/docs/)
> package manager for Kubernetes

[Compose specification](https://github.com/compose-spec/compose-spec/blob/master/spec.md): Compose file format used to define multi-containers applications

## Implementations, Frameworks and Distributions

- [k8e](https://getk8e.com/): Kubernetes Easy Engine
- k3s
- k0s
- [Quarks](https://quarkus.io/)
  > A Kubernetes Native Java stack tailored for OpenJDK HotSpot and GraalVM, crafted from the best of breed Java libraries and standards.
  >
- [[OKD]]
- [[OpenShift]]


## Tools

- [Konveyor](https://www.konveyor.io/)
  > The Konveyor community helps modernize applications by providing open source tools to rehost, replatform, and refactor applications to Kubernetes and cloud-native technologies.

## References

- [Canoncial: Kubernetes at the edge](file://edu/kubernetes/MicroK8s+Strict+Confinement+Whitepaper.pdf) #dev/iot #dev/edge
- [Guide/Blog FaaS cluster on RPi's with Kubernetes](https://rpi4cluster.com/)
- training
    - [Linux Foundation: Introduction to Kubernetes (LFS158)][lf-intro-kubernetes]: free introduction course 15-20h course material, hands-on & assignments, ...

[lf-intro-kubernetes]: <https://training.linuxfoundation.org/training/introduction-to-kubernetes/>