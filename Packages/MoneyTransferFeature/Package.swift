// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoneyTransferFeature",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "MoneyTransferFeature",
            targets: ["MoneyTransferFeature"])
    ],
    dependencies: [
        .package(name: "CoreCoordinator", path: "../CoreCoordinator"),
        .package(name: "CoreUI", path: "../CoreUI"),
        .package(name: "CardDataStorage", path: "../CardDataStorage")
    ],
    targets: [
        .target(
            name: "MoneyTransferFeature", dependencies: [
                .product(name: "CoreCoordinator", package: "CoreCoordinator"),
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "CardDataStorage", package: "CardDataStorage")
            ],
            path: "Sources",
            resources: [.process("Resources/Assets.xcassets")]),
        .testTarget(
            name: "MoneyTransferFeatureTests",
            dependencies: ["MoneyTransferFeature"])
    ])
