---
title: Git
tags:
  - dev/git
  - dev/GitLab
  - dev/CICD
  - dev/Github
visibility: public
---
## Editing

```bash
# show changes since last commit
git diff HEAD
# show unstaged changes
git diff
# compare branches
git diff <first branch>...<second branch>
```

## Config

```bash
git config --global -e # Edit global git config file
```

Local ignore/exclude file: config `git config --global core.excludesFile ~/.git/info/exclude`
Environment: `GIT_COMMITTER_NAME`, `GIT_COMMITTER_EMAIL`, `GIT_AUTHOR_NAME`, `GIT_AUTHOR_EMAIL`

[Sparse Checkout](https://git-scm.com/docs/git-sparse-checkout): clone/check out only part of a repository[^2]

```bash
git config core.sparseCheckout true
# or edit config and add stanza
echo -e "[core]\n\tsparseCheckout = true" > .git/config
# specify directories to be checked out
echo <dirname> >> .git/info/sparse-checkout
```

[^2]: <https://stackoverflow.com/a/13738951>

### Hooks

[githooks](https://git-scm.com/docs/githooks)

- [customising Git hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)

Available hooks

- `prepare-commit-msg`: hook into git's default commit messages (merge etc.).
  Example: in `.git/hooks/prepare-commit-msg` and make sure that it is executable

    ```bash
    #!/bin/sh

    if [ "$2" = "merge" ]; then
            sed -i "1s/^/ʕ•ᴥ•ʔ /" "$1"
    fi
    ```

- `pre-commit`: helpful for example to run code formatters, linters, etc.  before every commit.


### pre-commit Framework

The [pre-commit framework](https://pre-commit.com) facilitates using and maintaining hooks. They can be downloaded e.g. from GitHub and re-used across projects.

Examples

- [pre-commit/pre-commit-hooks @GH](https://github.com/pre-commit/pre-commit-hooks)
- [[black#^13286c|Black code formatter: pre-commit hooks]]
- [CERN pre-commit hooks](https://gitlab.cern.ch/lhcb-core/pre-commit-hooks/): include in pipeline via HTTPS, run hooks, generate patch if code is changed that can be downloaded and applied locally


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

[^1]: <https://alanedwardes.com/blog/posts/git-username-password-environment-variables/>

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

TODO:: clean this mess up

- _Show commits where a particular file was changed:_ `git log --follow -- <filename>`
- _Show files changed in last 4 commits:_ `git log -4 --name-only`
- _Undo last 3 unpushed commits to branch:_ `git reset HEAD~3`
- _Undo last unpushed commit, keep changes staged:_ `git reset --soft HEAD^`
- _Show changes in file over last 3 commits:_ `git diff HEAD~3 path/to/file`
- _Remove untracked files (and directories `-d`, dry run `-n`):_ `git clean -f [-d] [-n]`
- _Download specific folder from github.com_ `svn export https://github.com/user/repo/trunk/path/to/folder`, make sure to replace `tree/master` by `trunk` for subversion.

## Repositories and Branches

- [GitHub: Splitting a subfolder out into a new repository](https://docs.github.com/en/get-started/using-git/splitting-a-subfolder-out-into-a-new-repository)
- New branch from dir.(s)[^3]

  ```bash
  git branch subdir_branch HEAD
  git filter-branch --subdirectory-filter dir/to/filter -- subdir_branch
  git push git://.../new_repo.git subdir_branch:master
  ```

[^3]: <https://stackoverflow.com/questions/9971332/git-create-a-new-branch-with-only-a-specified-directory-and-its-history-then-pus>

## Clone and Checkout

### Sparse Checkout

[Git documentation](https://git-scm.com/docs/sparse-checkout) |  [Git command sparse-checkout](https://git-scm.com/docs/git-sparse-checkout)

See also

- <https://github.blog/2020-01-17-bring-your-monorepo-down-to-size-with-sparse-checkout/>
- <https://stackoverflow.com/questions/47541033/sparse-checkouts-how-does-it-works>

## Submodules

[Git Documentation](https://git-scm.com/docs/git-submodule) | [Documentation: Book](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

Nest git projects, for example adding some required library to your project.

- will by default not be pulled, instead need to be initialised (fetched) and updated (pulled)
- update submodules on pull: <https://stackoverflow.com/questions/4611512/is-there-a-way-to-make-git-pull-automatically-update-submodules>
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
- fixing unrelated histories, e.g. when error `fatal: refusing to merge unrelated histories` occurs: <https://stackoverflow.com/a/39783462>
  

References

- [Git submodule fetch and update @stackoverflow](https://stackoverflow.com/questions/50254184/git-submodule-and-fetch)

## References

- [Environment variables](https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables)
- [Visualize Git](https://github.com/git-school/visualizing-git): Visualize how common Git operations affect the commit graph
- educational material
    - [Software Carpentry: Version Control with Git](https://swcarpentry.github.io/git-novice/index.html)
- [whatthecommit.com](https://whatthecommit.com/) random terrible commit message generator
- [Article: How I teach Git, T. Broyer @dev.to](https://dev.to/tbroyer/how-i-teach-git-3nj3) #cio/tech/git
