// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserCardsAPI",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "UserCardsAPI",
            targets: ["UserCardsAPI"])
    ],
    dependencies: [
        .package(name: "CoreNetwork", path: "../CoreNetwork")
    ],
    targets: [
        .target(
            name: "UserCardsAPI",
            dependencies: [
                .product(name: "CoreNetwork", package: "CoreNetwork")
            ]),
        .testTarget(
            name: "UserCardsAPITests",
            dependencies: ["UserCardsAPI"])
    ])
