#!/bin/zsh

# Exit with message if no variable is given
if [ -z $1 ]; then
    echo 'Given no session or directory name to attach to.' >&2
    exit 1
fi

# Query directory path, save directory name and check if session with that name exists
zoxide_result_path="$( zoxide query $1 )"
zoxide_result="$( echo "${zoxide_result_path}" | awk -F / '{print $NF}' )"
session_exists="$( tmux ls -F \#S | grep -x "${zoxide_result}" )"

# Tmux doesn't allow session names with dot in the beginning.
# If trying to get to dot directory, replace dot with underscore.
if [[ $zoxide_result = .* ]]; then
    zoxide_result="${zoxide_result/./_}"
fi

# If no session exists, create one, and if in session already, switch to it.
if [ -z $session_exists ]; then
    cd $zoxide_result_path
    tmux new-session -ds $zoxide_result
    if [ -z $TMUX ]; then
        tmux attach-session -t $zoxide_result
    else
        tmux switch-client -t $zoxide_result
    fi
# If session exists, attach to it, and if in session already, switch to it.
else
    if [ -z $TMUX ]; then
        tmux attach-session -t $zoxide_result
    else
        tmux switch-client -t $zoxide_result
    fi
fi
