// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreCoordinator",
    products: [
        .library(
            name: "CoreCoordinator",
            targets: ["CoreCoordinator"])
    ],
    targets: [
        .target(
            name: "CoreCoordinator"),
        .testTarget(
            name: "CoreCoordinatorTests",
            dependencies: ["CoreCoordinator"])
    ])
