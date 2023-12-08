---
title: GitLab
tags: ""
type: software
category: git
url: "https://gitlab.com/"
docs: "https://docs.gitlab.com/"
source: ""
developer: ""
desc-short: GitLab is the most comprehensive AI-powered DevSecOps Platform.
visibility: public
img: "<img src=\"https://docs.gitlab.com/assets/images/gitlab-logo-header.svg\" style=\"width: 80px;\"/>"
---
# GitLab

`=this.img`
`= ("[Website](" + this.url + ")")` |  `= ("[Source](" + this.source + ")")` | `= ("[Documentation](" + this.docs + ")")`
`= ("> " + this.desc-short)`

See also [[git]] | [[rug/lwp/GitLab|Work notes LWP: GitLab]] | [[2023_GitLab/presentation|Presentation for LWP]]

# Issues, Boards, Project Management

See also [[Gitlab_Agile|GitLab: Agile]]

- Issues
    - [Tasks](https://docs.gitlab.com/ee/user/tasks.html) (type of [Work Items]())
    - [Description templates](https://docs.gitlab.com/ee/user/project/description_templates.html)
    - [By sending an email](https://docs.gitlab.com/ee/user/project/issues/create_issues.html#by-sending-an-email): requires [incoming email](https://docs.gitlab.com/ee/administration/incoming_email.html)
    - [From URL: pre-filled values](https://docs.gitlab.com/ee/user/project/issues/create_issues.html#using-a-url-with-prefilled-values)

> [!myidea] #idea/cit Could be used to import e-mails (TopDesk calls, customer problems, ...) into GitLab as issues

## Markdown/HTML

[HTML style guide](https://docs.gitlab.com/ee/development/fe_guide/style/html.html)

- open link in new tab (`target="_blank"`) is unsafe, use instead, see [GitLab Documentation](https://docs.gitlab.com/ee/development/fe_guide/style/html.html#blank-target)

  ```html
  <a href="url" target="_blank" rel="noopener noreferrer"></a>
  ```

# Web UI

- [Quick Actions](https://docs.gitlab.com/ee/user/project/quick_actions): text-based shortcuts for common actions
- [gitlab-svgs: GitLab icons](https://gitlab.com/gitlab-org/gitlab-svgs) ^8b2ea8
    - [Preview](https://gitlab-org.gitlab.io/gitlab-svgs/)
    - [Sprite icons](https://gitlab.com/gitlab-org/gitlab-svgs/-/tree/main/sprite_icons)
- [GitLab logos](https://about.gitlab.com/press/press-kit/)

## Projects

- [Project and group visibility](https://docs.gitlab.com/ee/user/public_access.html)
- [Badges](https://docs.gitlab.com/ee/user/project/badges)

# Authentication

## Access Tokens

There is a variety of different access tokens available in GitLab: groups, impersonation, projects, ... and each can be fine-grained, setting a role, permissions and an expiry date.

For example, to give read access to a project an access token with role `Reporter`  (`Guest` can be insufficient) and permissions `read_repository` can be used. Navigate to the project and select `Access Tokens` from the settings menu.

- [Personal](https://docs.gitlab.com/ee/user/profile/personal_access_tokens)
- [Project](https://docs.gitlab.com/ee/user/project/settings/project_access_tokens)
  > Use a project access token to authenticate:
  >
  > - With the [GitLab API](https://docs.gitlab.com/ee/api/index.html).
  > - With Git, when using HTTP Basic Authentication, use:
  >     - Any non-blank value as a username.
  >     - The project access token as the password.
  >
- [Group](https://docs.gitlab.com/ee/user/group/settings/group_access_tokens)
- [API: personal/project/group tokens](https://docs.gitlab.com/ee/api/rest/index.html#personalprojectgroup-access-tokens)

# Automation

## CI/CD

By default `.gitlab-ci.yml`

[GitLab CI/CD Documentation](https://docs.gitlab.com/ee/ci/)

- [Keyword reference](https://docs.gitlab.com/ee/ci/yaml/)
- [GitLab CI/CD variables](https://docs.gitlab.com/ee/ci/variables/) | [predefined variables](https://docs.gitlab.com/ee/ci/variables/predefined_variables.html)
- [GitLab CI/CD for external repositories](https://docs.gitlab.com/ee/ci/ci_cd_for_external_repos/index.html)
  apparently it is possible to connect repositories, e.g. from Github, and use GitLab CI/CD
- [Git submodules](https://docs.gitlab.com/ee/ci/git_submodules.html)
- [GitLab development with Vagrant](https://gitlab.com/gitlab-org/gitlab-development-kit/-/blob/main/doc/howto/vagrant.md)
- [Migrate from GitHub](https://docs.gitlab.com/ee/ci/migration/github_actions.html)

```yaml
variables:
  GIT_SUBMODULE_FORCE_HTTPS: "true"  # force (SSH) URLs to HTTPS
  GIT_SUBMODULE_STRATEGY: recursive  # init/update/pull SMs recursively
```

### Stages

- `pages`: special and activated for projects where [[#GitLab Pages]] feature is enabled. After `build` stage artifacts (default `public/`) are deployed to configured destination

### `script`

Custom commands to be executed during stage

-
- [before_script](https://docs.gitlab.com/ee/ci/yaml/?query=before_script): run before every command in `script` section. Per stage or globally defined.

### Docker Images

- [Access image from private Container Registry](https://docs.gitlab.com/ee/ci/docker/using_docker_images.html#access-an-image-from-a-private-container-registry)

Image can be specified per job

```yaml
build:trusty:
  image: trusty:base
```

Triggers and connecting pipelines

- <https://docs.gitlab.com/ee/ci/triggers/>
- <https://docs.gitlab.com/ee/api/pipeline_triggers.html>
- <https://docs.gitlab.com/ee/ci/pipelines/downstream_pipelines.html>: multi-project pipelines, parent-child pipelines

## Webhooks

There's a number of events to chose from as webhooks, for example `Wiki page events`, that can be used e.g. to trigger a pipeline (in a different project). The GitLab webinterface discourages the use of Webhooks, suggesting Integrations instead.

- `Wiki page events`: ⚠ only triggers when changes are done through the GitLab Wiki webinterface, not when pushing changes to the GitLab Wiki repository.

## Auto DevOps

<https://docs.gitlab.com/ee/topics/autodevops/index.md>

# Server

- [Install GitLab](https://docs.gitlab.com/ee/install/)
  Debian package didn't work for me, but their [GitLab installation script](https://about.gitlab.com/install/#debian) did,
  `curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash`
- [Configuring Omnibus GitLab](https://docs.gitlab.com/omnibus/settings/)
- [Security](https://docs.gitlab.com/ee/security/index.html)
- [Database](https://docs.gitlab.com/omnibus/settings/database.html): only PostgreSQL

## Console

Fixing requirement of both MFA *and* password some users experience

```ruby
# gitlab-rails console
user = User.find_by(email: 'a.b.lastname@student.rug.nl')
user.password_automatically_set = true
user.save
```

## LDAP

See also [[rug/lwp/GitLab#LDAP|Work notes LWP: GitLab > LDAP]]

<https://docs.gitlab.com/ee/administration/auth/ldap/index.html>

## Rake tasks

<https://docs.gitlab.com/ee/raketasks/>

- [LDAP](https://docs.gitlab.com/ee/administration/raketasks/ldap.html)

  ```bash
  sudo gitlab-rake gitlab:ldap:check # test bind_dn and pw, print 100 users as sample
  sudo gitlab-rake gitlab:ldap:check[5] # print only 5 users
  ```

- reset password: [[#^8cee12|Rake Task]], [[#^1b2997|Rails console]]
- [Server Hooks @GitLab Documentation](https://docs.gitlab.com/ee/administration/server_hooks.html)
- [Repository Storage Types > Translate Hashed Storage Paths](https://docs.gitlab.com/ee/administration/repository_storage_types.html#translate-hashed-storage-paths)
  1. with admin rights: go to **Admin Area** > *project* > **Gitaly relative path**
  2. ...

## Enterprise Edition (EE)

[Convert Community Edition to Enterprise Edition](https://docs.gitlab.com/ee/update/package/convert_to_ee.html)
[Trial License](https://about.gitlab.com/handbook/support/license-and-renewals/workflows/self-managed/trials.html)
[Activate](https://docs.gitlab.com/ee/user/admin_area/license_file.html)

## Rails Console

[Documentation](https://docs.gitlab.com/ee/administration/operations/rails_console.html)

- look up user info

  ```ruby
  u = User.find_by_username('someuser')
  pp u.attributes
  # send test email to user
  Notify.test_email(u.email, "Test email for #{u.name}", 'Test email').deliver_now

```
- 2FA, MFA
  ```ruby
  User.find_each(&:disable_two_factor!) # disable for all users (reset if enforced by admin settings)
  User.where(username: "username_goes_here").each(&:disable_two_factor!) # disable for certain user
  ```

- (Re-)Set password ^1b2997

  ```ruby
  new_password = 'examplepassword'
  user.password = new_password
  user.password_confirmation = new_password
  user.send_only_admin_changed_your_password_notification!
  user.save!
  # root: usually UID 1, else search for root
  ```

Or use a [Rails Runner](https://docs.gitlab.com/ee/administration/operations/rails_console.html#using-the-rails-runner) to execute commands non-interactively

```bash
sudo gitlab-rails runner "RAILS_COMMAND"
```

## Rake Tasks

Reset user password ^8cee12

```bash
sudo gitlab-rake "gitlab:password:reset[sidneyjones]"
```


## Elasticsearch (EE)

<https://docs.gitlab.com/ee/integration/advanced_search/elasticsearch.html>


## Service Desk

<https://docs.gitlab.com/ee/user/project/service_desk/index.html>


# Wiki

[GitLab Documentation: Wiki](https://docs.gitlab.com/ee/user/project/wiki/)

- [GitLab group wikis (Premium)](https://docs.gitlab.com/ee/user/project/wiki/group.html)
- [Automatically create TOC](https://docs.gitlab.com/ee/user/markdown.html#table-of-contents): `[[_TOC_]]`
    - does nest
    - currently not possible to hide/exclude something from the TOC
- [Link an external Wiki](https://docs.gitlab.com/ee/user/project/wiki/#link-an-external-wiki)

# GitLab Pages

Examples and References

- [Website](https://about.gitlab.com/stages-devops-lifecycle/pages/)
- [General](https://docs.gitlab.com/ee/user/project/pages/)
- [Getting Started](https://docs.gitlab.com/ee/user/project/pages/#getting-started)
- static site generators: Gatsby, Jekyll, Hugo, Middleman, Harp, Hexo, or Brunch
    - MkDocs: [[MkDocs#Integrations|my notes]]
- [Examples](https://gitlab.com/groups/pages)
    - [[Python#^e526ca|Sphinx]]: [example documentation website](http://www.sphinx-doc.org/) | [GitLab](https://gitlab.com/pages/sphinx)
    - [Obsidian](https://about.gitlab.com/blog/2022/03/15/publishing-obsidian-notes-with-gitlab-pages/)
- <https://gitlab.gnome.org/Infrastructure/gtk-web>
- Artifact size: if the artifact is too large to be deployed there are two settings. First the maximum artifact size can be set per instance, group and project in the admin settings. Second the maximum size for a page can be set in the admin settings under Preferences > Pages
