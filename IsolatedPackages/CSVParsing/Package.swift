// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CSVParsing",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CSVParsing",
            targets: ["CSVParsing"]),
    ],
    dependencies: [
      .package(url: "https://github.com/swiftcsv/SwiftCSV.git", .exact("0.6.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CSVParsing",
            dependencies: ["SwiftCSV"]),
        .testTarget(
            name: "CSVParsingTests",
            dependencies: ["CSVParsing"]),
    ]
)
