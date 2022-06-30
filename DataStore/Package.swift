// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataStore",
    platforms: [.iOS("13.0")],
    products: [
        .library(
            name: "DataStore",
            targets: ["DataStore"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.5.0"),
        .package(url: "https://github.com/kean/Nuke", from: "10.5.2")
    ],
    targets: [
        .target(
            name: "DataStore",
            dependencies: [
                "Alamofire",
                "Nuke"
            ]),
        .testTarget(
            name: "DataStoreTests",
            dependencies: ["DataStore"])
    ]
)
