---
title: Git
tags: dev/git dev/GitLab dev/CICD dev/Github
visibility: public
---

## Config
```bash
git config --global -e # Edit global git config file
```
Local ignore/exclude file: config `git config --global core.excludesFile ~/.git/info/exclude`
Environment: `GIT_COMMITTER_NAME`, `GIT_COMMITTER_EMAIL`, `GIT_AUTHOR_NAME`, `GIT_AUTHOR_EMAIL`


### Hooks
[githooks](https://git-scm.com/docs/githooks)
- `prepare-commit-msg`: hook into git's default commit messages (merge etc.).
  Example: in `.git/hooks/prepare-commit-msg` and make sure that it is executable
  ```
  #!/bin/sh

  if [ "$2" = "merge" ]; then
          sed -i "1s/^/ʕ•ᴥ•ʔ /" "$1"
  fi
  ```


### Authentication

[Git credential helpers](https://git-scm.com/docs/gitcredentials): Providing usernames and passwords to Git

- [`credential-cache`](https://git-scm.com/docs/git-credential-cache): temporarily store passwords in memory

Can be used to authenticate using environment variables[^1]
```bash
git config credential.helper "/bin/bash credential-helper.sh"
```
with file `credential-helper.sh`
```bash
#!/bin/bash
echo username=$GIT_USER
echo password=$GIT_PW
```
[^1]: https://alanedwardes.com/blog/posts/git-username-password-environment-variables/

Alternatively username and password can be provided through a HTTPS URL, e.g.
```bash
git clone https://$GIT_USER:$GIT_TOKEN@git-prodider.com/account-name/repo-name
git set-url origin https://$GIT_USER:$GIT_TOKEN@git-prodider.com/account-name/repo-name
```
but the latter would leave the token in a clear-text file.

Another option is authentication through an API if the Git provider offers this option, e.g.
```bash
gh auth login
```
(not sure how this would be scripted though). GitLab offers [access token authentication through HTTPS requests](https://docs.gitlab.com/ee/api/rest/index.html#personalprojectgroup-access-tokens).


## Commands
- _Show commits where a particular file was changed:_ `git log --follow -- <filename>`
- *Show files changed in last 4 commits:* `git log -4 --name-only`
- _Undo last 3 unpushed commits to branch:_ `git reset HEAD~3`
- *Undo last unpushed commit, keep changes staged:* `git reset --soft HEAD^`
- *Show changes in file over last 3 commits:* `git diff HEAD~3 path/to/file`
- _Remove untracked files (and directories `-d`, dry run `-n`):_ `git clean -f [-d] [-n]`
- _Download specific folder from github.com_ `svn export https://github.com/user/repo/trunk/path/to/folder`, make sure to replace `tree/master` by `trunk` for subversion.


## Submodules
[Documentation: Reference](https://git-scm.com/docs/git-submodule) | [Documentation: Book](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
Nest git projects, for example adding some required library to your project.
- will by default not be pulled, instead need to be initialised (fetched) and updated (pulled)
- update submodules on pull: https://stackoverflow.com/questions/4611512/is-there-a-way-to-make-git-pull-automatically-update-submodules
  As of [Git 2.14](https://github.com/git/git/blob/master/Documentation/RelNotes/2.14.0.txt#L117), you can use `git pull --recurse-submodules` (and alias it to whatever you like).
  As of [Git 2.15](https://github.com/git/git/blob/master/Documentation/RelNotes/2.15.0.txt#L358), you could set [`submodule.recurse`](https://git-scm.com/docs/git-config#Documentation/git-config.txt-submodulerecurse) to true to enable the desired behaviour.
  You can do this globally by running:
  ```
  git config --global submodule.recurse true
  ```

Update/pull submodule(s)
```bash
git submodule update [--init] [--recursive] --remote
# or
git pull --recurse-submodules
```

### Toubleshooting
- Submodule HEAD is detatched/keepts becoming detatched: see [Stack Overflow question](https://stackoverflow.com/a/36375256/16096134)

References
- [Git submodule fetch and update @stackoverflow](https://stackoverflow.com/questions/50254184/git-submodule-and-fetch)


## References
- [Environment variables](https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables)
- [Visualize Git](https://github.com/git-school/visualizing-git): Visualize how common Git operations affect the commit graph
- educational material
  - [Software Carpentry: Version Control with Git](https://swcarpentry.github.io/git-novice/index.html)