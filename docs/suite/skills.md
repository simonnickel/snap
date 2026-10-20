# Skills

A skill describes a recurring multi-step workflow.

- After changing a skill in `snap/agents/skills/`, run `snap/agents/setup.sh` to copy it into the skill folders of each agent tool.

Skills typically use this phase structure. Diverge when a phase does something meaningfully different:

- **Gather context** — read files and collect inputs before analysis
- **Analyse** — evaluate the gathered context against defined criteria
- **Present findings** — present using the standard format defined in `AGENTS-global.md`
