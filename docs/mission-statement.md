# Mission Statement

Why the SNAP suite exists and what it optimizes for.

## Purpose

SNAP exists so I stop rebuilding the same foundation for every iOS app. Each package solves one recurring problem once, well enough to reuse without adapting it.

The suite is public for reference and feedback. It is shaped around my own projects and does not aim to serve every use case. Which problems a package solves follows my projects, how it solves them does not.

## What the suite optimizes for

- **Longevity over convenience.** Code has to survive years of OS releases, so staying close to the system beats a clever abstraction that needs maintenance.
- **Reuse without coupling.** A package is useful on its own. It makes no assumption about the app or package consuming it, such as its architecture, threading or lifecycle, and its design holds up across a wide range of usage contexts.
- **Small surface.** Every public symbol is a maintenance commitment, so the API stays as small as the problem allows.

## Current state

- Unreleased. Changing public API is fine.
- The demo verifies integration, it does not drive API design.
