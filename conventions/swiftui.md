# SwiftUI

## View Modifier
Every ViewModifier should have an inert variant: a neutral value that preserves context rather than overriding it. This allows conditional application without breaking view identity, which is required for animations. The inert variant should be documented and as self-evident as possible.
