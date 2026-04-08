// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TOFAColorSystem",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "TOFAColorSystem",
            targets: ["TOFAColorSystem"]
        )
    ],
    targets: [
        .target(
            name: "TOFAColorSystem",
            path: "Sources/TOFAColorSystem"
        )
    ]
)
