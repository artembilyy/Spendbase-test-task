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
        .package(name: "CoreCoordinator", path: "../CoreCoordinator"),
        .package(name: "CoreUI", path: "../CoreUI"),
        .package(name: "UserCardsAPI", path: "../UserCardsAPI"),
        .package(name: "CardDataStorage", path: "../CardDataStorage"),
        .package(name: "CardDataFetcher", path: "../CardDataFetcher"),
        .package(name: "MoneyTransferFeature", path: "../MoneyTransferFeature")
    ],
    targets: [
        .target(
            name: "HomeFeature", dependencies: [
                .product(name: "CoreCoordinator", package: "CoreCoordinator"),
                .product(name: "CoreUI", package: "CoreUI"),
                .product(name: "UserCardsAPI", package: "UserCardsAPI"),
                .product(name: "CardDataStorage", package: "CardDataStorage"),
                .product(name: "CardDataFetcher", package: "CardDataFetcher"),
                .product(name: "MoneyTransferFeature", package: "MoneyTransferFeature")
            ],
            path: "Sources",
            resources: [.process("Resources/Assets.xcassets")]),
        .testTarget(
            name: "HomeFeatureTests",
            dependencies: ["HomeFeature"])
    ])
