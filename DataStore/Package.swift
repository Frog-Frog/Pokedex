// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataStore",
    products: [
        .library(
            name: "DataStore",
            targets: ["DataStore"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.6.1"),
        .package(url: "https://github.com/kean/Nuke", from: "10.11.2")
    ],
    targets: [
        .target(
            name: "DataStore",
            dependencies: []),
        .testTarget(
            name: "DataStoreTests",
            dependencies: ["DataStore"])
    ]
)
