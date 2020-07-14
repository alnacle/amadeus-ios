// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Amadeus",
    products: [
        .library(
            name: "Amadeus",
            targets: ["Amadeus"]
        ),
    ],
    targets: [
        .target(
            name: "Amadeus"
        ),
        .testTarget(
            name: "AmadeusTests",
            dependencies: ["Amadeus"]
        ),
    ]
)
