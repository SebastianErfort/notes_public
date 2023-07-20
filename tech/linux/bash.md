---
title: bash
tags: dev/programming dev/bash dev/shell dev/terminal dev/script dev/coding
visibility: public
---
[Linux Commands](linux.md#Commands) | [code snippets](file://src) |  [Jupyter-lab notebook](file://notes/life/tech/bash.ipynb)
- [wooledge.org Wiki](https://mywiki.wooledge.org/EnglishFrontPage)
  - [Bashim](https://mywiki.wooledge.org/Bashism)
  - [Bash Sheet](https://mywiki.wooledge.org/BashSheet)
- [Bash Bracket Quick Reference](https://www.assertnotmagic.com/2018/06/20/bash-brackets-quick-reference/)

# Options & Config
[gnu.org: The Set Builtin](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html)

# Command Line
## Completion
See files in [`/usr/share/bash-completion/completions/`](file:///usr/share/bash-completion/completions) and `/etc/bash_completion.d/`
- [hostname completion](https://blog.sanctum.geek.nz/bash-hostname-completion/)

# General
## Loops
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

## Arithemtics and logic
```bash
n=0
(( n++ ))
echo $n
# 1
(( n==1 )) && echo 'y' || echo 'n'
# y
```

## Variables
### Booleans: true and false
```bash
for error in true false; do
    ! $error && echo not nope || echo not yep
done
```

### Strings
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
- Sanitize a string
  ```bash
  s='abc123XYZ@troll_ol-!"§$%&/()=?'
  echo ${s//[^a-zA-Z0-9_@\\\-.]} # delete all characters not matching
  ```
- Variable expansion, manipulation and interpolation #dev/bash
  ```bash
  fname=john
  john=thomas
  echo ${!fname} # returns thomas
  myvar=${1:-Default} # assign default value if variable is undefined
  ```

### Arrays
Can be declared or instantiated like
```bash
# explicit declaration (can also be done implicitely, on-the-fly)
declare -a arr1 # indexed array
declare -A arr2 # associative array
arr3=("derp" "schlerp" 123)
# access elements
echo ${arr3[0]} # first, starting at 0
echo ${arr3[-2]} # 2nd from back (since bash 4.2 - 4.3)
# access entire array
echo ${arr[@]}
# or
echo ${arr[*]}
# add element
arr1+=("new" "elements")
# number of elements
${#arr[@]}
```
> The only difference between `@` and `*` is when the form `${my_array[x]}` is surrounded with double-quotes. In this case, `*` expands to a single word where array elements are separated with space. `@` expands each array element to a separate word. This is especially important when using the form to iterate through array elements.
> https://linuxize.com/post/bash-arrays/


### Special Variables

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

## Regular Expressions
#dev/regex

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

## Functions
```bash
# define a function
function myfunction () {
    # function content
    ${FUNCNAME[0]} # Last function on the function stack, inside a function its name
    done && return
}
```
References
- bash function with array in-/output

## Arguments
- special variables holding arguments
    ```bash
    $0   # shell or script name
    $@   # arguments
    $*   # arguments
    $#   # number of arguments
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
- History
  ```bash
  !!     # repeat last command
  !123   # repeat command 123 from history
  !cmd   # repeat last command starting with "cmd"
  !cmd:p # print command but don't execute
  ```

# Commands
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

# Input & Output
## STDIN, STDERR and exit codes

- re-direct stderr to command and re-direct that command's stdout back to original stderr: `mycmd 2> >(myfunc >&2)`
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


## Stream manipulation
- *Here Documents*: inline files with optional variable substitution [TLDP](https://tldp.org/LDP/abs/html/here-docs.html) #dev/shell/heredoc
```bash
sed 's/\/.*\///' << EOF
  Found your home directory, $HOME!
EOF
sed 's/\/.*\///' << 'EOF'
  I just checked $HOME.
EOF
sed 's/\/.*\///' <<- EOF
  And this will remove leading TABS, $HOME.
EOF
```
- cut
```bash
cut -d " " -f 2,3 # Cut fields from file/standard input if omitted. Delimiter " ", fields 2+3
```

## Permissions
Grant execute permissions if on directories, but not files [@stackoverflow](https://stackoverflow.com/questions/17091300/linux-set-permission-only-to-directories)
```bash
chmod -R X /path/to/file
```

## Formatting
Overwrite previous line of output
```bash
printf "\r $newline"
```
- string formatting with `printf`
  ```bash
  printf '%s %04d %10.2f' 'string' 101 '3.14'
  ```
Progress
- [Pipe Viewer](https://www.ivarch.com/programs/pv.shtml): terminal-based tool for monitoring the progress of data through a pipeline


# Scripts

## Control
### Traps
trigger action upon pressing Ctrl+C,D, ..., on error or other
### Error handling
https://stackoverflow.com/questions/64786/error-handling-in-bash
1. use a trap `trap 'cmd1; cmd2; ...' ERR`
2. Use `errexit` option: `set -e` or `set -o errexit` or start bash with option `-e`
   - Has some [gotchas](http://mywiki.wooledge.org/BashFAQ/105) though.
   - Also consider option `set -o errtrace` (functions and subshells inherit `errexit` option). [StackExchange](https://stackoverflow.com/questions/25378845/what-does-set-o-errtrace-do-in-a-shell-script)

# Shell Expansion
See https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Brace-Expansion
- [Bash Error Handling @RedHat](https://www.redhat.com/sysadmin/bash-error-handling)
- [Tilde Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Tilde-Expansion)
- [Shell Parameter Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Parameter-Expansion)
- [Command Substitution](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Command-Substitution)
- [Arithmetic Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Arithmetic-Expansion)
- [Process Substitution](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Process-Substitution)
- [Word Splitting](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Word-Splitting)
- [Filename Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Filename-Expansion)
- [Quote Removal](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Quote-Removal)


# References
- `set -e`: [caveats and why it is crap](https://mywiki.wooledge.org/BashFAQ/105/Answers)
[bash: silently kill background function process](https://stackoverflow.com/questions/5719030/bash-silently-kill-background-function-process)
