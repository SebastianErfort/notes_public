#!/usr/bin/env bash
# A collection of tools for handling notes
# - Synchronisation with another repository
# - Markdown tools: see ~/rsrc/markdown/markdown.sh

function sync_fmkey() {
    # TODO ensure fm exists, else yq fails
    [[ $# != 2 ]] && echo "Usage: <key> <value>" && return 2
    local key=${1:-visibility} value=${2:-public}
    local -a syncfiles # array to store function result

    mapfile -t syncfiles < <(get_files_fmmatch "$key" "$value")

    for ((i = 0; i < ${#syncfiles[@]}; i++)); do
        f=${syncfiles[$i]}
        # NOTE: yq didn't like double ticks :sigh:
        yq -i -f process '.'"${key}=\"${value}\"" "$f"
    done
}

function get_files_fmmatch() {
    local msg_usage="Usage: ${FUNCNAME[0]} <key> <value>"
    [[ $# != 2 ]] && echo "$msg_usage" && return 2
    local -a allfiles files

    mapfile -t allfiles < <(find . -name "*.md")
    for f in "${allfiles[@]}"; do
        [[ $(yq -f extract '.'"$1" "$f" 2>/dev/null) == "$2" ]] && files+=("$f")
    done

    printf "%s\n" "${files[@]}"
}

function push_fmmatch() {
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
        done <public.txt
    fi
    # sort and unique
    mapfile -t syncfiles < <(printf '%s\n' "${syncfiles[@]}" | sort -u)

    echo "Copying files to $3 ..."
    rsync -aLR "${syncfiles[@]}" "$3"
    echo "Done."
}

function pull_fmmatch() {
    [[ $# != 1 ]] &&
        {
            echo "Usage: <source dir>"
            return 2
        }

    echo "Copying files from $3 ..."
    rsync -aLR "$1/*" .

    echo "Done."
}

gh_dispatch() {
    # WARNING: Not yet functional (2024-07-30): 403 error "Resource not
    # accessible by personal access token"
    [[ -z "$GH_USER" ]] && GH_USER="$(git config --global --get user.name)"
    GH_OWNER="$(git config --no-global remote.origin.url | sed 's/^.*://;s/\.git$//' | awk -F/ '{print $1}')"
    GH_REPO="$(git config --no-global remote.origin.url | sed 's/^.*://;s/\.git$//' | awk -F/ '{print $2}')"
    DISPATCH_TYPE=updated_source
    # echo "Triggering workflow for user ${GH_USER} and repo ${GH_REPO} with token ${ACCESS_TOKEN}"
    curl -L \
        -X POST \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: token ${ACCESS_TOKEN}" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        "https://api.github.com/repos/${GH_OWNER}/${GH_REPO}/dispatches" \
        -d '{"event_type":"updated_source","client_payload":{"unit":false,"integration":true}}'
}

if [[ "$0" != "${BASH_SOURCE[0]}" ]]; then
    [[ -f "$HOME/rsrc/markdown/markdown.sh" ]] && . "$HOME/rsrc/markdown/markdown.sh"
else
    case "$1" in
    cicd | pipeline | trigger)
        gh_dispatch
        ;;
    *)
        echo "Unknown command ${1}"
        return 2
        ;;
    esac
fi
