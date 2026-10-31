#!/usr/bin/env bash
set -euo pipefail

# Applies the agent setup described in snap/docs/suite/agent-setup.md.
# Usage: setup.sh [--check]
#   --check  Report what differs from the expected setup without changing anything.

CHECK_ONLY=false
case "${1:-}" in
    "") ;;
    --check) CHECK_ONLY=true ;;
    *) echo "Usage: $(basename "$0") [--check]" >&2; exit 2 ;;
esac

AGENTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SNAP_DIR="$(dirname "$AGENTS_DIR")"
WORKSPACE_DIR="$(dirname "$SNAP_DIR")"
SKILLS_DIR="$AGENTS_DIR/skills"

# Skill folders of Codex CLI, Codex in Xcode, Claude CLI and Claude in Xcode.
SKILL_DESTINATIONS=(
    "${CODEX_HOME:-$HOME/.codex}/skills"
    "$HOME/Library/Developer/Xcode/CodingAssistant/codex/skills"
    "$HOME/.claude/skills"
    "$HOME/Library/Developer/Xcode/CodingAssistant/ClaudeAgentConfig/skills"
)

# Every skill is named snap-*, so the script owns all folders with that prefix in a destination.
SKILL_PREFIX="snap-"

PROBLEMS=0

ok() { echo "✓ $1"; }
fixed() { echo "+ $1"; }
problem() { echo "✗ $1"; PROBLEMS=$((PROBLEMS + 1)); }

# Global instructions: ~/.claude/CLAUDE.md links to AGENTS-global.md.
# An existing regular file is never replaced, it may hold instructions of its own.
global_link="$HOME/.claude/CLAUDE.md"
global_target="$AGENTS_DIR/AGENTS-global.md"
if [[ -L "$global_link" && "$(readlink "$global_link")" == "$global_target" ]]; then
    ok "$global_link links to AGENTS-global.md"
elif [[ -e "$global_link" && ! -L "$global_link" ]]; then
    problem "$global_link is a regular file. Move it away and re-run."
elif $CHECK_ONLY; then
    problem "$global_link does not link to $global_target"
else
    mkdir -p "$(dirname "$global_link")"
    ln -sfn "$global_target" "$global_link"
    fixed "$global_link linked to AGENTS-global.md"
fi

# Workspace: AGENTS.md contains only the import of AGENTS-shared.md.
workspace_file="$WORKSPACE_DIR/AGENTS.md"
workspace_content="@snap/agents/AGENTS-shared.md"
if [[ -f "$workspace_file" && "$(cat "$workspace_file")" == "$workspace_content" ]]; then
    ok "$workspace_file imports AGENTS-shared.md"
elif [[ -e "$workspace_file" ]]; then
    problem "$workspace_file should contain only '$workspace_content'"
elif $CHECK_ONLY; then
    problem "$workspace_file is missing"
else
    echo "$workspace_content" > "$workspace_file"
    fixed "$workspace_file created"
fi

# Skills: each direct child of ./skills is copied into every destination.
shopt -s nullglob
SKILL_NAMES=()
for dir in "$SKILLS_DIR"/*/; do
    name="$(basename "$dir")"
    if [[ "$name" != "$SKILL_PREFIX"* ]]; then
        echo "Skill $name is not prefixed with $SKILL_PREFIX" >&2
        exit 1
    fi
    SKILL_NAMES+=("$name")
done
if [[ ${#SKILL_NAMES[@]} -eq 0 ]]; then
    echo "No skills found in $SKILLS_DIR" >&2
    exit 1
fi

is_skill() {
    local name
    for name in "${SKILL_NAMES[@]}"; do
        [[ "$name" == "$1" ]] && return 0
    done
    return 1
}

for destination in "${SKILL_DESTINATIONS[@]}"; do
    # A destination linked to the source folder already is in sync, copying would delete the source.
    if [[ -d "$destination" && "$(cd "$destination" && pwd -P)" == "$(cd "$SKILLS_DIR" && pwd -P)" ]]; then
        ok "$destination links to the skills folder"
        continue
    fi

    stale=()
    for dir in "$destination/$SKILL_PREFIX"*/; do
        name="$(basename "$dir")"
        is_skill "$name" || stale+=("$name")
    done

    outdated=()
    for name in "${SKILL_NAMES[@]}"; do
        diff -rq "$SKILLS_DIR/$name" "$destination/$name" > /dev/null 2>&1 || outdated+=("$name")
    done

    if [[ ${#stale[@]} -eq 0 && ${#outdated[@]} -eq 0 ]]; then
        ok "$destination is in sync"
    elif $CHECK_ONLY; then
        if [[ ${#outdated[@]} -gt 0 ]]; then
            problem "$destination has missing or outdated skills: ${outdated[*]}"
        fi
        if [[ ${#stale[@]} -gt 0 ]]; then
            problem "$destination has removed skills: ${stale[*]}"
        fi
    else
        mkdir -p "$destination"
        for dir in "$destination/$SKILL_PREFIX"*/; do
            rm -rf "${dir%/}"
        done
        for name in "${SKILL_NAMES[@]}"; do
            cp -R "$SKILLS_DIR/$name" "$destination/$name"
        done
        fixed "$destination synced (updated: ${outdated[*]:-none}, removed: ${stale[*]:-none})"
    fi
done

if [[ $PROBLEMS -gt 0 ]]; then
    echo "$PROBLEMS problem(s) found."
    exit 1
fi
$CHECK_ONLY || echo "Done. Restart the relevant tools if they are already running."
