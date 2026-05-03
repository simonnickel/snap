#!/usr/bin/env bash
set -euo pipefail

# Syncs local skills into the standard Codex and Claude skill folders so the same
# repo can be used from both CLI tools and their Xcode integrations. Destinations
# below cover Codex CLI, Codex in Xcode, Claude CLI, and Claude in Xcode.

# Source and destination roots are grouped here for easy editing.
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills"
DESTINATIONS=(
    "${CODEX_HOME:-$HOME/.codex}/skills"
    "$HOME/Library/Developer/Xcode/CodingAssistant/codex/skills"
    "$HOME/.claude/skills"
    "$HOME/Library/Developer/Xcode/CodingAssistant/ClaudeAgentConfig/skills"
)

# Fail early if the expected local skills folder is missing.
if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Skills directory does not exist: $SOURCE_DIR" >&2
    exit 1
fi

# Treat each direct child of ./skills as one skill to sync.
shopt -s nullglob
SKILL_DIRS=()

for dir in "$SOURCE_DIR"/*/; do
    SKILL_DIRS+=("${dir%/}")
done

if [[ ${#SKILL_DIRS[@]} -eq 0 ]]; then
    echo "No skill directories found in $SOURCE_DIR" >&2
    exit 1
fi

echo "Source: $SOURCE_DIR"
echo "Found ${#SKILL_DIRS[@]} skill folder(s):"
for skill_dir in "${SKILL_DIRS[@]}"; do
    echo "- $(basename "$skill_dir")"
done

echo "Destinations:"
for destination in "${DESTINATIONS[@]}"; do
    echo "- $destination"
done

# Replace matching skills in each destination without touching unrelated ones.
for skill_dir in "${SKILL_DIRS[@]}"; do
    skill_name="$(basename "$skill_dir")"
    for destination in "${DESTINATIONS[@]}"; do
        if [[ ! -d "$destination" ]]; then
            echo "Creating destination: $destination"
            mkdir -p "$destination"
        fi
        rm -rf "$destination/$skill_name"
        cp -R "$skill_dir" "$destination/$skill_name"
        echo "Copied $skill_name -> $destination"
    done
done

echo "Done. Restart the relevant tools if they are already running."
