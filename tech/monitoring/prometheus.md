---
title: Prometheus
---
[Cheat sheet](https://promlabs.com/promql-cheat-sheet/)

## Features

- v3 brings improved performance - less memory and faster

## Tools & Implementations

- Kubernetes: [kube-prometheus-stack](https://bhsource.bullhorn.com/kubernetes/helm-charts/-/tree/master/kube-prometheus-stack)
- Exporters
    - [[windows_exporter]]
    - [blackbox-exporter](https://github.com/prometheus/blackbox_exporter)
  >     The blackbox exporter allows blackbox probing of endpoints over HTTP, HTTPS, DNS, TCP, ICMP and gRPC.

### Thanos

- [compact](https://thanos.io/tip/components/compact.md/): "The `thanos compact` command applies the compaction procedure of the Prometheus 2.0 storage engine to block data stored in object storage." (downsampling)

## Tools and Resources

- [prometheus-community/ansible](https://github.com/prometheus-community/ansible): collection of Ansible playbooks e.g. to install exporters

## References

- [Prometheus functions](https://prometheus.io/docs/prometheus/latest/querying/functions/)