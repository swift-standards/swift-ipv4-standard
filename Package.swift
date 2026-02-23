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
        .watchOS(.v26)
    ],
    products: [
        .library(name: "IPv4 Standard", targets: ["IPv4 Standard"])
    ],
    dependencies: [
        .package(path: "../swift-rfc-791")
    ],
    targets: [
        .target(
            name: "IPv4 Standard",
            dependencies: [.rfc791]
        )
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableExperimentalFeature("SuppressedAssociatedTypesWithDefaults"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
