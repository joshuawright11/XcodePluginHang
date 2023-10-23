// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let targets: [Target] = (1...100).map { number in
    var dependencies: [Target.Dependency] = []
    
    // Have the 100th target depend on all other targets.
    if number == 100 {
        dependencies = (1...99)
            .map { "Target\($0)" }
            .map { Target.Dependency(stringLiteral: $0) }
    }
    
    return .target(
        name: "Target\(number)",
        dependencies: dependencies,
        plugins: [
            /*
             
             Comment out this string to see the ~5.3s hang before each build (on 2023 M2 Max) disappear.
             
             NOTE: The hang doesn't happen if each target has a single file in it. Perhaps this is somehow related
             to an inefficient file search algo?
             
             */
            "DummyPlugin"
        ]
    )
}

let package = Package(
    name: "BuildPluginHang",
    products: [
        .library(
            name: "Target100",
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
