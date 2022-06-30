// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS("13.0")],
    products: [
        .library(
            name: "Domain",
            targets: ["Domain"])
    ],
    dependencies: [
        .package(path: "DataStore")
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: [
                "DataStore"
            ]),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"])
    ]
)
