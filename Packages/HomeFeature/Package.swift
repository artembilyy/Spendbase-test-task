// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HomeFeature",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "HomeFeature",
            targets: ["HomeFeature"])
    ],
    dependencies: [
        .package(name: "CoreCoordinator", path: "../CoreCoordinator")
    ],
    targets: [
        .target(
            name: "HomeFeature", dependencies: [
                .product(name: "CoreCoordinator", package: "CoreCoordinator")
            ]),
        .testTarget(
            name: "HomeFeatureTests",
            dependencies: ["HomeFeature"])
    ])
