// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "bs-apple-kit",
  platforms: [
    .iOS(.v14),
    .macOS(.v12),
    .macCatalyst(.v13),
  ],
  products: [
    .library(name: "ConcurrencyHelpers", targets: ["ConcurrencyHelpers"]),
    .library(name: "DebuggingHelpers", targets: ["DebuggingHelpers"]),
    .library(name: "Prelude", targets: ["Prelude"]),
    .library(name: "SwiftUIHelpers", targets: ["SwiftUIHelpers"]),
    .library(name: "UIKitHelpers", targets: ["UIKitHelpers"]),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.9.0"),
    .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "0.6.0"),
    .package(url: "https://github.com/ChimeHQ/ConcurrencyPlus", from: "0.3.3"),
  ],
  targets: [
    .target(
      name: "ConcurrencyHelpers",
      dependencies: [
        .product(name: "ConcurrencyPlus", package: "ConcurrencyPlus"),
      ]
    ),
    .target(name: "DebuggingHelpers", dependencies: [.product(name: "CustomDump", package: "swift-custom-dump")]),
    .target(
      name: "Prelude",
      dependencies: []
    ),
    .testTarget(
      name: "PreludeTests",
      dependencies: ["Prelude"]
    ),
    .target(name: "SwiftUIHelpers"),
    .target(name: "TestHelpers"),
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
