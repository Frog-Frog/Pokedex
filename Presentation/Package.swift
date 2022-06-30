// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Presentation",
    products: [
        .library(
            name: "Presentation",
            targets: ["Presentation"]),
    ],
    dependencies: [
        .package(path: "Domain"),
        .package(url: "https://github.com/kean/Nuke", from: "10.11.2")
    ],
    targets: [
        .target(
            name: "Presentation",
            dependencies: []),
        .testTarget(
            name: "PresentationTests",
            dependencies: ["Presentation"]),
    ]
)
