// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CtrlHubAPI",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CtrlHubAPI",
            targets: ["CtrlHubAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.10.1"),
        .package(url: "https://github.com/DataDog/swift-jsonapi.git", from: "0.1.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CtrlHubAPI"),
        .testTarget(
            name: "CtrlHubAPITests",
            dependencies: ["CtrlHubAPI"]
        ),
    ]
)
