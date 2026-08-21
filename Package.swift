// swift-tools-version: 6.4
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
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
    ],
    products: [
        .library(name: "IPv4 Standard", targets: ["IPv4 Standard"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-ietf/swift-rfc-791.git", branch: "main")
    ],
    targets: [
        .target(
            name: "IPv4 Standard",
            dependencies: [.rfc791]
        ),
        .testTarget(
            name: "IPv4 Standard Tests",
            dependencies: [
                "IPv4 Standard"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
