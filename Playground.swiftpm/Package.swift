// swift-tools-version: 5.7

import PackageDescription
import AppleProductTypes

let package = Package(
  name: "PlaygroundApp",
  platforms: [
    .iOS("14.0")
  ],
  products: [
    .iOSApplication(
      name: "PlaygroundApp",
      targets: ["App"],
      displayVersion: "1.0.0",
      bundleVersion: "1.0.0",
      supportedDeviceFamilies: [
        .phone
      ],
      supportedInterfaceOrientations: [
        .portrait
      ]
    )
  ],
  dependencies: [
    .package(name: "App", path: "../")
  ],
  targets: [
    .executableTarget(
      name: "PlaygroundApp"
    )
  ]
)
