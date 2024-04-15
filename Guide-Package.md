#  Create a Package

1. Create and clone repository named `snap-<package-name>`
2. Add `.gitignore`
3. Create Package (Multiplatform > Library) named `Snap<PackageName>`
3.1. Move files from `Snap<PackageName>` to root of repository
3.2. Change `Package > name:` in `Package.swift` to `snap-<package-name>`
4. Configure `Package.swift` (see below)

5. Add Readme
6. Add Demo Project
(7. Add Documentation with DocC.)


## Package.swift

### Add platforms definition:

```
platforms: [
    .iOS(.v17), .macOS(.v14) //, .tvOS(.v16), .watchOS(.v9)
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

```
# macOS
.DS_Store
.netrc

# Xcode
xcuserdata/
contents.xcworkspacedata
/.build
DerivedData/

# PM
/Packages
.swiftpm/configuration/registries.json
.swiftpm/config/registries.json
.swiftpm/xcode/package.xcworkspace/contents.xcworkspacedata
```


## Demo Project

1. Create Project in package root, name it <PackageName>Demo.
2. Add Package to Project
2.1. Open Project > Package Dependencies

2A.2. Click +, Add local
2A.3. Package should automatically be added in Target > 'Frameworks, Libraries, and Embedded Content'. Package can be edited directly from Demo Project.

In case of error message about conflicts with other packages dependencies:
2B.2 Add github version.
2B.3 Drag&Drop local package folder into Xcode. This will replace the remote package with local package that can be edited and previewed directly from Demo project.

3. Configure Supported Destinations (add macOS native)
