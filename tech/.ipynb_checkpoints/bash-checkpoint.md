---
tags: programming bash shell terminal script
visibility: public
---

[code snippets](file://src) |  [Jupyter-lab notebook](file://notes/life/tech/bash.ipynb)

## String Maniupulation

- length of a string `${#s}`
- substring
  ```bash
  s='abcABC123ABCabc'
  echo ${s:3} ${s:6:3} ${s:(-3)} ${s: -6}
  ```
  _Note that negative indices (position from end of string) need parentheses or space to be escaped_
- extract a maximum of $length positional parameters, starting at $position
    ```bash
  function f() {
      echo ${*:2}
      echo ${@:2}
  }
  f 1 2 3
  # 1 2
  # 1 2
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
  echo ${stringZ/#abc/XYZ} # from start
  echo ${stringZ/%abc/XYZ} # from end
  echo ${stringZ/abc} # delete from start
  echo ${stringZ/%abc} # delete from end
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
  echo ${s,,} # all lower case (doesn't seem to work with specifying certain characters)
  ```
- extract a maximum of $length positional parameters, starting at $position
  ```bash
  function f() {
      echo ${*:2}
      echo ${@:2}
  }
  f 1 2 3
  ```
- Sanitize a string
  ```bash
  s='abc123XYZ@troll_ol-!"§$%&/()=?'
  echo ${s//[^a-zA-Z0-9_@\\\-.]}
  ```