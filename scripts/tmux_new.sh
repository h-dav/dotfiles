#!/bin/bash

# Use -d to allow the rest of the function to run
tmux new-session -d -s $1
# -d to prevent current window from changing
tmux rename-window vim
tmux new-window -d -n terminal
tmux new-window -d -n git
# -d to detach any other client (which there shouldn't be,
# since you just created the session).
tmux attach-session -d -t $1
