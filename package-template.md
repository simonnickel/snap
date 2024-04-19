# Package Template

Description of the Package Template contents and considerations

Partly inspired by https://github.com/mattmassicotte/PackageTemplate


##  Create new Package

1. Create and clone repository named `snap-<package-name>`
2. Create Package (Multiplatform > Library) named `Snap<PackageName>`
    1. Move files from `Snap<PackageName>` to root of repository
    2. Change `Package > name:` in `Package.swift` to `snap-<package-name>`
3. Copy files from [template-package](./template-package/) folder
4. Create a [demo project](#demo-project) if suitable
5. Setup GitHub page: Add Description and Topics, uncheck Packages and Deployments 
6. Add to [Swift Package Index](https://swiftpackageindex.com)

TODO:
Add Documentation with DocC., add to SPI via .spi.yml
Add badges: Plattforms, Documentation, CI
Add Code of Conduct: https://www.contributor-covenant.org


# Package Template Content

## Package.swift
Some adjustments to the Package definition (see [Package.swift](./package-template/Package.swift).

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

A default ignore list for packages (see [.gitignore](./package-template/.gitignore).


## .spi.yml

Configuration for the Swift Package Index to build DocC documentation.


## LICENSE

I chose to use the MIT License (created by Github template) because it is most commonly used in the community
(see [LICENSE](./package-template/LICENSE).


# Demo Project

Create a demo project if suitable.

1. Create Project in package root, name it `PackageNameDemo`
2. Add Package to Project (GitHub Version)
    1. Open Project > Package Dependencies > Add package
    2. Run project
    3. Drag&Drop local package folder into Xcode and commit project changes
    4. Package can be edited directly from Demo Project
