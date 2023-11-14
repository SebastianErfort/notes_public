#!/usr/bin/env bash

function sync_fmkey () {
    # TODO ensure fm exists, else yq fails
    [[ $# != 2 ]] && echo "Usage: <key> <value>" && return 2
    local key=${1:-visibility} value=${2:-public}
    local -a syncfiles # array to store function result

    mapfile -t syncfiles < <(get_files_fmmatch "$key" "$value")

    for (( i=0; i<${#syncfiles[@]} ; i++ )); do
        f=${syncfiles[$i]}
        # NOTE: yq didn't like double ticks :sigh:
        yq -i -f process '.'"${key}=\"${value}\"" "$f"
    done
}

function get_files_fmmatch () {
    local msg_usage="Usage: ${FUNCNAME[0]} <key> <value>"
    [[ $# != 2 ]] && echo "$msg_usage" && return 2
    local -a allfiles files

    mapfile -t allfiles < <(find . -name "*.md")
    for f in "${allfiles[@]}"; do
        [[ $(yq -f extract '.'"$1" "$f" 2>/dev/null) == "$2" ]] && files+=("$f")
    done

    printf "%s\n" "${files[@]}"
}

function push_fmmatch () {
    # Push all files where YAML frontmatter <key> has <value> to <target dir>
    # #markdown #markdown/frontmatter
    # TODO: Would be cooler with Git/version control than rsync
    local msg_usage="Usage: ${FUNCNAME[0]} <key> <value> <target dir>"
    [[ $# != 3 ]] && echo "$msg_usage" && return 2
    # TODO: allow for defaults
    local key=${1:-visibility} value=${2:-public}
    local -a syncfiles # array to store function result

    # TODO: this only catches Markdown files with a certain front matter key and not, for example, image files etc.
    #   => add another way of declaring files public like a whitelist of files or metadata
    #   ! consider license/copyright first
    mapfile -t syncfiles < <(get_files_fmmatch "$key" "$value")
    # additional files from file
    if [[ -f public.txt ]]; then
        while read -r l; do
            syncfiles+=("$l")
        done < public.txt
    fi
    # sort and unique
    mapfile -t syncfiles < <(printf '%s\n' "${syncfiles[@]}" | sort -u)

    echo "Copying files to $3 ..."
    rsync -aLR "${syncfiles[@]}" "$3"
    echo "Done."
}

function pull_fmmatch () {
    [[ $# != 1 ]] && echo "Usage: <source dir>" && return 2

    echo "Copying files from $1 ..."
    cp -ar "$1"/* .
    # rsync -aLR "$3/*" .

    echo "Done."
}
