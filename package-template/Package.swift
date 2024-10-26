// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "snap-package",
	platforms: [
		.iOS(.v18), .macOS(.v15)
	],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SnapPackage",
            targets: ["SnapPackage"]),
    ],
    // TODO: Remove if not required.
	dependencies: [
		// Dependencies declare other packages that this package depends on.
		.package(url: "https://github.com/simonnickel/snap-foundation.git", branch: "main"),
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SnapPackage",
            dependencies: [ // TODO: Remove if not required.
				.product(name: "SnapFoundation", package: "snap-foundation"),
			]
		),
        .testTarget( // TODO: Remove if not used.
            name: "SnapPackageTests",
            dependencies: ["SnapPackage"]
		),
    ],
    swiftLanguageModes: [.version("6")]
)
