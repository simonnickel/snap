# Principles

What to weigh when a design decision is not obvious.

 - Keep it simple: Least complex solution is preferred.
 - Stay close to the system: Avoid custom patterns or frameworks.
 - Locality, Separation, Independence, Black Box: Prevent dependencies between modules / features / sections.  
 - Maintainability: Prevent future work.
 - Don't let it dry out: While DRY (don't repeat yourself) is great, it's often misunderstood as don't repeat code. It should be don't repeat logic instead.
 - Explicit over implicit. Don't hide the details.


## Dependencies
Trying to prevent using external dependencies. This is a guideline, not a rule. The closer to the core, the more significant it becomes.

1. Try a simpler solution that works out of the box.
2. If worth it, try to reimplement. Book the effort as learning.
3. If using something external, try to wrap it for easy replacement.
