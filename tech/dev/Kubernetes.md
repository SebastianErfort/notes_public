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
organisations:
  - "[[CNCF]]"
---
# Kubernetes

aka K8s (K-8 letters-s)
[Documentation](https://kubernetes.io/docs/home/)

[How to run Kubernetes workloads in systemd with Podman @RedHat](https://www.redhat.com/sysadmin/kubernetes-workloads-podman-systemd): Use Kubernetes YAML with Podman template to spin up pods/containers through [[linux#systemd|systemd]].

## Implementations, Frameworks and Distributions

- [k8e](https://getk8e.com/): Kubernetes Easy Engine
- k3s
    - [CIS Hardening Guide](https://docs.k3s.io/security/hardening-guide)
- k0s
- Microk8s
- [[minikube]]
- [[OKD]]
- [[OpenShift]]
- [Quarks](https://quarkus.io/)
  > A Kubernetes Native Java stack tailored for OpenJDK HotSpot and GraalVM, crafted from the best of breed Java libraries and standards.


## Architecture

### Control Plane

1. Kubernetes API: `kubectl` and `kubeadm` communicate with REST interface
    - list components with: `kubectl api-resources`
    - show Kubernetes system pods: `kubectl get pods -n kube-system`
    - show API pod info with: `kubectl describe pod kube-api... -n kube-system`
2. [etcd](https://etcd.io/): open-source, highly-available key-value store - saves all data about cluster state
3. scheduler: assign new pods to nodes
4. controller-manager: constantly check components, e.g. pods to start a new one in case of an issue
5. cloud provider API: connection to AWS, GCP, Azure, etc.


### Worker Nodes

- most clusters run with at least 3 worker nodes
- every node runs *Kubelet*, an agent ensuring pods are up and healthy, directly communicating with API
- container runtime interface (*CRI*): used by Kubelet to create containers
    - [[Containerd]]
    - [[CRI-O]]
    - [[Kata Containers]]
    - AWS Firecracker
    - [[Docker]] container engine removed in v1.24 (Dockershim), but images can be run
- *Kube-proxy*: communication between pods and services, direct connection to API

### Services

- ClusterIP: expose cluster-internal IP addresses
- LoadBalancer
- NodePort: expose node IP addresses at static ports


### Containers

- [Resource management](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)
  > [!example]-
  >
  > ```yaml
  > ---
  > apiVersion: v1
  > kind: Pod
  > metadata:
  >   name: frontend
  > spec:
  >   containers:
  >   - name: app
  >     image: images.my-company.example/app:v4
  >     resources:
  >       requests:
  >         memory: "64Mi"
  >         cpu: "250m"
  >       limits:
  >         memory: "128Mi"
  >         cpu: "500m"
  > ```


### Pods

- Deployment: replicas, no-downtime upgrades
- DaemonSet: one pod per node, e.g. background processes collecting metrics
- Jobs: one ore more pods, run until completion, then deletes pod


### Storage

- database outside of cluster, e.g. SQL with cloud providers offering connections
- *Kubernetes Persistent Volumes*: within cluster, objects called statefulSets can be used

## Security

Some container best practices

- unprivileged containers
- read-only root filesystem

```yaml
    spec:
      containers:
      - name: secured-container
        securityContext:
          allowPrivilegeEscalation: false
          runAsNonRoot: true
          capabilities:
            drop:
              - ALL
          readOnlyRootFilesystem: true
```

Tools

- [Snyk]: scan IaC files, including Kubernetes manifests

References

- US NSA Kubernetes hardening guide

## Tools

- [[argo]]
- [[Rancher]]
- [[OKD]]
- [Konveyor](https://www.konveyor.io/)
  > The Konveyor community helps modernize applications by providing open source tools to rehost, replatform, and refactor applications to Kubernetes and cloud-native technologies.

### Helm

[Documentation](https://helm.sh/docs/)
> package manager for Kubernetes

[Compose specification](https://github.com/compose-spec/compose-spec/blob/master/spec.md): Compose file format used to define multi-containers applications

## References

- repos & templates
    - [awesome-kubernetes], [awesome-k8s]
    - [HariSekhon/Kubernetes-configs](https://github.com/HariSekhon/Kubernetes-configs)
- [Canonical: Kubernetes at the edge](file://edu/kubernetes/MicroK8s+Strict+Confinement+Whitepaper.pdf) #dev/iot #dev/edge
- [Guide/Blog FaaS cluster on RPi's with Kubernetes](https://rpi4cluster.com/)
- [training and certification](https://kubernetes.io/training/)
    - [kubernetes-the-hard-way](https://github.com/kelseyhightower/kubernetes-the-hard-way)
    - Linux Foundation
        - [Linux Foundation: Introduction to Kubernetes (LFS158)][lf-intro-kubernetes]: free introduction course 15-20h course material, hands-on & assignments, ...
        - [LinuxFoundationX: Introduction to Kubernetes](https://www.edx.org/learn/kubernetes/the-linux-foundation-introduction-to-kubernetes)
        - Kubernetes and Cloud Native Associate exam
        - Certified Kubernetes Application Developer exam
        - Certified Kubernetes Administrator exam
- [article @theregister: Alibaba claims K8s meshes can require more resources than apps](https://www.theregister.com/2024/08/12/alibaba_microservices_mesh_canal/) #dev/k8s #tech/ecology
    - Alibaba Canal Mesh with much superior throughput and CPU consumption than Istio and Google Ambient


[lf-intro-kubernetes]: <https://training.linuxfoundation.org/training/introduction-to-kubernetes/>
[snyk]: <https://docs.snyk.io/>
[awesome-kubernetes]: <https://github.com/ramitsurana/awesome-kubernetes>
[awesome-k8s]: <https://github.com/tomhuang12/awesome-k8s-resources>
