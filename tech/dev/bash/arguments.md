---
title: Bash: Arguments
tags: [dev/bash/args]
---

## Accessing positional parameters or arguments

From [ChatGPT](https://chat.openai.com/share/8bfea325-bbcd-497d-821c-bd05b91b7249)

In Bash, the special variables `$@` and `$*` are used to access function arguments, specifically the arguments passed to a script or function. While they might appear to behave similarly in some cases, they have subtle differences in how they handle arguments, particularly when it comes to handling spaces and quotes.

1. `$@`:
   - When used within double quotes (e.g., `"$@"`), each argument is treated as a separate entity, preserving any whitespace and quotes within the arguments.
   - This means that arguments are individually wrapped in double quotes and treated as separate strings, making it suitable for scenarios where you want to maintain the individual arguments as distinct entities.

2. `$*`:
   - When used within double quotes (e.g., `"$*"`), all arguments are treated as a single entity, with spaces acting as separators. The entire list of arguments is treated as a single string.
   - This is useful when you want to treat all arguments as a single string, effectively concatenating them together.

Here's an example to illustrate the difference:

```bash
#!/bin/bash

print_args() {
    echo "Using \$@:"
    for arg in "$@"; do
        echo "$arg"
    done

    echo -e "\nUsing \$*:"
    for arg in $*; do
        echo "$arg"
    done
}

print_args "arg with spaces" "arg2" "arg3"
```

If you run this script with the above content, you'll notice that the `"$@"` version correctly preserves the arguments, even if they have spaces, while the `"$*"` version treats all arguments as a single space-separated string.

For example, calling the script with the command: `./script.sh "arg with spaces" "arg2" "arg3"` would output:

```
Using $@:
arg with spaces
arg2
arg3

Using $*:
arg
with
spaces
arg2
arg3
```

In most cases, using `"$@"` is preferred, as it handles arguments more reliably and maintains their integrity. However, there might be scenarios where you specifically want to treat all arguments as a single string, in which case `"$*"` could be used.