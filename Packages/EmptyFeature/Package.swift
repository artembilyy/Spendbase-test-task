// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EmptyFeature",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "EmptyFeature",
            targets: ["EmptyFeature"])
    ],
    dependencies: [
        .package(name: "CoreCoordinator", path: "../CoreCoordinator"),
        .package(name: "CoreUI", path: "../CoreUI")
    ],
    targets: [
        .target(
            name: "EmptyFeature",
            dependencies: [
                .product(name: "CoreCoordinator", package: "CoreCoordinator"),
                .product(name: "CoreUI", package: "CoreUI")
            ],
            path: "Sources",
            resources: [.process("Resources/Assets.xcassets")]),
        .testTarget(
            name: "EmptyFeatureTests",
            dependencies: ["EmptyFeature"])
    ])
