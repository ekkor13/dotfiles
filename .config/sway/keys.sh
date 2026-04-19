#!/usr/bin/env bash
set -euo pipefail

DIR="${XDG_CONFIG_HOME:-$HOME/.config}/sway/configs_for_main_config"

declare -A vars
while IFS= read -r line; do
    [[ $line =~ ^[[:space:]]*set[[:space:]]+\$([A-Za-z_][A-Za-z0-9_]*)[[:space:]]+(.+)$ ]] || continue
    vars[${BASH_REMATCH[1]}]=${BASH_REMATCH[2]}
done < "$DIR/variables"

resolve() {
    local s=$1 k
    for k in "${!vars[@]}"; do s=${s//\$$k/${vars[$k]}}; done
    printf '%s' "$s"
}

{
    while IFS= read -r line; do
        [[ $line =~ ^[[:space:]]*bindsym[[:space:]]+([^[:space:]]+)[[:space:]]+(.+)$ ]] || continue
        key=$(resolve "${BASH_REMATCH[1]}")
        cmd=$(resolve "${BASH_REMATCH[2]}")
        printf '%-28s  %s\n' "$key" "$cmd"
    done < "$DIR/bindsym"
} | fuzzel --dmenu --prompt 'keys: ' --lines 30 --width 90 >/dev/null
