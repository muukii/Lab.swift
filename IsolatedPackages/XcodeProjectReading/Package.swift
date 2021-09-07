// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "XcodeProjectReading",
  products: [
    .executable(
      name: "XcodeProjectReading",
      targets: ["XcodeProjectReading"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/tuist/XcodeProj.git", .upToNextMajor(from: "8.0.0"))
  ],
  targets: [
    .target(
      name: "XcodeProjectReading",
      dependencies: ["XcodeProj"]
    )   
  ]
)
