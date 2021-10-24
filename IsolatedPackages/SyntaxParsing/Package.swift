// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SyntaxParsing",
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "SyntaxParsing",
      targets: ["SyntaxParsing"]
    ),
    .executable(name: "Runner", targets: ["Runner"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-syntax.git", .exact("0.50500.0")),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "Runner",
      dependencies: [
        "SyntaxParsing",
        .product(name: "SwiftSyntax", package: "swift-syntax")
      ]
    ),
    .target(
      name: "SyntaxParsing",
      dependencies: []
    ),
    .testTarget(
      name: "SyntaxParsingTests",
      dependencies: ["SyntaxParsing"]
    ),
  ]
)
