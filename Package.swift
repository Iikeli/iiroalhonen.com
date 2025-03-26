// swift-tools-version: 5.10.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iiroalhonen-website",
    platforms: [.macOS(.v14)],
    products: [
        .library(
            name: "Website", targets: ["Website"]
        ),
    ],
    dependencies: [.package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0")],
    targets: [
        .target(name: "Website")
    ]
)
