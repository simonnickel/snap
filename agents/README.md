# Snap agent configs

This folder contains configurations for AI agents: skills, commands, and more.

## AGENTS.md

`AGENTS-shared.md` holds instructions shared across the suite. Each package needs a `CLAUDE.md` (importing `AGENTS.md`) and an `AGENTS.md` (importing `AGENTS-shared.md` and extending it with package-specific context). The workspace folder follows the same pattern.

Use the `check-agents-md` skill to create or update them.

## AGENTS-global.md

Holds instructions that apply to every Claude Code session, regardless of project (e.g. how to present review findings). Claude Code reads global instructions from `~/.claude/CLAUDE.md`, so symlink it there (remove any existing file at that path first):

```sh
$ ln -s /absolute/path/to/snap/agents/AGENTS-global.md ~/.claude/CLAUDE.md
```

## Skills

Skill names are prefixed to indicate their scope:

- No prefix — operates on the current package
- `snap-` — operates across the whole suite
- `sn-` — generic, unrelated to the snap suite

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