# Snap agent configs

This folder contains configurations for Claude and Codex: skills, commands, and more.

## Skills

### Setup with sync-skills.sh

Run the script from anywhere to copy all skills into the standard locations for Claude CLI, Claude in Xcode, Codex CLI, and Codex in Xcode:

```sh
$ ./agents/sync-skills.sh
```

Re-run whenever skills are added or updated. The script replaces only the skills it manages and leaves any other skills in the destination untouched.

### Setup with symlinks (alternative)

Instead of copying, you can symlink the skills folder so changes are reflected immediately without re-running a script. This requires an absolute path and breaks if the repo is moved.

**Claude:**
```sh
$ ln -s /absolute/path/to/snap/agents/skills ~/.claude/skills
```

**Claude in Xcode:**
```sh
$ ln -s /absolute/path/to/snap/agents/skills ~/Library/Developer/Xcode/CodingAssistant/ClaudeAgentConfig/skills
```