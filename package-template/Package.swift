// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "snap-package",
	platforms: [
		.iOS(.v17), .macOS(.v15)
	],
    products: [
        .library(
            name: "SnapPackage",
            targets: ["SnapPackage"]),
    ],
    // TODO: Remove if not required.
	dependencies: [
		.package(url: "https://github.com/simonnickel/snap-foundation.git", branch: "main"),
	],
    targets: [
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
)
