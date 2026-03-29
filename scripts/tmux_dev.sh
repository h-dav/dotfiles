#!/usr/bin/env bash
# Start or attach to a tmux dev session.
# Usage: tmux_dev.sh [session-name]
# Defaults to the current directory name.

SESSION=${1:-$(basename "$PWD")}

# Attach if session already exists
tmux attach-session -t "$SESSION" 2>/dev/null && exit

# ── Create session with 4 windows ─────────────────────────────────────────────
tmux new-session    -d -s "$SESSION" -n nvim
tmux new-window     -d -t "$SESSION" -n ai
tmux new-window     -d -t "$SESSION" -n terminal
tmux new-window     -d -t "$SESSION" -n git

# Start commands and focus nvim
tmux send-keys -t "$SESSION:nvim" "nvim" Enter
tmux send-keys -t "$SESSION:ai" "claude" Enter
tmux send-keys -t "$SESSION:git" "git log" Enter
tmux attach-session -d -t "$SESSION:nvim"
