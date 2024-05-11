// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreUI",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "CoreUI",
            targets: ["CoreUI"])
    ],
    dependencies: [
        .package(name: "UserCardsAPI", path: "../UserCardsAPI")
    ],
    targets: [
        .target(
            name: "CoreUI", dependencies: [
                .product(name: "UserCardsAPI", package: "UserCardsAPI")
            ]),
        .testTarget(
            name: "CoreUITests",
            dependencies: ["CoreUI"])
    ])
