// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Images",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Images",
            targets: ["Images"]),
    ],
    dependencies: [
        .package(url: "https://github.com/edsonlima19/AllConstants", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Images",
            dependencies: ["AllConstants"],
            resources: [.process("Media.xcassets")]
        ),
        .testTarget(
            name: "ImagesTests",
            dependencies: ["Images"]),
    ]
)
