// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserCardsAPI",
    products: [
        .library(
            name: "UserCardsAPI",
            targets: ["UserCardsAPI"])
    ],
    targets: [
        .target(
            name: "UserCardsAPI"),
        .testTarget(
            name: "UserCardsAPITests",
            dependencies: ["UserCardsAPI"])
    ])
