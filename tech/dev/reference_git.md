---
title: Git Reference
visibility: public
---
See also [[2023_presentation_GitLab.html|presentation on GitLab]]

## General Best Practices

### Git Config and Environment
Make sure to set at least the commiter/author names and possibly your e-mail address such  that Git acctions can be clearly attributed. This is usually a problem when impersonating `root` is required to commit as your usual Git enviroment isn't set up then. Consider creating something like an environment that can easyly be sourced and that sets
```bash
GIT_COMMITTER_NAME, GIT_COMMITTER_EMAIL, GIT_AUTHOR_NAME, GIT_AUTHOR_EMAIL
```
For your own `user` you can use
```bash
git config --global -e
```

### Naming

Generally it's a good idea to name a branch, commit, ... with increasing degree of specificy

1. type of problem: `fix`, `refactor`, `add/improvement/feature`, `remove/rm`, ...
2. affected code category: `(Puppet) module`, `config`, ...
3. specific part of code changed: (Puppet) module name, program/service/...

### Branches

- chose a descriptive name and avoid repetition as this might lead to confusion
- if an issue already exists, consider using the issue number as a suffix, for example `123_fix_login_banana`
- if no issue exists consider using your abbreviated name as a suffix, for example `dav_refactor_module_login`

### Commits

- make small, specific commits
- descriptive message not exceeding 50 characters
- if more details are required add an empty line and then the details, many editors highlight characters past the recommended 50
  ```
  fix login screen tasting like old banana

  - we had a user complain, see call 666
  - now raspberry
  ```
- If there is an issue/MR/PR for this problem that isn't referenced in the branch name already consider linking it in the commit message. In GitLab this even shows up in the issue/MR/PR activity (comments etc. section).

> [!tip] Suggestions for commit message short-codes
> ```
> ^   : update
> +   : add new
> ~   : refactor
> *   : cosmetics
> !   : breaking/important change
> wip : work in progress, may be untested, might not compile/run
> ```


#### History

If you created messy commits consider an (interactive) rebase to clean up the commit messages, squash commits, etc. This should be done before pushing or you have to revert/overwrite the remote repo.

---
**References**
- [GitLab](https://about.gitlab.com/topics/version-control/version-control-best-practices/): Feature Branching, GitFlow
