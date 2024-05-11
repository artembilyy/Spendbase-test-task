// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LaunchSplashScreen",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "LaunchSplashScreen",
            targets: ["LaunchSplashScreen"])
    ],
    targets: [
        .target(
            name: "LaunchSplashScreen",
            path: "Sources",
            resources: [.process("Resources/Assets.xcassets")]),
        .testTarget(
            name: "LaunchSplashScreenTests",
            dependencies: ["LaunchSplashScreen"])
    ])
