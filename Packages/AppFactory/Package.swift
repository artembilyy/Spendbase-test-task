// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppFactory",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "AppFactory",
            targets: ["AppFactory"])
    ],
    dependencies: [
        .package(name: "CardDataStorage", path: "../CardDataStorage"),
        .package(name: "UserCardsAPI", path: "../UserCardsAPI"),
        .package(name: "CardDataFetcher", path: "../CardDataFetcher"),
        .package(name: "TabBarCoordinator", path: "../TabBarCoordinator"),
        .package(name: "HomeFeature", path: "../HomeFeature"),
        .package(name: "EmptyFeature", path: "../EmptyFeature")
    ],
    targets: [
        .target(
            name: "AppFactory", dependencies: [
                .product(name: "CardDataStorage", package: "CardDataStorage"),
                .product(name: "UserCardsAPI", package: "UserCardsAPI"),
                .product(name: "CardDataFetcher", package: "CardDataFetcher"),
                .product(name: "TabBarCoordinator", package: "TabBarCoordinator"),
                .product(name: "HomeFeature", package: "HomeFeature"),
                .product(name: "EmptyFeature", package: "EmptyFeature")
            ]),
        .testTarget(
            name: "AppFactoryTests",
            dependencies: ["AppFactory"])
    ])
