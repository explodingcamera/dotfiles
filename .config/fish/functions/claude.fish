function claude --description 'Run Claude with the Aura terminal background'
    if test "$TERM_PROGRAM" = ghostty
        printf '\e]11;#030306\a'
    end

    command claude $argv
    set -l exit_status $status

    if test "$TERM_PROGRAM" = ghostty
        printf '\e]111\a'
    end

    return $exit_status
end
