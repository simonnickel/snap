# SNAP - SN App Packages

Welcome to SNAP, a set of packages I use in my iOS Apps. They contain common features, shared code and a template to kickstart a new project.

Disclaimer: Main goal of most packages is to support my own needs. They are public for you to get inspired, learn and tell me what I am doing wrong (srsly, pls tell me!). 


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
The [snap-core](https://github.com/simonnickel/snap-core) package contains helper and common extensions for Swift and SwiftUI.


### snap-app-template + snap-template-shared

[snap-app-template](https://github.com/simonnickel/snap-app-template) is an Xcode project with a base setup of the SNL package suite. The app comes with a basic structure, navigation and infrastructure. It is used as a template to quickly setup a new app.
The [snap-template-shared](https://github.com/simonnickel/snap-template-shared) package contains shared code to use when following the snap-app-template.


### snap-theme

The [snap-theme](https://github.com/simonnickel/snap-theme) package contains 


### snap-settings-service

The [snap-settings-service](https://github.com/simonnickel/snap-settings-service) package contains 


### snap-matching-navigation

The [snap-matching-navigation](https://github.com/simonnickel/snap-matching-navigation) package contains 


### snap-swift-data

The [snap-swift-data](https://github.com/simonnickel/snap-swift-data) package contains 


## snap-starter-kit

The [snap-starter-kit](https://github.com/simonnickel/snap-starter-kit) package contains 