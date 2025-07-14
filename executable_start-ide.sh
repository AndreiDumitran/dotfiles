#!/usr/bin/env bash

# Name session after current directory
SESSION_NAME=$(basename "$PWD")

# If session exists, just attach
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  tmux attach-session -t "$SESSION_NAME"
  exit 0
fi

# Ensure tmux server is running and use 1-based pane indexing
tmux start-server
tmux set-option -g pane-base-index 1
tmux set-option -g base-index 1

# Create new detached session, window “main”
tmux new-session -d -s "$SESSION_NAME" -n main

# 1) Split pane 1 horizontally, making pane 2 on the right at 80% width
#    → leaves pane 1 (Claude) at 20% width
tmux split-window -h -p 80 -t "$SESSION_NAME":main.1

# 2) Split the right pane (pane 2) vertically, making pane 3 below at 15% height
#    → leaves pane 2 (Neovim) at 85% height
tmux split-window -v -p 15 -t "$SESSION_NAME":main.2

# Run Claude in pane 1 (20% wide)
tmux send-keys -t "$SESSION_NAME":main.1 "claude" C-m

# Run Neovim in pane 2 (big, 85% of height × 80% width)
tmux send-keys -t "$SESSION_NAME":main.2 "nvim" C-m

# Pane 3 (bottom-right, 15% height × 80% width) left as a normal shell

# Focus pane 1 and attach
tmux select-pane -t "$SESSION_NAME":main.1
tmux attach-session -t "$SESSION_NAME"
