// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppFactory",
    products: [
        .library(
            name: "AppFactory",
            targets: ["AppFactory"])
    ],
    targets: [
        .target(
            name: "AppFactory"),
        .testTarget(
            name: "AppFactoryTests",
            dependencies: ["AppFactory"])
    ])
