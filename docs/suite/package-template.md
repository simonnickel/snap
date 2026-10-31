# Package Template

Considerations and description of the content in [package-template](../../package-template/).

Partly inspired by [PackageTemplate](https://github.com/mattmassicotte/PackageTemplate).


## Create new Package

1. Create and clone repository named `snap-<package-name>`
2. Create package (Multiplatform > Library) named `Snap<PackageName>`
    1. Move files from `Snap<PackageName>/` to root of repository
    2. Copy files from [package-template](../../package-template/) folder (make sure to include .-files)
    3. Fix names in `Package.swift`
3. Create a [demo project](#demo-project) if suitable
4. Set up GitHub page: Add Description and Topics, uncheck Packages and Deployments
5. Add to [Swift Package Index](https://swiftpackageindex.com)
    1. Update Badge and Documentation urls in README.md
    2. Update `.spi.yml` to contain target names
6. Add the package to [packages-overview.md](packages-overview.md), [packages.json](../../packages.json) and the [README](../../README.md), including its dependency graph


## Package Template Content

### Package.swift
Adjustments to the package definition. The current values are in [Package.swift](../../package-template/Package.swift).

#### Platforms

```swift
platforms: [
    .iOS(.v<version>), .macOS(.v<version>)
],
```

#### Swift 6

```swift
// swift-tools-version: <version>
```

### .gitignore

A default ignore list for packages (see [.gitignore](../../package-template/.gitignore)).


### .spi.yml

Configuration for the Swift Package Index to build DocC documentation.


### LICENSE

I chose to use the MIT License (created by GitHub template) because it is most commonly used in the community
(see [LICENSE](../../package-template/LICENSE)).


### AGENTS.md

Imports the suite layer, as described in [agent-setup.md](agent-setup.md) (see [AGENTS.md](../../package-template/AGENTS.md)).


## Demo Project

Create a demo project if suitable and configure project to edit the package directly from the demo project:

1. Create a project in package root, name it `Snap<PackageName>Demo`
2. Add local package as dependency to the project:
    1. Open Project > Package Dependencies > Add package > "Add local"
3. Remove unnecessary files: Assets.xcassets, Preview Content (clear DEVELOPMENT_ASSET_PATHS)
4. Copy IDETemplateMacros.plist to demo project:
    1. From: /package-template/.swiftpm/xcode/xcshareddata/IDETemplateMacros.plist
    2. To: /Snap<PackageName>Demo/Snap<PackageName>Demo.xcodeproj/project.xcworkspace/xcshareddata/IDETemplateMacros.plist
5. Replace all file headers with the one from the previous step.
6. Convert root folder to Group and create folder `Views` in it, move `ContentView.swift` into it.
7. Set Swift Language Version to 6.