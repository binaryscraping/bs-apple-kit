// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "bs-apple-kit",
  platforms: [
    .iOS(.v14),
    .macOS(.v11),
    .macCatalyst(.v13),
  ],
  products: [
    .library(name: "ConcurrencyHelpers", targets: ["ConcurrencyHelpers"]),
    .library(name: "Prelude", targets: ["Prelude"]),
    .library(name: "SwiftUIHelpers", targets: ["SwiftUIHelpers"]),
    .library(name: "UIKitHelpers", targets: ["UIKitHelpers"]),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.9.0"),
  ],
  targets: [
    .target(name: "ConcurrencyHelpers"),
    .target(
      name: "Prelude",
      dependencies: []
    ),
    .testTarget(
      name: "PreludeTests",
      dependencies: ["Prelude"]
    ),
    .target(name: "SwiftUIHelpers"),
    .target(name: "UIKitHelpers"),
    .testTarget(
      name: "UIKitHelpersTests",
      dependencies: [
        "UIKitHelpers",
        .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
      ]
    ),
  ]
)
