# Package Template

Description of the Package Template contents and considerations

Partly inspired by https://github.com/mattmassicotte/PackageTemplate


##  Create new Package

1. Create and clone repository named `snap-<package-name>`
2. Create Package (Multiplatform > Library) named `Snap<PackageName>`
2.1. Move files from `Snap<PackageName>` to root of repository
2.2. Change `Package > name:` in `Package.swift` to `snap-<package-name>`
3. Copy files from [template-package](./template-package/) folder
4. Create a [demo project](#demo-project) if suitable
5. Setup GitHub page
5.1. Add Description, Topics, uncheck Packages and Deployments 
6. Add to [Swift Package Index](https://swiftpackageindex.com)

TODO:
(7. Add Documentation with DocC., add to SPI via .spi.yml )


# Package Template Content

## Package.swift
See [Package.swift](./package-template/Package.swift)

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

See [.gitignore](./package-template/.gitignore)


## LICENSE

I chose to use the MIT License (created by Github template) because it is most commonly used in the community. 
See [LICENSE](./package-template/LICENSE)



# Demo Project

Create a demo project if suitable.

1. Create Project in package root, name it <PackageName>Demo.
2. Add Package to Project
2.1. Open Project > Package Dependencies

2A.2. Click +, Add local
2A.3. Package should automatically be added in Target > 'Frameworks, Libraries, and Embedded Content'. Package can be edited directly from Demo Project.

In case of error message about conflicts with other packages dependencies:
2B.2 Add github version.
2B.3 Drag&Drop local package folder into Xcode. This will replace the remote package with local package that can be edited and previewed directly from Demo project.

3. Configure Supported Destinations (add macOS native)
