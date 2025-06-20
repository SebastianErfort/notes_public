---
title: bash
tags:
  - dev/programming
  - dev/bash
  - dev/shell
  - dev/terminal
  - dev/script
  - dev/coding
visibility: public
type: software
category:
  - shell
up:
  - "[[commandline]]"
---
# Bash

[Code snippets](file://src/bash "local files") |  [Jupyter-lab notebook](file://notes/life/tech/bash.ipynb)

## Options & Config

[gnu.org: The Set Builtin](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html)

## Command Line

### Keyboard Shortcuts & Readline

- see [[linux#Keyboard|Linux: command line keyboard input]] and [readline man page](https://www.man7.org/linux/man-pages/man3/readline.3.html)
- customise in config::  `~/.inputrc`

    ```config
    # Pg-up and Pg-down to search history
    "\e[5~": history-search-backward
    "\e[6~": history-search-forward
    # bracketed paste: encapsulate pasted content in special control characters to avoid command execution upon newline characters - this greatly enhances pasting commands into your commandline, especially if you're clumsy or don't trust your various copy buffers. 
    set enable-bracketed-paste On
    ```

### Completion

See files in [`/usr/share/bash-completion/completions/`](file:///usr/share/bash-completion/completions) and `/etc/bash_completion.d/`

- [hostname completion](https://blog.sanctum.geek.nz/bash-hostname-completion/)

### History

List of executed commands, very helpful to trace back steps or run commands again.

```bash
!!     # repeat last command
!123   # repeat command 123 from history
!cmd   # repeat last command starting with "cmd"
!cmd:p # print command but don't execute
```

How many are stored depends on the settings. Some people like an eternal history

> [!tip]- Bash: configure eternal history, e.g. in `$HOME/.bashrc`
>
> ```bash
> # Undocumented feature which sets the size to "unlimited".
> # http://stackoverflow.com/questions/9457233/unlimited-bash-history
> export HISTFILESIZE=
> export HISTSIZE=
> export HISTTIMEFORMAT="[%F %T] "
> # Change the file location because certain bash sessions truncate .bash_history file upon close.
> # http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
> export HISTFILE=~/.bash_eternal_history
> ```

## General

### Loops

- iterate over list or array

    ```bash
    for f in $(ls *.jpg*); do
      # rename files to date_time.ext
      exiftool '-filename<CreateDate' -d %Y%m%d_%H%M%S%%-c.%%e
    done
    for e in ${arr[@]}; do
      echo $e
    done
    ```

- Infinite loop (till broken)

    ```bash
    for (( ; ; )); do
      if condition
        break
      fi
      if other_condition
        continue
      fi
    done
    ```

    or

    ```bash
    while true; do
      ...
    done
    ```

- Three-expression loop

    ```bash
    for (( c=1 ; c<=5 ; c++ )); do
      ...
    done
    ```

### Test Expressions

```bash
[[ $a == $b ]] # string equality
[[ $a =~ $b ]] # string regex match
[[ -z "$string" ]] # test string is zero
[[ -n "$string" ]] # test string is non-zero
[[ -f "$file" ]] # test for file
[[ -s "$file" ]] # test for non-empty file
```

### Arithmetic and Logic

```bash
n=0
(( n++ ))
echo $n
## 1
(( n==1 )) && echo 'y' || echo 'n'
## y
```

### Variables

### Declaration

```bash
local -a # local array
global -A # global associative array
# declare and typeset create local var.s unless -g is specified
declare -r # read-only
declare -x # mark for export
declare -g # global variable in function
typeset -i i # integer, faster arithmetic and operations such as let y=x**2
```

#### Booleans: true and false

```bash
for error in true false; do
    ! $error && echo not nope || echo not yep
done
```

#### Strings

- Length of a string `${#s}`
- Substring accessing

    ```bash
    s='abcABC123ABCabc'
    echo ${s:3} ${s:6:3} ${s:(-3)} ${s: -6} # negative indices (position from end of string) need parentheses or space to be escaped
    # extract a maximum of $length positional parameters, starting at $position
    function f() {
        start=2
        number=4
        echo ${*:$start}
        echo ${@:$start:$number}
    }
    f {1..10}
    # 2 3 4 5 6 7 8 9 10
    # 2 3 4 5
    ```

- Deleting substrings

    ```bash
    s='abcABC123xyzABC456'
    echo ${s#a*C} # delete shortest match from beginning
    echo ${s##a*C} # delete longest match from beginning
    echo ${s%A*[0-9]} # delete shortest match from end
    echo ${s%%A*[0-9]} # delete longest match from end
    ```

- Substring substitution

    ```bash
    stringZ=abcABC123ABCabc
    echo $stringZ
    echo ${stringZ/abc} # delete from start
    echo ${stringZ/%abc} # delete from end
    echo ${stringZ/#abc/XYZ} # replace from start
    echo ${stringZ/%abc/XYZ} # replace from end
    echo ${stringZ//abc/XYZ} # replace all occurances
    echo ${stringZ//abc} # delete all occurances
    ```

- String concatenation

    ```bash
    a='bla'
    b='blubb'
    c=${a}${b}
    echo $c
    b+=$a
    echo $b
    ```

- To lower or upper case

    ```bash
    s='bla blubb'
    echo ${s^} # first upper case
    echo ${s^^} # all upper case
    echo ${s^^[l]} # only certain characters
    s='BLA BLUBB'
    echo ${s,} # first lower case
    echo ${s,,} # all lower case
    ```

- Sanitise a string

    ```bash
    s='abc123XYZ@troll_ol-!"§$%&/()=?'
    echo ${s//[^a-zA-Z0-9_@\\\-.]} # delete all characters not matching
    ```

#### Variable Expansion

or shell-parameter expansion, manipulation and interpolation #dev/bash, see [bash documentation on gnu.org](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)

```bash
fname=john
john=thomas
echo ${!fname} # returns thomas
# use default value if parameter is unset or null
myvar=${1:-Default}
# assign default to parameter if unset or null
[[ -f "${myfile:=/tmp/myfile}" ]] || touch "$myfile"
```

See also <https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Brace-Expansion>

- [Bash Error Handling @RedHat](https://www.redhat.com/sysadmin/bash-error-handling)
- [Tilde Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Tilde-Expansion)
- [Shell Parameter Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Parameter-Expansion)
- [Command Substitution](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Command-Substitution)
- [Arithmetic Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Arithmetic-Expansion)
- [Process Substitution](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Process-Substitution)
- [Word Splitting](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Word-Splitting)
- [Filename Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Filename-Expansion)
- [Quote Removal](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Quote-Removal)

#### Arrays

Can be declared or instantiated like

```bash
## explicit declaration (can also be done implicitely, on-the-fly)
declare -a arr1 # indexed array
declare -A arr2 # associative array
arr3=("derp" "schlerp" 123)
## access elements
echo ${arr3[0]} # first, starting at 0
echo ${arr3[-2]} # 2nd from back (since bash 4.2 - 4.3)
## access entire array
echo ${arr[@]}
## or
echo ${arr[*]}
## access slice/range
echo ${arr[@]:2} # from element 2
echo ${arr[@]::2} # up to, excluding element 2
## add element
arr1+=("new" "elements")
## number of elements
${#arr[@]}
```

> The only difference between `@` and `*` is when the form `${my_array[x]}` is surrounded with double-quotes. In this case, `*` expands to a single word where array elements are separated with space. `@` expands each array element to a separate word. This is especially important when using the form to iterate through array elements.
> <https://linuxize.com/post/bash-arrays/>

#### Special Variables

[gnu.org: Bash Variables](https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html)

- special variables

    ```bash
    $0   # shell or script name
    $@   # arguments
    $*   # arguments
    $#   # number of arguments
    $$   # current shell pid
    $!   # last pid
    $?   # return value of last process
    ${-} # current shell options
    ${_} # argument to previous command
    ```

- environment variables

    ```bash
    $TERM # terminal type
    ```

### Regular Expressions

Tags: #dev/regex

Expression   | Description
------------|-----------
.   | Any character, except newline
\[a-c\] | One character of the selected range, in this case a,b,c. Capital letters for capital letters, numbers for numbers.
\[^a-y\] | One character outside of the selected range, in this case for example 'z' would qualify
\* or * | Any number of matches (0 or more). Use * when using regular expressions where extended expressions are not enabled (see the first example above)
\+ or + | 1 or more matches. Idem comment as *
\(\) | Capture group. The first time this is used, the group number is 1, etc.
\^ | Start of string
$ | End of string
a\|d | One character out of the two (an alternative to using []), ‘a’ or ‘d’
\ | Escapes special characters, or indicates we want to use a regular expression where extended expressions are not enabled (see the first example above)
\b | Backspace character
\n | Newline character
\r | Carriage return character
\t | Tab character
\d or [:digit:] | One digit
\D | One non-digit
\s or [:space:] | One white space
\S | One non-white space

### Functions

```bash
## define a function
function myfunction () {
    ${FUNCNAME[0]} # Last function on the function stack, inside a function its name
    ...
}
```

- bash function with array in-/output

### Arguments

- special variables to access arguments

  ```bash
  $@   # all arguments, "$@" expands to separate, quoted entities
  $*   # all arguments, "$*" expands to single, space-sep. entity
  $#   # number of arguments
  ```

  For differences between  `$@` and `$*` see [[arguments|Bash: Arguments]]
- update arguments

  ```bash
  # overwrite original positional parameters
  set -- "${newparams[@]}"
  # drop current first argument, can be used to iteratively reduce number of arguments
  shift
  ```

- read arguments from STDIN/STDERR

  ```bash
  function myfunc () {
    declare args=${*:-$(</dev/stderr)} # use command arguments OR stderr
    # ...
  }
  ```

- refer to previous command's arguments

  ```bash
  echo 1 2 3
  echo !:2 # previous 2nd argument
  echo !:* # previous all arguments
  echo !:^ # previous first argument
  echo !:$ # previous last argument
  ```

## Commands

- List (builtin) commands

  ```bash
  man shopt
  compgen -b              # list builtin bash commands from possible auto-completions
  compgen -c              # list commands from possible auto-completions
  enable                  # List bash builtins and whether they're enabled
  (IFS=': '; ls -1 $PATH) # list available commands from PATH environment variable
  ```

- command grouping

  ```bash
  ( list ) # create subshell with subshell environment
  { list; } # executed in current shell context. semicolons required.
  ```

## Input & Output

### STDIN, STDERR and exit codes

- re-direct stderr to command and re-direct that command's stdout back to original stderr

  ```
  mycmd 2> >(myfunc >&2)
  # redirect all output
  exec 2> >(myfunc) # e.g. tee to file or log
  # revert redirect
  exec 2> $(tty)
  ```

- output to STDERR

  ```bash
  echo error >&2
  ```

- check whether there is stdin/stderr [Stackexchange](https://unix.stackexchange.com/a/388462/247791): `[[ ! -t 0 ]]`
- Bash 4: just `&` is equivalent to `2>&1`

  ```bash
  cmd &>> outfile # redirect stdout and stderr to file
  mycmd |& othercmd # pipe both to command
  ```

Collect exit codes of commands using trap, then unset it

```bash
trap 'exs+=($?)' DEBUG; cmd1; cmd2; cmd3; trap - DEBUG
```

### Stream manipulation

- *Here Documents*: inline files with optional variable substitution [TLDP](https://tldp.org/LDP/abs/html/here-docs.html) #dev/shell/heredoc

  ```bash
  # variable expansion
  sed 's/\/.*\///' << EOF
    Found your home directory, $HOME!
  EOF
  # literal, no variable expansion
  sed 's/\/.*\///' << 'EOF'
    I just checked $HOME.
  EOF
  # trim leading whitespace
  sed 's/\/.*\///' <<- EOF
    And this will remove leading whitespace, $HOME.
  EOF
  ```

- cut

  ```bash
  cut -d " " -f 2,3 # Cut fields from file/standard input if omitted. Delimiter " ", fields 2+3
  ```

### Permissions

Grant execute permissions if on directories, but not files [@stackoverflow](https://stackoverflow.com/questions/17091300/linux-set-permission-only-to-directories)

```bash
chmod -R X /path/to/file
```

### Formatting

- overwrite previous line of output

```bash
printf "\r $newline"
```

- string formatting with `printf`

  ```bash
  printf '%s %04d %10.2f' 'string' 101 '3.14'
  ```

Progress

- [Pipe Viewer](https://www.ivarch.com/programs/pv.shtml): terminal-based tool for monitoring the progress of data through a pipeline

## Scripts

### Arguments

Parsers

- `getopt`: external command, not portable (POSIX-compliant)
- `getopts`: shell builtin, POSIX-compliant, **no long options**
    - examples: [rsrc/bash/getopts.sh](https://gitlab.com/treetanium1/resources/bash/-/raw/main/getopts.sh?ref_type=heads)
- [getoptions](https://github.com/ko1nksm/getoptions): shell script, versatile and portable, less overhead
    > An elegant option/argument parser for shell scripts (full support for bash and all POSIX shells)

### Control

#### Traps

Trigger action upon pressing Ctrl+C,D, ..., on error or other.

Examples

```bash
trap "unset ${myvars[@]}" SIGINT SIGQUIT SIGTERM
```

Error handling[^err]

1. use a trap `trap 'cmd1; cmd2; ...' ERR`
2. Use `errexit` option: `set -e` or `set -o errexit` or start bash with option `-e`
    - Has some [gotchas](http://mywiki.wooledge.org/BashFAQ/105) though.
    - Also consider option `set -o errtrace` (functions and subshells inherit `errexit` option). [StackExchange](https://stackoverflow.com/questions/25378845/what-does-set-o-errtrace-do-in-a-shell-script)


## Best Practices and Conventions

- Portability: stick to [POSIX Portable Character Set](https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap06.html#tag_06_01)
- [Styleguide by Google](https://google.github.io/styleguide/shellguide.html) ^143a88
    - functions: lower case, separate words with underscores, use `::` to separate packages/libraries (avoid duplicate names)

## Testing

- [[ShellSpec]]
- [shUnit2](https://github.com/kward/shunit2)
- [BATS (Bash Automated Testing System)](https://github.com/sstephenson/bats)
- [BATS-core](https://github.com/bats-core/bats-core)

## Tools

- [GNU parallel](https://www.gnu.org/software/parallel/): shell tool for executing jobs in parallel using one or more computers

## References

- `set -e`: [caveats and why it is crap](https://mywiki.wooledge.org/BashFAQ/105/Answers)
[bash: silently kill background function process](https://stackoverflow.com/questions/5719030/bash-silently-kill-background-function-process)
- [Difference `$@` and `$*` from ChatGPT](arguments.md)
- [wooledge.org Wiki](https://mywiki.wooledge.org/EnglishFrontPage)
    - [Bashism](https://mywiki.wooledge.org/Bashism)
    - [Bash Sheet](https://mywiki.wooledge.org/BashSheet)
- [Bash Bracket Quick Reference](https://www.assertnotmagic.com/2018/06/20/bash-brackets-quick-reference/)

[^err]: <https://stackoverflow.com/questions/64786/error-handling-in-bash>
