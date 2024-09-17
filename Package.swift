// swift-tools-version: 5.9

import PackageDescription

#if os(macOS)
    let dependencies: [Dependency] = [.target(name: "SwiftLintBinaryMacOS")]
#else
    let dependencies: [Dependency] = [.target(name: "SwiftLintBinaryLinux")]
#endif

let package = Package(
    name: "SwiftLintPlugins",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .plugin(name: "SwiftLintBuildToolPlugin", targets: ["SwiftLintBuildToolPlugin"]),
        .plugin(name: "SwiftLintCommandPlugin", targets: ["SwiftLintCommandPlugin"]),
    ],
    targets: [
        .plugin(
            name: "SwiftLintBuildToolPlugin",
            capability: .buildTool(),
            dependencies: [.target(name: "SwiftLintBinaryMacOS")]
        ),
        .plugin(
            name: "SwiftLintCommandPlugin",
            capability: .command(
                intent: .custom(verb: "swiftlint", description: "SwiftLint Command Plugin")),
            dependencies: [.target(name: "SwiftLintBinaryMacOS")]
        ),
        .binaryTarget(
            name: "SwiftLintBinaryMacOS",
            url:
                "https://github.com/realm/SwiftLint/releases/download/0.57.0/SwiftLintBinary-macos.artifactbundle.zip",
            checksum: "a1bbafe57538077f3abe4cfb004b0464dcd87e8c23611a2153c675574b858b3a"
        ),
        .binaryTarget(
            name: "SwiftLintBinaryMacOS",
            url: "https://github.com/realm/SwiftLint/releases/download/0.57.0/swiftlint_linux.zip",
            checksum: "│def1803e705c738c97fbc275c34e7a2e0278944776a8b9c56ebe8c444ea57407"
        ),
    ]
)
