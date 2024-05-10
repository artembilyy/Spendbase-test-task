// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TabBarCoordinator",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "TabBarCoordinator",
            targets: ["TabBarCoordinator"])
    ],
    dependencies: [
        .package(name: "CoreCoordinator", path: "../CoreCoordinator"),
        .package(name: "HomeFeature", path: "../HomeFeature"),
        .package(name: "EmptyFeature", path: "../EmptyFeature")
    ],
    targets: [
        .target(
            name: "TabBarCoordinator",
            dependencies: [
                .product(name: "CoreCoordinator", package: "CoreCoordinator"),
                .product(name: "HomeFeature", package: "HomeFeature"),
                .product(name: "EmptyFeature", package: "EmptyFeature")
            ],
            path: "Sources",
            resources: [.process("Resources/Assets.xcassets")]),
        .testTarget(
            name: "TabBarCoordinatorTests",
            dependencies: ["TabBarCoordinator"])
    ])
