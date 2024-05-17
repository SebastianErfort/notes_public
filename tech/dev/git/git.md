---
title: Git
tags:
  - dev/git
  - dev/GitLab
  - dev/CICD
  - dev/Github
visibility: public
url: "https://git-scm.com/docs"
docs: "https://git-scm.com/docs"
---
# Git

| Resource      | Reference                                                   |
| ------------- | ----------------------------------------------------------- |
| Documentation | `= ( "[Documentation](" + this.docs + ")")`                 |
| Commands      | [Cheatsheet](file://.config/cheat/cheatsheets/personal/git) |
| My stuff      | [my Git resources]                                          |

## Clone and Checkout

### Sparse Checkout

See also [Git documentation Sparse Checkout](https://git-scm.com/docs/sparse-checkout),  [Git command sparse-checkout](https://git-scm.com/docs/git-sparse-checkout) and [my Git resources] (helper scripts for Git submodules, sparse checkout and more.)

Sparse checkout lets you check out only part of a repository. This can be helpful for example if you have a repository with both code and documentation or a monolithic repository, and only work on a part of it.

In my experience so far this standard commands `git sparse-checkout ...` work fine if the repository is already checked out. Extraneous files are removed and you're left with the files and directories you specified to be checked out.

> [!warning] 🚧 WIP
However, I wanted to specify what to sparsely check out, before pulling anything. For this, Git's infrastructure needs to be set up, usually the `.git` directory with Git's configuration etc. But as far as I understand these only get properly created when the first checkout (pull) is performed. Before that, essential files are missing. Pre-creating those files containing the configuration for the sparse checkout only worked manually in my experiments.
>
> ```bash
> git init 2>/dev/null
> git remote add origin "$url"
> git config core.sparseCheckout true
> echo docs > .git/info/sparse-checkout
>
> # Attempt with proper Git commands:
> # the following sets config.worktree instead and adds additional rules to
> # info/sparse-checkout
> # BUG: fails to checkout sparsely
> # git sparse-checkout init --cone
> # git sparse-checkout set "doc"
>
> git fetch -q
> git checkout "$branch"
> ```
>
> To add another layer, I was using this feature within a [[#Submodules|Git submodule]]. The steps described above create a proper repository that isn't integrated with the outer repository. Submodules have a reference to the parent Git directory, the `.git` is a file with a reference. To manually turn the sparsely checked out repository into a submodule again
>
> ```bash
> # turn Git repo into submodule
> mv ".git" "$parent_gitdir"
> # this is how Git specifies path to .git dir in submodules
> echo "gitdir: ../../${sm_gitdir}" > ".git"
> ```
>
> where the parent repo's Git directory is for example `../../.git/modules/<submodule name/path>`.
>
> - [ ] update with this info: https://stackoverflow.com/a/63786181/16096134

Examples and references

- [my Git resources]
- [[rsrc/README|Work RUG: LWP-Docs]]
- <https://github.blog/2020-01-17-bring-your-monorepo-down-to-size-with-sparse-checkout/>
- <https://stackoverflow.com/questions/47541033/sparse-checkouts-how-does-it-works>


## Repositories

```bash
git config --global -e # Edit global git config file
```

Local ignore/exclude file: config `git config --global core.excludesFile ~/.git/info/exclude`
Environment

```text
GIT_COMMITTER_NAME
GIT_COMMITTER_EMAIL
GIT_AUTHOR_NAME
GIT_AUTHOR_EMAIL
```

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

[Git hooks]

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


#### Tools and Frameworks

- [[pre-commit]]
- [lefthook](https://github.com/evilmartians/lefthook)


### Authentication


#### Git Credential Helpers

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


#### Access Tokens and URL Credentials

Alternatively username and password or an access token can be provided through a HTTPS URL, e.g.

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


### Submodules

[Git Documentation](https://git-scm.com/docs/git-submodule) | [Documentation: Book](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

Nest Git repositories, for example adding some required library to your project.

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

Git submodules are generally checked out in a detached-HEAD state, at a specific commit. For most submodules this is the desired mode, often they are libraries and for the stability of the parent repository it is desirable to not automatically check out the latest changes in the dependencies (submodules). There might be cases though, when you want to track the latest changes on a branch.

For example, I've been using Git submodules to split my notes into pluggable blobs. There is no code to break here, I always want the latest changes. It should be possible to check out a submodule by branch instead of by commit by now.[^sm-track-branch] Didn't work for me in a first attempt (existing submodule)

References

- [Git submodule fetch and update @stackoverflow](https://stackoverflow.com/questions/50254184/git-submodule-and-fetch)
- [Git submodule track branch @stackoverflow][stackoverflow: sm track branch]


#### Commands

```bash
git subodule foreach <command> # runs command in each submodule directory
# offers variables $name, $path and $toplevel (parent repo absolute path), see help page
```

#### Toubleshooting

- Submodule HEAD is detatched/keepts becoming detatched: see [Stack Overflow question](https://stackoverflow.com/a/36375256/16096134)
- fixing unrelated histories, e.g. when error `fatal: refusing to merge unrelated histories` occurs: <https://stackoverflow.com/a/39783462>



### Branches

- [GitHub: Splitting a subfolder out into a new repository](https://docs.github.com/en/get-started/using-git/splitting-a-subfolder-out-into-a-new-repository)
- New branch from dir.(s)[^3]

  ```bash
  git branch subdir_branch HEAD
  git filter-branch --subdirectory-filter dir/to/filter -- subdir_branch
  git push git://.../new_repo.git subdir_branch:master
  ```

[^3]: <https://stackoverflow.com/questions/9971332/git-create-a-new-branch-with-only-a-specified-directory-and-its-history-then-pus>


## Editing

```bash
## show changes since last commit
git diff HEAD
## show unstaged changes
git diff
## compare branches
git diff <first branch>...<second branch>
```



## Committing

### Guidelines and Rules

Suggested commit message structure

```text
<type>[(<scope>)][!]: <description>

[optional body]

[optional footer(s)]
```

where

```text
<type>: fix, feat, build, chore, ci, docs, style, refactor, perf, test
and optionally
(<scope>): (api), ...
!: breaking change
```

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/):
  > A specification for adding human and machine readable meaning to commit messages
- [Angular contributing rules](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#-commit-message-guidelines)


## Tools

- [lazygit]
- [[sublimemerge|Sublime Merge]]

Helpful

- [[bat]]
- [gource](https://gource.io/): animated timeline of repo with dirs and files as branches and leaves, option to add highlights

## Providers and Servers

- [[GitHub]]
- [[dev/git/GitLab|GitLab]]: self-hosting possible, extensive server with webinterface, work-management tools, CI/CD capabilities, ...
- Gitea
- [Forgejo](https://forgejo.org): self-hosted lightweight software forge, Gitea-compatible, FOSS promise
- [Codeberg](https://codeberg.org/)
    > Codeberg is a collaboration platform providing Git hosting and services for free and open source software, content and projects.

## References

- [Environment variables](https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables)
- [Visualize Git](https://github.com/git-school/visualizing-git): Visualize how common Git operations affect the commit graph
- educational material
    - [Software Carpentry: Version Control with Git](https://swcarpentry.github.io/git-novice/index.html)
- [whatthecommit.com](https://whatthecommit.com/) random terrible commit message generator
- [Article: How I teach Git, T. Broyer @dev.to](https://dev.to/tbroyer/how-i-teach-git-3nj3) #check/tech/git
- [Article Remove Sensitive Data from Repo](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)

[my Git resources]: <https://gitlab.com/treetanium1/resources/git>
[stackoverflow: sm track branch]: <https://stackoverflow.com/questions/1777854/how-can-i-specify-a-branch-tag-when-adding-a-git-submodule/18799234#18799234>
[^sm-track-branch]: [Git submodule track branch @stackoverflow][stackoverflow: sm track branch]
[Git hooks]: <https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks>
[lazygit]: <https://github.com/jesseduffield/lazygit>