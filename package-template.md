# Package Template

Considerations and description of the content in [template-package](./template-package/).

Partly inspired by https://github.com/mattmassicotte/PackageTemplate


##  Create new Package

1. Create and clone repository named `snap-<package-name>`
2. Create package (Multiplatform > Library) named `Snap<PackageName>`
    1. Move files from `Snap<PackageName>/` to root of repository
    2. Copy files from [template-package](./template-package/) folder (make sure to include .gitignore)
    3. Fix names in `Package.swift`
3. Create a [demo project](#demo-project) if suitable
4. Setup GitHub page: Add Description and Topics, uncheck Packages and Deployments 
5. Add to [Swift Package Index](https://swiftpackageindex.com)
    1. Update Badge and Documentation urls in README.md

TODO:
Add Code of Conduct: https://www.contributor-covenant.org


# Package Template Content

## Package.swift
Some adjustments to the Package definition (see [Package.swift](./package-template/Package.swift)).

### Add platforms definition:

```
platforms: [
    .iOS(.v17), .macOS(.v14)
],
```

### Enable strict concurrency checking:

```
.target(
    name: ...,
    swiftSettings: [
        .enableExperimentalFeature("StrictConcurrency")
    ]
)
```

## .gitignore

A default ignore list for packages (see [.gitignore](./package-template/.gitignore)).


## .spi.yml

Configuration for the Swift Package Index to build DocC documentation.


## LICENSE

I chose to use the MIT License (created by Github template) because it is most commonly used in the community
(see [LICENSE](./package-template/LICENSE)).


# Demo Project

Create a demo project if suitable and configure project to edit the package directly from the demo project:

1. Create a project in package root, name it `PackageNameDemo`
2. Add local package as dependency to the project: 
    1. Open Project > Package Dependencies > Add package > "Add local"