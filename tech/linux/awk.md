---
title: awk
type: software
category: cl-utility
url: "https://www.gnu.org/software/gawk"
docs: "https://www.gnu.org/software/gawk/manual/gawk.html"
developer:
desc-short: |
  The awk utility interprets a special-purpose programming language that makes it possible to handle simple data-reformatting jobs with just a few lines of code.
  The  original  version of UNIX awk was designed and implemented by Alfred Aho, Peter Weinberger, and Brian Kernighan of Bell Laboratories.
tags:
rsc: "file://rsrc/awk"
aliases: ["gawk"]
visibility: public
---
`= ("[Website](" + this.url + ")")` | `= ("[Documentation](" + this.docs + ")")` | `= ("[Reources](" + this.rsc + ")")`
`= ("> " + this.desc-short)`

Quick reference [cheatsheet](file://rsrc/awk/awk.sh)
> [!tip]- [quickref.me](https://quickref.me/awk) 
> ![[QuickRef.ME_Cheatsheet.md]]

`= ("[Documentation](" + this.docs + ")")`
- [`gawk`](https://www.gnu.org/software/gawk/)
    - [`gawk`-Specific Regexp Operators](https://www.gnu.org/software/gawk/manual/html_node/GNU-Regexp-Operators.html)

## Commands
```bash
awk '{print $2 ", " $1}' <file> # concatenate fields 2 and 1 with string
awk '{print $(NF)}' file # print last column
awk -F'=' {print $2} # use = as field separator
awk -f <awk program> <file> # execute awk program script for file
awk '{print $(NF-2)}' # arithemtic operations
```


### Loops
```awk
for ( i=1; i<=NF; i++ )
  ...
```

### Logic
```awk
if ( <expr> ) { <cmd> } [else { <cmd> }]
```

### Functions
```awk
getline [x] # get next line (and save to variable)
```

### Formatting
- [`gawk` documentation](https://www.gnu.org/software/gawk/manual/gawk.html#Printf)
```awk
printf("%20s",s) # print string with length 20, right-aligned
printf("%-12s",s) # print string with length 12, left-aligned
```

### Maths
```awk
int(3.9) # returns 3
rand() # returns random float 0 <= f < 1
int(rand()*6)+1 # simulate rolling 6-sided die
srand() # seed random number generator, if arg. omitted use curr. time + date\
pi=atan2(0,-1)
```

## Variables

### Strings
```awk
length() # length of string
index() # position of substring in string, 0 if not found
...
sub(regex,newval[,string]) # replace first occurance
gsub(regex,newval[,string]) # replace all occurances
split(string,array[,regex])
```

### Arrays
Only one-dimensional arrays supported, multi-dimensional ones can be simulated by nesting arrays.
Awk supported
- Indexed arrays
- Associative arrays
    ```awk
    a["x"] = 1; a["y"] = 2; a["z"] = 3
    for ( <index> in <array> ) {}
    ```

### Special
```bash
FS # field separator
OFS # output field separator
RS # record separator
NF # number of fields on a line
NR # number of record (lines)
FILENAME
```


## Redirection and Pipes

Piping into `sh`
```awk
{ printf("mv %s %s\n", $0, tolower($0)) | "sh" }
END { close("sh") }
```

## Examples

[My snippets/scripts](file://rsrc/awk)
- Find regular expression, if next line matches another regular expression insert something in-between (empty line): [regexps_differentlines_insert.awk](file://rsrc/awk/regexps_differentlines_insert.awk)

## References
- [[LIL_awk_et|LinkedIn Learning course: AWK Essential Training]]
- https://www.tutorialspoint.com/awk/index.htm
