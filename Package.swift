// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Navigation",
    platforms: [.macOS(.v15), .iOS(.v18)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Navigation",
            targets: ["Navigation"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(
            name: "Navigation_Internal",
            path: "./Sources/Navigation_Internal/Navigation_Internal.xcframework"
        ),
        .binaryTarget(
            name: "Navigation_Protocols",
            path: "./Sources/Navigation_Protocols/Navigation_Protocols.xcframework"),
        .target(
            name: "Navigation",
            dependencies: ["Navigation_Protocols", "Navigation_Internal"]
        )
    ]
)
