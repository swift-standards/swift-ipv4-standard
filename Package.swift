// swift-tools-version: 6.2
import PackageDescription

extension String {
    static let ipv4Standard = "IPv4 Standard"
    var tests: Self { "\(self) Tests" }
}

extension Target.Dependency {
    static let ipv4Standard = Self.target(name: .ipv4Standard)
    static let rfc791 = Self.product(name: "RFC 791", package: "swift-rfc-791")
}

let package = Package(
    name: "swift-ipv4-standard",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
    ],
    products: [
        .library(name: .ipv4Standard, targets: [.ipv4Standard])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-standards/swift-rfc-791", from: "0.3.0")
    ],
    targets: [
        .target(
            name: .ipv4Standard,
            dependencies: [.rfc791]
        ),
        .testTarget(
            name: .ipv4Standard.tests,
            dependencies: [.ipv4Standard]
        ),
    ],
    swiftLanguageModes: [.v6]
)
