---
title: Ansible
type: software
category:
  - Automation
  - "[[IaC]]"
tags:
  - dev/ansible
  - dev/CM
  - dev/configurationmanagement
  - dev/automation
code: open source
company: |
  [[RedHat]]
url: https://www.ansible.com/
docs: https://docs.ansible.com/ansible/latest/index.html
desc-short: |
  Ansible is an IT automation tool. It can configure systems, deploy software, and orchestrate more advanced IT tasks such as continuous deployments or zero downtime rolling updates.
visibility: public
up:
  - "[[_configuration_management]]"
  - "[[IaC]]"
---
# Ansible

![Ansible logo|20](https://github.com/ansible/logos/blob/main/community-marks/Ansible-Community-Mark-Mango.png?raw=true)  `= ("[Website](" + this.url + ")")` | `= ("[Documentation](" + this.docs + ")")`

`= ("> " + this.desc-short)`

- idempotent (like Puppet)
- [[YAML]]-based syntax, some config/ini-like collections (inventories) with [[Jinja2]] templating

## Roles and Collections

- [Ansible-Galaxy](https://galaxy.ansible.com/home)
    - [Community > General](https://galaxy.ansible.com/community/general)

## Inventory

[Inventory](https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html)

Automate collecting inventory from VMWare with plugin

```yaml
plugin: vmware_vm_inventory
```

## Modules

- URL download: [ansible.builtin.get_url](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/get_url_module.html)
- install packages (generic, not specific package manager): [ansible.builtin.package](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/package_module.html)

## Tools

- [Ansible code bot][ansible-code-bot] [^ansible-code-bot-redhat]
  > The Ansible code bot integrates natively into git repositories you select. It then scans existing Ansible content (roles, playbooks, etc), and automatically submits pull requests when it finds automation content that could be qualitatively improved with best practices. These pull requests contain code recommendation improvements for you to review, test and apply and improve your existing Ansible content.
- [Ansible Lightspeed](https://www.redhat.com/en/technologies/management/ansible/ansible-lightspeed): AI-based natural language processing to produce recommendations. Uses IBM watsonx Code Assisstant.

## References

- Jeff Geerling: [Ansible 101 video series][geerling-ansible101], [Book: Ansible for DevOps][geerling-ansible-devops]

[ansible-code-bot]: <https://github.com/apps/ansible-code-bot>
[^ansible-code-bot-redhat]: <https://access.redhat.com/documentation/en-us/red_hat_ansible_lightspeed_with_ibm_watsonx_code_assistant/2.x_latest/html/red_hat_ansible_lightspeed_with_ibm_watsonx_code_assistant_user_guide/using-code-bot-for-suggestions_lightspeed-user-guide>
[geerling-ansible101]: <https://www.jeffgeerling.com/blog/2020/ansible-101-jeff-geerling-youtube-streaming-series>
[geerling-ansible-devops]: <https://www.ansiblefordevops.com/>