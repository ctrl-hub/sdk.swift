// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CtrlHub",
    platforms: [
        .macOS(.v15),
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
        .package(url: "https://github.com/evgenyneu/keychain-swift.git", from: "24.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CtrlHub",
            dependencies: [
                .product(name: "JSONAPI", package: "swift-jsonapi"),
                .product(name: "KeychainSwift", package: "keychain-swift"),
            ]
        ),
        .testTarget(
            name: "CtrlHubTests",
            dependencies: ["CtrlHub"]
        ),
    ]
)
