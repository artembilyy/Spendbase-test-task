// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CardDataFetcher",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "CardDataFetcher",
            targets: ["CardDataFetcher"])
    ],
    dependencies: [
        .package(name: "CardDataStorage", path: "../CardDataStorage"),
        .package(name: "UserCardsAPI", path: "../UserCardsAPI")
    ],
    targets: [
        .target(
            name: "CardDataFetcher",
            dependencies: [
                .product(name: "CardDataStorage", package: "CardDataStorage"),
                .product(name: "UserCardsAPI", package: "UserCardsAPI")
            ]),
        .testTarget(
            name: "CardDataFetcherTests",
            dependencies: ["CardDataFetcher"])
    ])
