// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "SuperGame",
    platforms: [.macOS(.v26)],
    products: [
        .executable(name: "SuperGame", targets: ["Game"]),
        .library(name: "SuperEngine", targets: ["Engine"]),
    ],
    targets: [
        .systemLibrary(
            name: "Raylib",
            path: "Raylib"
        ),
        .target(
            name: "Engine",
            dependencies: ["Raylib"],
            path: "Sources/Engine",
            linkerSettings: [
                .unsafeFlags([
                    "-L", "Submodules/raylib/src",
                    "-lraylib",
                    "-framework", "CoreVideo",
                    "-framework", "IOKit",
                    "-framework", "Cocoa",
                    "-framework", "OpenGL",
                ])
            ]
        ),
        .executableTarget(
            name: "Game",
            dependencies: ["Engine"],
            path: "Sources/Game"
        ),
    ]
)
