// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Composition",
    platforms: [.iOS(.v18), .macOS(.v15)],
    targets: [
        .target(name: "Composition", path: "."),
    ]
)
