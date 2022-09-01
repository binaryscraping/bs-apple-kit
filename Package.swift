// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "bs-apple-kit",
  platforms: [
    .iOS(.v16),
    .macOS(.v13),
    .macCatalyst(.v15),
    .tvOS(.v14),
    .watchOS(.v9),
  ],
  products: [
    .library(name: "ConcurrencyHelpers", targets: ["ConcurrencyHelpers"]),
    .library(name: "Prelude", targets: ["Prelude"]),
    .library(name: "SwiftUIHelpers", targets: ["SwiftUIHelpers"]),
  ],
  dependencies: [],
  targets: [
    .target(name: "ConcurrencyHelpers"),
    .target(name: "Prelude", dependencies: []),
    .testTarget(name: "PreludeTests", dependencies: ["Prelude"]),
    .target(name: "SwiftUIHelpers"),
  ]
)
