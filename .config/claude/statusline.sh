#!/bin/sh

input=$(cat)
directory=$(printf '%s' "$input" | jq -r '.workspace.current_dir // .cwd // ""')
model=$(printf '%s' "$input" | jq -r '.model.display_name // "Claude"')
context=$(printf '%s' "$input" | jq -r 'if .context_window.used_percentage == null then "" else (.context_window.used_percentage + 0.5 | floor | tostring) end')
effort=$(printf '%s' "$input" | jq -r '.effort.level // ""')

case $directory in
    "$HOME") project='~' ;;
    "$HOME"/*)
        relative=${directory#"$HOME"/}
        project='~'
        while [ "$relative" != "${relative#*/}" ]; do
            component=${relative%%/*}
            project="$project/${component%"${component#?}"}"
            relative=${relative#*/}
        done
        project="$project/$relative"
        ;;
    *) project=${directory:-/} ;;
esac

if [ -n "$directory" ]; then
    branch=$(git -C "$directory" branch --show-current 2>/dev/null)
else
    branch=''
fi
[ -n "$branch" ] && project="$project ($branch)"

purple='\033[38;2;162;119;255m'
text='\033[38;2;237;236;238m'
muted='\033[38;2;170;164;180m'
yellow='\033[38;2;255;202;133m'
reset='\033[0m'

right=$model
[ -n "$effort" ] && right="$right · $effort"
[ -n "$context" ] && right="$right · $context% context"

gap=2
case ${COLUMNS:-} in
    ''|*[!0-9]*) ;;
    *)
        left_width=$(printf '%s' "$project" | wc -m)
        right_width=$(printf '%s' "$right" | wc -m)
        space=$((COLUMNS - 4 - left_width - right_width))
        [ "$space" -gt "$gap" ] && gap=$space
        ;;
esac

printf '%b%s%b' "$purple" "$project" "$muted"
printf '%*s' "$gap" ''
printf '%b%s' "$text" "$model"
[ -n "$effort" ] && printf '%b · %b%s' "$muted" "$yellow" "$effort"
[ -n "$context" ] && printf '%b · %s%% context' "$muted" "$context"
printf '%b\n' "$reset"
