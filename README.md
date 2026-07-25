# IPv4 Standard

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

A unified `IPv4` standard for Swift — composes the RFC 791 address and header definitions into a single namespace, with no Foundation dependency.

## Installation

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/swift-standards/swift-ipv4-standard.git", branch: "main")
]
```

Add the product to your target:

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "IPv4 Standard", package: "swift-ipv4-standard")
    ]
)
```

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
