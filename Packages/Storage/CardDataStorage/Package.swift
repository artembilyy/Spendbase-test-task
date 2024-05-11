// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CardDataStorage",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "CardDataStorage",
            targets: ["CardDataStorage"])
    ],
    dependencies: [
        .package(name: "UserCardsAPI", path: "../UserCardsAPI")
    ],
    targets: [
        .target(
            name: "CardDataStorage",
            dependencies: [
                .product(name: "UserCardsAPI", package: "UserCardsAPI")
            ]),
        .testTarget(
            name: "CardDataStorageTests",
            dependencies: ["CardDataStorage"])
    ])
