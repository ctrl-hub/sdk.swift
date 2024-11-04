// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CtrlHub",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CtrlHub",
            targets: ["CtrlHub"]),
    ],
    dependencies: [
        .package(url: "https://github.com/DataDog/swift-jsonapi.git", from: "0.1.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CtrlHub",
            dependencies: [.product(name: "JSONAPI", package: "swift-jsonapi")]
        ),
        .testTarget(
            name: "CtrlHubTests",
            dependencies: ["CtrlHub"]
        ),
    ]
)
