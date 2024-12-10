// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IiroAlhonen Website",
    platforms: [.macOS(.v15)],
    products: [
        .library(
            name: "Website", targets: ["Website"]
        ),
    ],
    targets: [
        .target(name: "Website")
    ]
)
