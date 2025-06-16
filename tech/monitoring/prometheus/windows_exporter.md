---
url: https://github.com/prometheus-community/windows_exporter
---
## Config

I had issues with the `config.yaml` not being parsed. Most options can be passed flags, e.g. in the *path to executable* for the Windows service.

```powershell
.\windows_exporter.exe --collectors.enabled "[defaults],mssql"
```

Collectors

- [mssql](https://github.com/prometheus-community/windows_exporter/blob/master/docs/collector.mssql.md)

## Tools

- [Grafana dashboard](https://grafana.com/grafana/dashboards/20763-windows-exporter-dashboard-2024/)