# SNAP - SN App Packages

Welcome to SNAP, a set of packages I use to build iOS Apps. They contain shared code, generic implementations of common features, and a template to kickstart a new project.

Disclaimer: Most packages are focussed on my own needs. They are public for you to get inspired, learn and tell me what I am doing wrong (srsly, pls tell me!).


## Package Template

Packages are created as described in [template-package.md](./template-package.md).


## Package Dependencies

```mermaid
flowchart TD

    subgraph Packages
    C1[core]
    M2(theme)
    M3(settings-service)
    M4(matching-navigation)
    M5(swift-data)
    M1(template-shared)
    end
    
    A1{Template}

    subgraph Apps
    A2{Theme\nDemo}
    A3{ - ???? - \nApp}
    end

    C1 --> M2
    C1 --> M3

    M2 --> M1
    M3 --> M1
    M4 --> M1

    M1 --> A1

    A1 -.->|Copy| Apps
    M5 --> Apps
```
Mermaid: [Docs](http://mermaid.js.org/intro/), [Editor](https://mermaid.live/)


## Packages

### snap-core
The [snap-core](https://github.com/simonnickel/snap-core) package contains common extensions for Swift and SwiftUI types and helper implementations for convenience.


### snap-theme

The [snap-theme](https://github.com/simonnickel/snap-theme) package provides a toolset to abstract Colors, Fonts, Icons and Values into semantic definitions for a SwiftUI app. It contains a Theme definition to hold semantic values and a set of ViewModifier to apply them to SwiftUI views.


### snap-settings-service

The [snap-settings-service](https://github.com/simonnickel/snap-settings-service) is a simple wrapper to handle different types of settings. It stores a `Codable` type for a `String` key, either locally (UserDefaults), synced (NSUbiquitousKeyValueStore) or in a custom store.


### snap-matching-navigation

The [snap-matching-navigation](https://github.com/simonnickel/snap-matching-navigation) package provides a SwiftUI Container that displays a TabView or SplitScene, based on the device. 


### snap-swift-data

The [snap-swift-data](https://github.com/simonnickel/snap-swift-data) package extends SwiftData to better interoperate with CoreData and Persistent History Tracking.


### snap-app-template + snap-template-shared

[snap-app-template](https://github.com/simonnickel/snap-app-template) is an Xcode project with a base setup of the SNAP package suite. The app comes with a basic structure, navigation and infrastructure. It is used as a template to quickly setup a new app.
The [snap-template-shared](https://github.com/simonnickel/snap-template-shared) package contains shared code to use with the snap-app-template.
