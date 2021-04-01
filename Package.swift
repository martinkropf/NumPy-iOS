// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NumPy-iOS",
    products: [
        .library(
            name: "NumPy-iOS",
            targets: ["libnumpy", "libnpymath", "libnpysort", "Link", "NumPySupport"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kewlbear/Python-iOS.git", .branch("kivy-ios")),
    ],
    targets: [
        .binaryTarget(name: "libnumpy", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210401141025/libnumpy.xcframework.zip", checksum: "6ef121dbb558d8d7f6bc30e5ab1d190452ae3099b499560263ae1c4d36ec23ef"),
        .binaryTarget(name: "libnpymath", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210401141025/libnpymath.xcframework.zip", checksum: "28febeb4d51b42d5ca2ce68e90169eebc88e75068db4d5970c948b3b4e3cdd61"),
        .binaryTarget(name: "libnpysort", url: "https://github.com/kewlbear/NumPy-iOS/releases/download/0.0.20210401141025/libnpysort.xcframework.zip", checksum: "e10367f3012681dc38619d7f4f6168c89b10208fc367ff8f04609e917b6b943f"),
        .target(
            name: "Link",
            dependencies: ["libnumpy", "libnpymath", "libnpysort", "Python-iOS"],
            linkerSettings: [.linkedFramework("Accelerate")]),
        .target(
            name: "NumPySupport",
            dependencies: ["Python-iOS"],
            resources: [.copy("site-packages")]),
        .testTarget(
            name: "NumPy-iOSTests",
            dependencies: ["NumPySupport"]),
    ]
)
