---
visibility: public
title: Windows
developer: "[[Microsoft]]"
aliases:
  - Microsoft
---
# Windows

> [!info]- Microsoft Software
> ![[Microsoft_SaaS_Services.webp]]

## Software

### Package managers

- Chocolatey
- Scoop

## Administration

[[LIL_LearningSCCM|LIL course SCCM]]
[[boot]]

### System Services

```ps
# create
New-Service -Name "SqlExporterSvc" `
  -BinaryPathName '"C:\Program Files\sql_exporter\sql_exporter.exe" --config.file="C:\Program Files\sql_exporter\sql_exporter.yml"' `
  -DisplayName "Prometheus SQL Exporter" `
  -StartupType Automatic

# delete
Get-WmiObject -Class Win32_Service -Filter "Name='ServiceName'" | ForEach-Object { $_.Delete() }
```

### Configuration Manager

[PXE boot](https://learn.microsoft.com/en-us/troubleshoot/mem/configmgr/os-deployment/understand-pxe-boot)


### Virtualisation

- [[hyper-v]]

## Literature

[European Commision: Microsoft A History of Anticompetitive Behavior and Consumer Harm](https://www.ecis.eu/documents/Finalversion_Consumerchoicepaper.pdf)
