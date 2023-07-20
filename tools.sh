#!/usr/bin/env bash

function sync_fmkey () {
    # TODO ensure fm exists, else yq fails
    [[ $# != 2 ]] && echo "Usage: <key> <value>" && return 2
    local key=${1:-visibility} value=${2:-public}
    declare -ga syncfiles # array to store function result

    get_files_fmmatch "$key" "$value" syncfiles

    for (( i=0; i<${#syncfiles[@]} ; i++ )); do
        f=${syncfiles[$i]}
        yq -i -f process '.'"$key=\"$value\"" "$f"
    done

    unset syncfiles
}

function get_files_fmmatch () {
    [[ $# != 3 ]] && echo "Usage: <key> <value> <array>" && return 2
    local -a allfiles
    # set local reference to global array (allocate before!)
    eval "local -n files=$3"

    mapfile -t allfiles < <(find . -name "*.md")
    for (( i=0; i<${#allfiles[@]} ; i++ )); do
        f=${allfiles[$i]}
        # TODO filter
        # TODO dynamic function call
        [[ $(yq -f extract '.'"$1" "$f" 2>/dev/null) == "$2" ]] && files+=("$f")
    done
}

function push_fmmatch () {
    [[ $# != 3 ]] && echo "Usage: <key> <value> <target dir>" && return 2
    local key=${1:-visibility} value=${2:-public}
    declare -ga syncfiles # array to store function result

    # TODO this only catches Markdown files with a certain front matter key and not, for example, image files etc.
    #   => add another way of declaring files public like a whitelist of files or metadata
    get_files_fmmatch "$key" "$value" syncfiles
    while read -r l; do
        syncfiles+=("$l")
    done < public.txt
    # TODO duplicates

    echo "Copying ${#syncfiles[@]} files to $3 ..."
    rsync -aLR "${syncfiles[@]}" "$3"

    unset syncfiles
    echo "Done."
}

function pull_fmmatch () {
    [[ $# != 1 ]] && echo "Usage: <source dir>" && return 2

    echo "Copying files from $3 ..."
    rsync -aLR "$3/*" .

    echo "Done."
}
