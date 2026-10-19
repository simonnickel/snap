# Snap agent configs

This folder contains configurations for AI agents: skills, commands, and more.

`AGENTS-shared.md` holds what is specific to the SNAP suite. Anything that applies regardless of project belongs in `AGENTS-global.md` or `conventions/`.

How these files reach each session and how to set them up is described in [`docs/agent-setup.md`](../docs/agent-setup.md).

## Skills

Skill names are prefixed to indicate their scope:

- No prefix — operates on the current package
- `snap-` — operates across the whole suite
- `sn-` — generic, unrelated to the snap suite
