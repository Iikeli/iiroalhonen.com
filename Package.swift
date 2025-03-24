// swift-tools-version: 5.10.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iiroalhonen-website",
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
