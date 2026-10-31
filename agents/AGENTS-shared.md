# The SNAP Suite

SNAP (SN App Packages) is a set of Swift libraries for building iOS apps. `snap/` is the coordinating repository. The packages live alongside it as individual git repositories, in a shared workspace folder.

## Workspace

- Keep work within the package the session was started in.
- A session started at the workspace root covers all packages.
- Commit in each package's own repository.
- Dependencies resolve from GitHub. Local changes reach dependents only once pushed.

@../docs/suite/mission-statement.md

@../docs/suite/packages-overview.md

@../docs/suite/skills.md
