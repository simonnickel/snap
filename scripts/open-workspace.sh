#!/bin/zsh

# Opens the apps to work on the package suite:
# - Every repository of the workspace as a tab in a new Tower window.
# - The workspace root in Nova.
# - The workspace root in a new Terminal window.

set -eu

workspace="${0:A:h:h:h}"
# Absolute path because Shortcuts runs scripts without /usr/local/bin in PATH.
gittower=/Applications/Tower.app/Contents/Helpers/gittower

# --new-tab targets the frontmost window, so the first repo creates that window.
flag=--new-window
for git_dir in "$workspace"/*/.git(N); do
    "$gittower" open "${git_dir:h}" "$flag"
    flag=--new-tab
    sleep 0.5
done

open -a Nova "$workspace"
open -a Terminal "$workspace"
