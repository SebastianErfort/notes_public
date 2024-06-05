---
title: Ansible
type: software
category:
  - Automation
tags:
  - dev/Ansible
  - dev/CM
  - dev/ConfigurationManagement
  - dev/Automation
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
---
![|500](https://www.ansible.com/hubfs/2-diagram.jpg)
`= ("> " + this.desc-short)`

- idempotent (like Puppet)
- [[YAML]]

## Roles and Collections

- [Ansible-Galaxy](https://galaxy.ansible.com/home)
    - [Community > General](https://galaxy.ansible.com/community/general)


## Tools

- [Ansible code bot][ansible-code-bot] [^ansible-code-bot-redhat]
  > The Ansible code bot integrates natively into git repositories you select. It then scans existing Ansible content (roles, playbooks, etc), and automatically submits pull requests when it finds automation content that could be qualitatively improved with best practices. These pull requests contain code recommendation improvements for you to review, test and apply and improve your existing Ansible content.


## References

[ansible-code-bot]: <https://github.com/apps/ansible-code-bot>
[^ansible-code-bot-redhat]: <https://access.redhat.com/documentation/en-us/red_hat_ansible_lightspeed_with_ibm_watsonx_code_assistant/2.x_latest/html/red_hat_ansible_lightspeed_with_ibm_watsonx_code_assistant_user_guide/using-code-bot-for-suggestions_lightspeed-user-guide>