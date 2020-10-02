// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "FBSnapshotTestCase",
    platforms: [
        .iOS(.v10),
        .tvOS(.v10)
    ],
    products: [
        .library(name: "FBSnapshotTestCase", targets: ["FBSnapshotTestCase"]),
        .library(name: "FBSnapshotTestCaseSwift", targets: ["FBSnapshotTestCaseSwift"])
    ],
    targets: [
        .target(
            name: "FBSnapshotTestCase",
            path: "FBSnapshotTestCase",
            exclude: ["SwiftSupport.swift"],
            cxxSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("Categories")
            ],
            linkerSettings: [
                .linkedFramework("XCTest")
            ]),
        .target(
            name: "FBSnapshotTestCaseSwift",
            dependencies: ["FBSnapshotTestCase"],
            path: "FBSnapshotTestCase",
            sources: [
                "SwiftSupport.swift"
            ])
    ]
)
