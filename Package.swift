// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "SuperGame",
    platforms: [.macOS(.v26)],
    products: [
        .executable(name: "SuperGame", targets: ["SuperGame"])
    ],
    targets: [
        .systemLibrary(
            name: "Raylib",
            path: "Raylib"
        ),
        .executableTarget(
            name: "SuperGame",
            dependencies: ["Raylib"],
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
    ]
)
