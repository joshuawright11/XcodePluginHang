// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let targets: [Target] = (1...100)
    .map { number in
        var depCount = min(number-1, 15)
        if number == 100 {
            depCount = 99
        }
        return .target(
            name: "Target\(number)",
            dependencies: number == 1 ? [] : (1...depCount).map { Target.Dependency(stringLiteral: "Target\($0)") },
            plugins: [
                "DummyPlugin"
            ]
        )
    }

let package = Package(
    name: "BuildPluginHang",
    products: [
        .library(
            name: "Target100",
            type: .dynamic,
            targets: ["Target100"]
        ),
    ],
    targets: targets + [
        .plugin(
            name: "DummyPlugin",
            capability: .buildTool()
        )
    ]
)
